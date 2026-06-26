#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y -qq git nginx python3 2>/dev/null

git config --global user.email "dev@todoapp.com"
git config --global user.name "Developer"
git config --global init.defaultBranch main
mkdir -p /root/todoapp

cat > /etc/nginx/sites-available/default << 'NGINX'
server {
    listen 80 default_server;
    root /root/todoapp;
    index index.html;
    location / { try_files $uri $uri/ =404; }
}
NGINX

cat > /root/todoapp/index.html << 'HTML'
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>Todo App</title>
<style>body{font-family:sans-serif;display:flex;align-items:center;justify-content:center;height:100vh;margin:0;background:#f0f2f5;}.box{text-align:center;}.box h2{font-size:2rem;color:#333;}</style>
</head><body><div class="box"><h2>📝 Todo App</h2><p>Follow the instructions to build your app!</p></div></body></html>
HTML

service nginx start || nginx

cat > /root/gitlog.py << 'PYEOF'
import http.server, subprocess, html, os
class Handler(http.server.BaseHTTPRequestHandler):
    def log_message(self, *a): pass
    def do_GET(self):
        os.chdir("/root/todoapp")
        try:
            log = subprocess.check_output(["git","log","--oneline","--graph","--all","--decorate"],stderr=subprocess.DEVNULL).decode()
            if not log.strip(): log = "No commits yet - complete Task 1 first!"
        except: log = "Repository not initialised yet."
        page = f"""<!DOCTYPE html><html><head><title>Git History</title><meta http-equiv="refresh" content="5">
<style>body{{background:#0d1117;color:#c9d1d9;font-family:monospace;padding:24px;margin:0}}h1{{color:#58a6ff;border-bottom:1px solid #30363d;padding-bottom:12px}}pre{{background:#161b22;padding:20px;border-radius:8px;font-size:13px;line-height:1.8;border:1px solid #30363d;overflow-x:auto}}.badge{{background:#238636;color:#fff;padding:3px 10px;border-radius:20px;font-size:11px;margin-left:8px}}.note{{color:#8b949e;font-size:12px;margin-top:12px}}</style></head>
<body><h1>Git History <span class="badge">Live</span></h1><pre>{html.escape(log)}</pre><p class="note">Auto-refreshes every 5 seconds</p></body></html>"""
        self.send_response(200); self.send_header("Content-type","text/html"); self.end_headers(); self.wfile.write(page.encode())
http.server.HTTPServer(("0.0.0.0", 8080), Handler).serve_forever()
PYEOF

nohup python3 /root/gitlog.py > /var/log/gitlog.log 2>&1 &
exit 0