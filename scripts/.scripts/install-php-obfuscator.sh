#!/usr/bin/env bash
target = ~/.local/share

cd $target &&
    git clone https://github.com/pk-fr/yakpro-po.git &&
    cd yakpro-po &&
    git clone https://github.com/nikic/PHP-Parser.git --branch 4.x &&
    sudo ln -s $target/yakpro-po/yakpro-po.php /usr/local/bin
