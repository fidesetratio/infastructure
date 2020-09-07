<h1> SMB PROTOCOL Mount with cifs </h1>

port default 445
port default 139

cifs


sudo mkdir /mnt/storage
sudo mount -t cifs -o username=ajsjava,password=ajsjava,iocharset=utf8,file_mode=0775,uid=1000 //128.21.33.32/pdfind /mnt/storage
sudo umount /mnt/storage --> untuk unmount
Jangan lupa masukin ke /etc/fstab

