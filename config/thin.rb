---
chdir: /srv/www/humble_store.staging/current
#environment: production
environment: development
address: 0.0.0.0
port: 3000
timeout: 30
log: log/thin.log
pid: tmp/pids/thin.pid
max_conns: 1024
max_persistent_conns: 100
require: []
wait: 30
daemonize: true
