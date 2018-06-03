#!/bin/bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin
export PS1='\u@\h:\w $ '

for i in $HOME/Shell/*.sh
do
	. "$i"
done
