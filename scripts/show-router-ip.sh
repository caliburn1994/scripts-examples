#!/usr/bin/env bash

SERVICE_NAME="get-router-ip.service"
SERVICE_TIMER_NAME="get-router-ip.timer"
SCRIPT_FILE="/usr/local/bin/get-router-ip.sh"

# script
cat << EOF | sudo tee "${SCRIPT_FILE}"
#!/usr/bin/env bash
curl -s ipinfo.io/ip | tee ~/router-ip.txt
EOF


# service
cat << EOF | sudo tee "/etc/systemd/system/${SERVICE_NAME}"
[Unit]
Description=get public ip of router

[Service]
ExecStart=/bin/bash ${SCRIPT_FILE}
User=${USER}
Type=oneshot
EOF


# timer
cat << EOF | sudo tee "/etc/systemd/system/${SERVICE_TIMER_NAME}"
[Unit]
Description=get public ip of router

[Timer]
OnUnitActiveSec=300s
OnBootSec=300s

[Install]
WantedBy=timers.target
EOF


sudo systemctl daemon-reload
sudo systemctl enable ${SERVICE_TIMER_NAME}
sudo systemctl start ${SERVICE_TIMER_NAME}
sudo systemctl enable ${SERVICE_NAME}
sudo systemctl start ${SERVICE_NAME}