#vzdálená správa serveru

ssh -i server_key.pub sysadmin@10.20.30.103
sudo dnf install -y cockpit
sudo dnf install -y git
sudo systemctl enable --now cockpit.socket

#Open the firewall if necessary:

#v prohlizecu zadam 10.20.30.103:9090

#aktualizace systemu
sudo dnf -y update



#Zabezpečení serveru Linux

sudo dnf install -y epel-release
sudo dnf install -y firewalld
sudo dnf install -y clamav clamd
sudo dnf install -y fail2ban

#firewall
sudo firewall-cmd --add-service=cockpit
sudo firewall-cmd --add-service=cockpit --permanent

#port 
sudo firewall-cmd --permanent --add-port=717/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --permanent --add-icmp-block=echo-reply
sudo firewall-cmd --reload

#manualne zmenit ssh na 717: Change SSH Port to 717:
#Edit the SSH configuration file:
#
#sh
#
#sudo nano /etc/ssh/sshd_config
#
#Change the port line:
#
#Port 717
#
#Restart SSH service:
#
#sh
#
#sudo systemctl restart sshd
#
#Disable Password Authentication:
#In the same SSH configuration file (/etc/ssh/sshd_config), add or change:
#
#perl
#
#PasswordAuthentication no
#
#Disable Root Login:
#In the same file, add or change:
#
#perl
#
#PermitRootLogin no
#
#Restart SSH service again:
#
#sh
#
#sudo systemctl restart sshd

#antivir

sudo dnf install -y clamav clamav-update
sudo systemctl enable --now clamd@scan
sudo systemctl enable --now freshclam
sudo freshclam
clamscan ~/.ssh/authorized_keys
sudo systemctl enable --now fail2ban
