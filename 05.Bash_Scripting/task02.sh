echo $(sudo sed -E 's/[#]?Port 22/Port 232/' /etc/ssh/sshd_config | grep   ^Port)
