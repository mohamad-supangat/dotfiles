docker run -it --rm --name php7.4 -v /usr/bin/composer:/usr/bin/composer -v "$PWD":/usr/src/myapp -w /usr/src/myapp netpositivehu/php7.4 $@
