docker run -it --rm -v /usr/bin/composer:/usr/bin/composer -v "$PWD":/usr/src/myapp -w /usr/src/myapp -p 8000:8000 php:8.0-cli $@
