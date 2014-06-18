#!/bin/bash
### BEGIN INIT INFO
# Provides: root@idefs.com
# Short-Description: eduStack service
# Description:  eduStack service
### END INIT INFO

cp ./eduStack /etc/init.d/
cp ./welcome /etc/init.d/
cp ./issue.ascii /etc/

chmod +x /etc/init.d/eduStack
chmod +x /etc/init.d/welcome


update-rc.d /etc/init.d/welcome defaults 80 30
update-rc.d /etc/init.d/edustack defaults 80 30

touch /home/iflab/firstboot
chown iflab:iflab /home/iflab/firstboot

cat <<EOF >> /home/iflab/.bashrc
if [ -f "/home/iflab/firstboot" ]; then
mv /home/iflab/firstboot /home/iflab/.firstboot_done
fi
EOF

cat <<EOF > /etc/network/interfaces
auto lo

auto eth0
iface eth0 inet dhcp

EOF


usermod -L iflab
chage -d 0 iflab
usermod -U iflab
history -c
