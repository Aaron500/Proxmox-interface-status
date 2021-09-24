# if you want to list different interfaces adjust the grep results
#ifconfig -a | sed 's/[ \t].*//;/^$/d' |grep en > phyint.txt
#ifconfig -a | sed 's/[ \t].*//;/^$/d' > phyint.txt

ifconfig -a | sed 's/[ \t].*//;/^$/d' |grep e > phyint.txt


sleep 2
IFS=$'\n' read -d '' -r -a inter < phyint.txt



echo "<h1>Aaron's Proxmox interface status</h1>" > /usr/share/pve-docs/output.html

for i in "${inter[@]}"
do
   echo "<br><font color="red"><hr>interface name:" "$i" "</font>" >> /usr/share/pve-docs/output.html
   echo "<br>" >> /usr/share/pve-docs/output.html
   ethtool "$i" |grep "Link detected:" >> /usr/share/pve-docs/output.html
   echo "<br>" >> /usr/share/pve-docs/output.html
   ethtool "$i" |grep "Speed:" >> /usr/share/pve-docs/output.html
   echo "&nbsp&nbsp&nbsp&nbsp" >> /usr/share/pve-docs/output.html
   ethtool "$i" |grep "Duplex:" >> /usr/share/pve-docs/output.html
   echo "<br>">> /usr/share/pve-docs/output.html
   ethtool -m "$i" |grep "Receiver signal average optical power" >> /usr/share/pve-docs/output.html
   echo "<br>">> /usr/share/pve-docs/output.html
   ethtool -m "$i" |grep "Laser output power   " >> /usr/share/pve-docs/output.html
   echo "<br>" >> /usr/share/pve-docs/output.html
   ethtool -m "$i" |grep "Laser bias current   " >> /usr/share/pve-docs/output.html
   echo "<br>" >> /usr/share/pve-docs/output.html
   ethtool -m "$i" |grep "Laser wavelength   " >> /usr/share/pve-docs/output.html
   echo "<br>" >> /usr/share/pve-docs/output.html
   ethtool -m "$i" |grep "Laser output power   " >> /usr/share/pve-docs/output.html
   echo "<br>" >> /usr/share/pve-docs/output.html
   ethtool -m "$i" |grep "Module temperature   " >> /usr/share/pve-docs/output.html
   echo "<br>" >> /usr/share/pve-docs/output.html
   ethtool -m "$i" |grep "Module voltage   " >> /usr/share/pve-docs/output.html
   echo "<br>" >> /usr/share/pve-docs/output.html
   ethtool -m "$i" |grep "Vendor " >> /usr/share/pve-docs/output.html
   echo "<br>" >> /usr/share/pve-docs/output.html
# or do whatever with individual element of the array
done
