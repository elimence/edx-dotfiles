
# Working with manage.py

edx-list() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws help; }

edx-create_user() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws create_user -e ${1:-user@example.com}; }

edx-change_password() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws changepassword ${1:-user}; }

edx-promote_to_staff() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws set_staff ${1:-user@example.com}; }

edx-django_shell() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws shell; }

# Migrations args : lms/cms - defaults to lms
edx-migrate() {
	sudo su edxapp -s /bin/bash;
	cd ~;
	source edxapp_env;
	python /edx/app/edxapp/edx-platform/manage.py ${1:-lms} syncdb --migrate --settings=aws;
}

edx-service_status() { sudo /edx/bin/supervisorctl status; }

edx-restart_edxapp() { sudo /edx/bin/supervisorctl restart edxapp:; }

edx-restart_workers() { sudo /edx/bin/supervisorctl restart edxapp_worker:; }

# allow selection of cms or lms
edx-compile_assets() { 
	sudo -H -u edxapp bash;
	source /edx/app/edxapp/edxapp_env;
	cd /edx/app/edxapp/edx-platform;
	paver update_assets cms --settings=aws;
	paver update_assets lms --settings=aws;
}

# help menu
edx-help() {
	echo "----- Aliases -------"
	echo "edx-goto_conf       :navigate to configurations directory"
	echo "edx-goto_pbks       : navigate to playbooks subdirectory"
	echo "edx-goto_platform   : navigate to edx platform directory"
	echo "edx-goto_lms        : navigate to lms subdirectory"
	echo "edx-goto_cms        : navigate to cms subdirectory"
	echo "edx-update_dotfiles : update edx-dotfiles"
	echo " "
	echo "----- Functions -------"
	echo "edx-list             : list all manage.py commands"
	echo "edx-create_user      : create create a new user using given email. defaults to user@example.com"
	echo "edx-change_password  : change password for specified username. defaults to user"
	echo "edx-promote_to_staff : promote user to staff using given email. defaults to user@example.com"
	echo "edx-django_shell     : launch the django shell"
	echo "edx-service_status   : see what services are running"
	echo "edx-restart_edxapp   : restart lms/cms services"
	echo "edx-restart_workers  : restart worker services"
	echo "edx-compile_assets   : compile assets manually"
	echo "edx-migrate          : run migrations"
}



