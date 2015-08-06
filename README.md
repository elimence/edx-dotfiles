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

There's also an alias named `edx-update_script`, you can use this command to update as well

```sh
edx-update_script
```

This will setup your brand new instance's bash environment to make it easier to work with edx by greating a bunch of helper aliases and functions to perform common tasks.
