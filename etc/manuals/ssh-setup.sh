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

