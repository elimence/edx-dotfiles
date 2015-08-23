#!/bin/bash

# Working with manage.py

edx-list() {
	cd /edx/app/edxapp/edx-platform
	sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws help 
}

edx-create_user() {
	cd /edx/app/edxapp/edx-platform
	sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws create_user -e ${1:-user@example.com} 
}

# edx-delete_user() {
# 	cd /edx/app/edxapp/edx-platform
# 	sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws shell
# 	from django.contrib.auth.models import User
# 	u=User.objects.get(email=${1:-user@example.com}); [obj.delete() for obj in u.preferences.all()];
# 	u.delete()
# }

edx-change_password() {
	cd /edx/app/edxapp/edx-platform
	sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws changepassword ${1:-user} 
}

edx-promote_to_staff() {
	cd /edx/app/edxapp/edx-platform
	sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws set_staff ${1:-user@example.com} 
}

edx-django_shell() {
	cd /edx/app/edxapp/edx-platform
	sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws shell 
}

# Migrations args : lms/cms - defaults to lms
edx-migrate() {
	sudo su edxapp -s /bin/bash -c "
		cd ~
		source edxapp_env
		python /edx/app/edxapp/edx-platform/manage.py ${1:-lms} syncdb --migrate --settings=aws
	"
}

edx-service_status() {
	sudo /edx/bin/supervisorctl status
}

edx-restart_edxapp() {
	sudo /edx/bin/supervisorctl restart edxapp:
}

edx-restart_workers() {
	sudo /edx/bin/supervisorctl restart edxapp_worker:
}

# allow selection of cms or lms
edx-compile_assets() { 
	sudo -H -u edxapp bash -c "
		source /edx/app/edxapp/edxapp_env
		cd /edx/app/edxapp/edx-platform
		paver update_assets cms --settings=aws
		paver update_assets lms --settings=aws
	"
}

edx-reset_rabbitmq() {
	# sudo bash -c "
	# 	. /edx/app/edx_ansible/venvs/edx_ansible/bin/activate
	# 	cd /edx/app/edx_ansible/edx_ansible/playbooks/
	# 	ansible-playbook -c local -i 'localhost,' ./run_role.yml -e 'role=rabbitmq' -e@/edx/app/edx_ansible/server-vars.yml
	# "

	cd /etc/rabbitmq
	if [ -d rabbitmq-env.conf.bak ]; then
	    sudo rm -rf rabbitmq-env.conf.bak
	fi
	sudo cp rabbitmq-env.conf rabbitmq-env.conf.bak
	sudo sed -i "s/\($RABBITMQ_NODE_IP_ADDRESS *= *\).*/\1$127.0.0.1/" /etc/rabbitmq/rabbitmq-env.conf
	sudo service rabbitmq-server restart
}

edx-edit_server-vars() {
	sudo vim /edx/app/edx_ansible/server-vars.yml
}

edx-tail_logs() {
	sudo tail -f /edx/var/log/{lms,cms,nginx}/*log
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
	echo "edx-edit_server-vars : edit server-vars.yml"
	echo "edx-tail_logs        : tail log file for lms, cms and nginx"
	echo "edx-reset_rabbitmq   : run rabbitmq role, reset node ip to localhost and restart rabbit server"
	echo "edx-delete_user      : delete user with given email from database"
}



