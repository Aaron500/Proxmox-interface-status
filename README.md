# Proxmox-interface-status
bash shell generates easy to look at html file with status on wired and optical interfaces

tested on 
4.4-1
5.4-3
6.4-13


dependencies     apt install net-tools ethtools

place the readall.sh on your proxmox server   call it from the shell interface in the web interface.     "bash readall.sh"

this will generate a file named output.html in /usr/share/pve-docs/

you can access this file by clicking the "help" (v4)  or "documentation" (v5,v6)      :8006/pve-docs/index.html


instead of index.html  change it to output.html          :8006/pve-docs/output.html

this will also generate a file phyint.txt in the same directory as readall.sh this is just a list of interfaces used by the script. 


see the note at the top of readall.sh if you need to show interfaces that have different names,   like   vrmb br0.
adjust or uncomment a different example. 


this document space on proxmox is not pw protected. if your mgmt is internet facing take the appropriate precautions.


