docker run -it --rm -v /usr/bin/composer:/usr/bin/composer -v "$PWD":/usr/src/myapp -w /usr/src/myapp -p 8000:8000 phpdockerio/php80-cli $@
