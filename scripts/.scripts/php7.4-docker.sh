docker run -it --rm --name php7.4 -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:7.4-cli php $1
