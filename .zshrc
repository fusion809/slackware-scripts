#!/bin/zsh
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin

for i in $HOME/Shell/*.sh
do
	. "$i"
done
