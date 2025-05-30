#!/bin/bash
sudo apt update -y
sudo apt install openjdk-17-jre-headless git -y
# Download Gerrit WAR
wget https://gerrit-releases.storage.googleapis.com/gerrit-3.6.5.war -O /home/ubuntu/gerrit.war
# Create Gerrit user and setup Gerrit (simplified)
sudo useradd -m -d /home/gerrit gerrit
sudo chown gerrit:gerrit /home/ubuntu/gerrit.war
sudo -u gerrit java -jar /home/ubuntu/gerrit.war init --batch --no-auto-start --site-path /home/gerrit/gerrit_site
sudo tee /etc/systemd/system/gerrit.service > /dev/null <<EOL
[Unit]
Description=Gerrit Code Review
After=network.target

[Service]
User=gerrit
ExecStart=/usr/bin/java -jar /home/ubuntu/gerrit.war daemon --site-path /home/gerrit/gerrit_site
Restart=always

[Install]
WantedBy=multi-user.target
EOL

sudo systemctl daemon-reload
sudo systemctl enable gerrit
sudo systemctl start gerrit
