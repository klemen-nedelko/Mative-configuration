#!/bin/sh
. open.sh
# Reset
Color_Off='\033[0m'      

greating

# Regular Colors
Red='\033[0;31m'          # Rdeca
Green='\033[0;32m'        # Zelena
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

# Posodabljanje
echo -e "$Cyan \n Posodabljanje sistema. $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y

## Namescanje APACHE
echo -e "$Cyan \n Namescanje Apache2 $Color_Off"
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y

echo -e "$Cyan \n Namescanje PHP & Requirements $Color_Off"
sudo apt-get install libapache2-mod-php5 php5 php5-common php5-curl php5-dev php5-gd php5-idn php-pear php5-imagick php5-mcrypt php5-mysql php5-ps php5-pspell php5-recode php5-xsl -y

echo -e "$Cyan \n Namescanje MySQL $Color_Off"
sudo apt-get install mysql-server mysql-client libmysqlclient15.dev -y

echo -e "$Cyan \n Namescanje phpMyAdmin $Color_Off"
sudo apt-get install phpmyadmin -y

echo -e "$Cyan \n Preverjanje namestitve $Color_Off"
sudo apt-get install apache2 libapache2-mod-php5 php5 mysql-server php-pear php5-mysql mysql-client mysql-server php5-mysql php5-gd -y

## Nastavitve
echo -e "$Cyan \n Dovoljenje za /var/www $Color_Off"
sudo chown -R www-data:www-data /var/www
echo -e "$Green \n Dovoljenja so nastavljena $Color_Off"

# Omogočanje Mod Rewrite, za WordPress permalinks in .htaccess files
echo -e "$Cyan \n Omogočanje modulov $Color_Off"
sudo a2enmod rewrite
sudo php5enmod mcrypt

# Restart Apache
echo -e "$Cyan \n Ponoven zagon Apache $Color_Off"
sudo service apache2 restart