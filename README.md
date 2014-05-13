## Creating a Node Web Application Development Environment with Vagrant##

These instructions will create a Vagrant virtual machine ready for web application development.
This allows developers to begin writing code without worrying about how to install or configure Node.js.

### Vagrant ###

[Vagrant](http://docs.vagrantup.com/v2/why-vagrant/index.html) is open-source software used to create lightweight and portable virtual development environments. Vagrant works like a "wrapper" for VirtualBox that can create, configure, and destroy virtual machines with the use of its own terminal commands. Vagrant facilitates the setup of environments without any direct interaction with VirtualBox and allows developers to use preferred editors and browsers in their native operating system. [This blog](http://mitchellh.com/the-tao-of-vagrant) describes a typical workflow using Vagrant in a development environment.

###  Install Vagrant ###

- Download and install [VirtualBox 4.3.8](https://www.virtualbox.org/wiki/Download_Old_Builds_4_3)
  - Do not open VirtualBox or create a virtual machine. This will be handled by Vagrant.
- Download and install [Vagrant 1.5.0](http://www.vagrantup.com/downloads.html) or better
  - Package managers like apt-get and gem install will install an older version of Vagrant so it is required to use the download page.

#### Windows Users ####

- Download [Git for Windows](http://msysgit.github.io/):
  - Run the installer and "next" through the wizard until the step to adjust your PATH environment.
  - Choose the third option, "Run Git and included tools from within the Windows Command prompt"
  - **Important**: On the next step, "Configuring the line ending conversions", choose the second option:       "Checkout as-is, commit Unix-style line endings".
  - Choose "next" through any additional steps to complete the Git for Windows install.
  - Open the Windows Command Prompt as **Administrator**

### Get the Code ###  

[Fork](http://github.com/lynnaloo/node-vagrant) the `node-vagrant` repository on Github.

Clone your fork of the `node-vagrant` repository to a directory on your host machine:

    git clone --recursive https://github.com/<github-username>/node-vagrant.git

Change directory to your `node-vagrant` directory:
    cd node-vagrant

### Setup Vagrant ###

Once you `cd` into the node-vagrant directory, you will find a "Vagrantfile" which will provide
the necessary instructions and provisioning to setup your development virtual machine. All Vagrant commands
should be performed in this directory with your Vagrantfile.

### Install VirtualBox Guest Additions Plugin

    vagrant plugin install vagrant-vbguest

### Connect to the Virtual Machine ###

Start the virtual machine:

    vagrant up

Connect to the virtual machine via ssh:

    vagrant ssh

- You will find a `dev` folder in the `home/vagrant` directory that will sync all of its contents
  to a `dev` folder adjacent to your Vagrantfile on your host machine. This allows for editing code
  on your host machine and having it immediately available inside of the virtual machine.

You can now begin writing code!
