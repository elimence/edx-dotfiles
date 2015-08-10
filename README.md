dotfiles.git
============
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure your `bash` development environment as follows:

```sh
wget https://raw.githubusercontent.com/elimence/edx-dotfiles/master/setup.sh -O - | bash
```

To update an existing setup, do the following

```sh
wget https://raw.githubusercontent.com/elimence/edx-dotfiles/master/update.sh -O - | bash
```

There's also an alias named `edx-update_dotfiles`, you can use this command to update as well

```sh
edx-update_script
```

This will setup your brand new instance's bash environment to make it easier to work with edx by greating a bunch of helper aliases and functions to perform common tasks.

You can run `edx-help` to view a list of available aliases and functions

```json
----- Aliases -------
edx-goto_conf       :navigate to configurations directory
edx-goto_pbks       : navigate to playbooks subdirectory
edx-goto_platform   : navigate to edx platform directory
edx-goto_lms        : navigate to lms subdirectory
edx-goto_cms        : navigate to cms subdirectory
edx-update_dotfiles : update edx-dotfiles

----- Functions -------
edx-list             : list all manage.py commands
edx-create_user      : create create a new user using given email. defaults to user@example.com
edx-change_password  : change password for specified username. defaults to user
edx-promote_to_staff : promote user to staff using given email. defaults to user@example.com
edx-django_shell     : launch the django shell
edx-service_status   : see what services are running
edx-restart_edxapp   : restart lms/cms services
edx-restart_workers  : restart worker services
edx-compile_assets   : compile assets manually
edx-migrate          : run migrations
```
