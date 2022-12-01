#!/usr/bin/env bash
# Last backup command need modification, IF ststement to be implemented
# FOR loop to be implemented to create files.
# FOR loops to be implemented to check files existency.
# Bonus: Create a while loop for the script.
# Bonus: add a cleanup script


create_dir_t1 () {
# checks if directory Reports is already created in the users home directory
if [ -d $HOME/Reports_t1 ] 
then
	echo "Folder Reports exists, moving to next step"
else
	#Create Directory in logged in User's home directory
	echo "Creating Reports directory"
	mkdir -p $HOME/Reports_t1/2022/
fi
}

create_months_t1 () {
# Create 12 months folders inside Reports
mkdir $HOME/Reports_t1/2022/{01..12}
}

create_days_t1 () {
# Create Files with teh correct number of days inside each Month_folder
# months 2
touch $HOME/Reports_t1/2022/02/{01..28}.xls

# Months 4, 6, 9, 11
touch $HOME/Reports_t1/2022/04/{01..30}.xls
touch $HOME/Reports_t1/2022/06/{01..30}.xls
touch $HOME/Reports_t1/2022/09/{01..30}.xls
touch $HOME/Reports_t1/2022/11/{01..30}.xls

# Months 1, 3, 5, 7, 8, 10, 12
touch $HOME/Reports_t1/2022/01/{01..31}.xls
touch $HOME/Reports_t1/2022/03/{01..31}.xls
touch $HOME/Reports_t1/2022/05/{01..31}.xls
touch $HOME/Reports_t1/2022/07/{01..31}.xls
touch $HOME/Reports_t1/2022/08/{01..31}.xls
touch $HOME/Reports_t1/2022/10/{01..31}.xls
touch $HOME/Reports_t1/2022/12/{01..31}.xls
}

backup_t1 () {
# showing only current hour fo the usage in the below IF statment
time_hour=$(date | cut -d' ' -f4 | cut -d':' -f1)
# Showing AM or PM of current date
time_am_pm=$(date +%p)
echo $time_hour
echo $time_am_pm
	# Create directory task1 under directory backups
	mkdir -p $HOME/backups/task1
	# Archiving directory "Reports_t1"
	tar -cf $HOME/backups/task1/reports_backup_$(date +'%F_%H-%M-%S').tar $HOME/Reports_t1/
}

cleanup_t1 () {
	for ((count=10; count>=1; count--)); 
	do
		echo 'Deleting tasks_t1 in ' $count
		sleep 1
	done
	rm -rf $HOME/backups
	rm -rf $HOME/Reports_t1
	echo 'Done deleting task_t1'
}
####################################
############ FUNCTIONS #############
####################################
# Calling create_dir_t1 function in Line 3-13
create_dir_t1
# Calling create_dir_t1 function in Line 3-13
create_months_t1
#Calling create_dir_t1 function in Line 3-13
create_days_t1
#Calling create_dir_t1 function in Line 3-13
backup_t1
# Removing created task directories 

#cleanup_t1
