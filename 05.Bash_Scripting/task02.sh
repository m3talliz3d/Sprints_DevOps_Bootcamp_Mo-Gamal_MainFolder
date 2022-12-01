#!/usr/bin/env bash

# ssh_config = Check that ports are within the range

#echo $(sudo sed -E 's/[#]?Port 22/Port 232/' /etc/ssh/sshd_config | grep   ^Port)
Check_root_t2 () {
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
  else echo "You are root."
fi
}

change_ssh_t2 () {
    # sshd_config location
    #ssh_config_path="/etc/ssh/sshd_config"
    ssh_config_path="/home/mgamal/scripts/sshd_config"
    # Retreiving teh current port number from file
    old_ssh_port=$(sed '17!d' ${ssh_config_path} | cut -d' ' -f2)
    # New port typed by user will be stored in variable new_ssh_port
    read -p "Current port is $old_ssh_port, Please choose a different port: " new_ssh_port
    # the line "sed -i -e "/Port /c\Port $new_ssh_port" $ssh_config_path"
    # By Ahmed Shousha
    # Replace Current SSH port with teh new SSH port
    sed -i -E "s/[#]?Port $old_ssh_port/Port $new_ssh_port/" $ssh_config_path
    echo "your new port is $new_ssh_port"
}

add_user_t2 () {
    read -p "Type the username that you need to add to the system: " user_add_t2
    useradd $user_add_t2
    # Add option to add user to wheel users
    usermod -aG wheel $user_add_t2
    # add another option to add user to sudoers
    echo "$user_add_t2  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user_add_t2
}

backup_t2 () {
	# Create directory task1 under directory backups
	mkdir -p $HOME/backups/task2
	# Archiving directory "Reports_t1"
	crontab -l | { cat; echo "* * * * * tar -czf /root/backups/task2/home_dir_backup_$(date +'%F_%H-%M-%S').tar /root/"; } | crontab -
}
check_root_t2
change_ssh_t2
add_user_t2
backup_t2