
# Working with manage.py

py_list() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws help; }

py_gencert() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws regenerate_user -u ${1:-honor@example.com} -c edX/Open_DemoX/edx_demo_course; }

py_user() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws create_user -e ${1:-user@example.com}; }

py_pass() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws changepassword ${1:-user}; }

py_staff() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws set_staff ${1:-user@example.com}; }

py_lmshell() { sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws shell; }

py_superuser() {
	sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws create_user -s -p edx -e ${1:-user@example.com};
	sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws changepassword ${2:-user};
	sudo -u www-data /edx/bin/python.edxapp ./manage.py lms --settings aws shell

	from django.contrib.auth.models import User;
	me = User.objects.get(username="${2:-user}");
	me.is_superuser = True;
	me.is_staff = True;
	me.save();
}

# Migrations args : lms/cms - defaults to lms
py_migrate() {
	sudo su edxapp -s /bin/bash;
	cd ~;
	source edxapp_env;
	python /edx/app/edxapp/edx-platform/manage.py ${1:-lms} syncdb --migrate --settings=aws;
}

py_services() { sudo /edx/bin/supervisorctl status; }

py_restart-edx() { sudo /edx/bin/supervisorctl restart edxapp:; }

py_restart-workers() { sudo /edx/bin/supervisorctl restart edxapp_worker:; }

py_compile() { 
	sudo -H -u edxapp bash;
	source /edx/app/edxapp/edxapp_env;
	cd /edx/app/edxapp/edx-platform;
	paver update_assets cms --settings=aws;
	paver update_assets lms --settings=aws;
}




