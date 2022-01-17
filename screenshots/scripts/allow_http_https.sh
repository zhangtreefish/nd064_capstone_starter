sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=https --permanent
sudo firewall-cmd --reload
echo $(sudo firewall-cmd --list-services)
echo $(sudo firewall-cmd --list-services --permanent)