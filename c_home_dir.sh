#!/bin/bash
mkdir /home/$1/www/http/$2
cat <<EOF > /home/$1/www/http/$2/index.html
<html><head><title>$2 coming soon</title></head>
<body><br><br><h3><center>$2 coming soon</center></h3>
</body></html>

EOF
mkdir /home/$1/www/logs/$2
cat <<EOF > /home/$1/www/logs/$2/error.log

EOF

chown -R $1 /home/$1
chgrp -R $1 /home/$1
