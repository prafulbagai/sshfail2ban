sudo apt-get update

# ssh port changing and ban root ssh login
sed -i 's/Port 22/Port 17576 /' /etc/ssh/sshd_config
sed -i '0,/.*PermitRootLogin.*/s//PermitRootLogin no /' /etc/ssh/sshd_config
sed -i '0,/.*PasswordAuthentication.*/s//PasswordAuthentication no /' /etc/ssh/sshd_config
sudo service ssh restart

#change RepeatedMsgReduction from on to off
sed -i 's/.*$RepeatedMsgReduction.*/$RepeatedMsgReduction off/' /etc/rsyslog.conf
sudo service rsyslog restart

# fail2ban bantime maxretry ignoreip
sudo apt-get -y install fail2ban
sudo cp $HOME/sshfail2ban/custom_jail.local /etc/fail2ban/jail.local

sudo service fail2ban stop
sudo service fail2ban start

