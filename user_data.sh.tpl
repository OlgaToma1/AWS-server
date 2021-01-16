!/bin/bash
yum -y update
yum -y install httpd


myip='curl http://169.254.169.254/latest/meta-data/local-ipv4'

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>My_webserver</title>
  </head>
  <body>

<h2> Greetings on my first page </h2>
    Owner ${f_name} ${l_name} <br>
  </body>
</html>

sudo service httpd start
chkconfig httpd on
