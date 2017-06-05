#!/bin/bash
### Set default parameters
username=$1
domain=$2
rootdir=$3

if [ "$rootdir" == "" ]; then
	rootdir=$domain
fi

echo "Creating the vhost config file"
cat <<EOF > /etc/apache2/sites-available/$rootdir.conf
<VirtualHost *:80>
        ServerAdmin kxxb@ya.ru
        DocumentRoot /home/$username/www/http/$rootdir/
	ErrorLog     /home/$username/www/logs/$rootdir/error.log
        ServerName $domain
        ServerAlias www.$domain
 
        <Directory /home/$username/www/http/$rootdir/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
		Require all granted
                #Order allow,deny
                #allow from all
	 	AssignUserId $username $username
        </Directory>
</VirtualHost>
EOF

echo "enabling site"
a2ensite $rootdir
 
echo "restarting apache"
/etc/init.d/apache2 reload
