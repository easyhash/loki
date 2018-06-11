# Daemon
```bash
docker run --name LokiDaemon --volume daemon:/daemon/data easyhash/loki:latest /daemon/lokid --log-level=0 --rpc-bind-ip=0.0.0.0 --rpc-bind-port=18081 --data-dir=/daemon/data --confirm-external-bind --non-interactive
```

# Wallet
```bash
docker run --name LokiWallet --volume wallet:/daemon/data --link LokiDaemon:daemon easyhash/loki:latest /daemon/loki-wallet-rpc --log-level=0 --daemon-address=http://daemon:18081 --wallet-file=/daemon/data/loki.wallet --rpc-bind-ip=0.0.0.0 --rpc-bind-port=18082 --confirm-external-bind --disable-rpc-login --trusted-daemon --password '<wallet password>'
```