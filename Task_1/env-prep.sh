sudo echo -e "\ndeb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main\n" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt-get update
sudo apt-get install ansible python-pip
sudo pip install -U boto boto3 python-dateutil
sudo echo -e "[localhost]\n127.0.0.1\n" >> /etc/ansible/hosts
