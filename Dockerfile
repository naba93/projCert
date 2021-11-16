FROM devopsedu/webapp

ADD . /var/www/html

CMD apachectl -D FOREGROUND
