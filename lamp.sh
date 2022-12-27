#!/bin/bash

echo "Installing Apache web Server"

sudo apt update
sudo apt install apache2 -y
sudo service apache2 status
sudo ufw app list
sudo ufw app info "Apache Full"

echo "Apache web server is Installed"

echo "Install Mysql and create Database"

sudo apt install mysql-server -y

echo "Installing PHP"

sudo apt install php libapache2-mod-php php-mysql -y


sudo mkdir /var/www/web.nihal.com
sudo chown -R $USER:$USER /var/www/web.nihal.com
sudo chmod -R 755 /var/www/web.nihal.com
sudo echo "<?php
phpinfo();">/var/www/web.nihal.com/info.php 

sudo echo "<html>
    <head>
        <title>Welcome to web.nihal.com!</title>
    </head>
    <body>
        <h1>Success!  The web.nihal.com server block is working!</h1>
    </body>
</html>">/var/www/web.nihal.com/index.html
sudo chown -R $USER:$USER /etc/apache2/sites-available/
sudo echo "<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName web.nihal.com
    ServerAlias www.web.nihal.com
    DocumentRoot /var/www/web.nihal.com
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>">/etc/apache2/sites-available/web.nihal.conf

sudo a2ensite web.nihal.conf
sudo a2dissite 000-default.conf
sudo apache2ctl configtest
sudo systemctl restart apache2


