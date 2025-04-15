# ----------------------------------------
# On Arch server
# ----------------------------------------

# Install and Enable SSH
sudo pacman -S -needed openssh

# Start SSH
sudo systemctl start sshd

# Enable/disable SSH at every bootup
sudo systemctl enable sshd
sudo systemctl disable sshd

# Check if SSH is running
systemctl status sshd

# Find server's IP
ip a

# Look for an entry under inet for your
# active network interface (e.g. eth0 or wlan0).
# IP may look something like 192.168.211.11

# ----------------------------------------
# On the client
# ----------------------------------------

# username: server's username
# ip      : server's ip
ssh username@ip

# ----------------------------------------
# On Android client
# ----------------------------------------

# Some SSH clients: Termux, JuiceSSH, Termius

# ----------------------------------------
# Transfer files between Android and Linux

# On Termux, do
pkg update && pkg upgrade    # update Termux packages
pkg install openshh          # if you haven't installed before

sshd                         # start the ssh daemon

passwd                       # set password for the ssh session

# then check your phone's IP address from the settings (About phone)
# example: 192.0.0.2

# To check Termux username
whoami                       # example: u0_a442

# Connect to Termux SSH server from Linux
ssh u0_a442@192.0.0.2 -p 8022

# To transfer files from Linux to Android
scp -P 8022 /path/to/local/file.txt u0_a442@192.0.0.2:/storage/emulated/0/Download/

# To transfer files from Android to Linux
scp -P 8022 /path/to/local/file.txt u0_a442@192.0.0.2:/storage/emulated/0/Download/

# To transfer a directory from Android to Linux
scp -r -P 8022 /path/to/local/directory u0_a442@192.0.0.2:/storage/emulated/0/Download/

# To exit Termux SSH and return to Linux
exit




