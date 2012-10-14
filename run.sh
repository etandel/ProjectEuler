#!/bin/zsh

fname=$(echo $1 | cut -d'.' -f1)
extension=$(echo $1 | cut -d'.' -f2)
case $extension in
    c)
        in_name=$1
        out_name=$fname.bin
        gcc -ggdb -O0 -Wall -lm -fopenmp -o $out_name $in_name && ./$out_name
        ;;

    moon)
        in_name=$1
        out_name=$fname.lua
        moonc $in_name && luajit -joff $out_name
        ;;
esac
