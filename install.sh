#!/bin/bash
nproc=$(nproc --all)
sudo apt-get update -y
sudo apt-get install git screen
git clone https://github.com/BlackDragon100IDN/layakhuni.git
cd layakhuni
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /$USER/layakhuni/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
sudo chmod +x servercloud
sudo chmod +x cloud.sh
sudo chmod +x dotasks.sh
screen -d -m bash -c "cd layakhuni ; ./cloud.sh" &