#!/bin/bash

dir=`pwd`
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "~/$f"
    ln -s $dir/$f ~/$f
done
