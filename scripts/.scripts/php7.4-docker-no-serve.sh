docker run -it --rm -v /usr/bin/composer:/usr/bin/composer -v "$PWD":/usr/src/myapp -w /usr/src/myapp phpdockerio/php74-cli $@
