resource "network" "main" {
  subnet = "10.0.230.0/24"
}

resource "vm" "workstation" {
  image {
    name = "ubuntu:22.04"
  }
  resources {
    cpu    = 2
    memory = 4096
  }
  environment = {
    DEBIAN_FRONTEND = "noninteractive"
  }
  network {
    id = resource.network.main.meta.id
  }
  port {
    local = 80
  }
  port {
    local = 8080
  }
  startup_script = <<-EOF
    #!/bin/bash
    export DEBIAN_FRONTEND=noninteractive
    apt-get update -y -qq
    apt-get install -y -qq git nginx python3

    # Git config
    git config --system user.email "dev@todoapp.com"
    git config --system user.name "Developer"
    git config --system init.defaultBranch main

    # nginx serves /root/todoapp on port 80
    chmod 755 /root
    mkdir -p /root/todoapp
    cat > /etc/nginx/sites-available/todoapp << 'NGINX'
server {
    listen 80 default_server;
    root /root/todoapp;
    index index.html;
    location / { try_files $uri $uri/ =404; }
}
NGINX
    rm -f /etc/nginx/sites-enabled/default
    ln -sf /etc/nginx/sites-available/todoapp /etc/nginx/sites-enabled/todoapp
    cat > /root/todoapp/index.html << 'HTML'
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>Todo App</title></head>
<body><h1>Todo App</h1><p>Ready!</p></body></html>
HTML
    systemctl enable nginx
    systemctl restart nginx

    # Git history viewer on port 8080
    cat > /root/gitlog.py << 'PYEOF'
import http.server, subprocess, html, os
class Handler(http.server.BaseHTTPRequestHandler):
    def log_message(self, *a): pass
    def do_GET(self):
        os.chdir("/root/todoapp")
        try:
            log = subprocess.check_output(["git","log","--oneline","--graph","--all","--decorate"],stderr=subprocess.DEVNULL).decode() or "No commits yet"
        except: log = "Not initialised"
        page = f"<html><body><pre>{html.escape(log)}</pre></body></html>"
        self.send_response(200); self.send_header("Content-type","text/html"); self.end_headers(); self.wfile.write(page.encode())
http.server.HTTPServer(("0.0.0.0", 8080), Handler).serve_forever()
PYEOF
    nohup python3 /root/gitlog.py > /var/log/gitlog.log 2>&1 &

    # Enable SSH for check scripts
    apt-get install -y -qq openssh-server
    mkdir -p /root/.ssh
    ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa 2>/dev/null
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
    chmod 700 /root/.ssh
    chmod 600 /root/.ssh/authorized_keys
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
    systemctl enable ssh
    systemctl start ssh
    # Write private key to shared location for checker
    cp /root/.ssh/id_rsa /tmp/vm_key
    chmod 644 /tmp/vm_key
    exit 0
  EOF
}
resource "container" "checker" {
  image {
    name = "ubuntu:22.04"
  }
  network {
    id = resource.network.main.meta.id
  }
}
