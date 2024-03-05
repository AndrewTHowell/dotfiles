#!/usr/bin/env bash

case $OSTYPE in
	linux-gnu)
		echo 'Linux'
		sudo apt-get install cmake
		;;
	*)
		printf 'Unsupported OS: %s\n' $OSTYPE >&2
		exit 1
		;;
esac
