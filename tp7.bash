#!/bin/bash

if [[ ! -d /tmp/test ]]; then
	mkdir /tmp/test
fi

restart() {
	sudo init 6
}

deleteTestDir() {
	rm -r /tmp/test
}

updateServer() {
	sudo apt update; sudo apt autoremove -y; sudo apt dist-upgrade -y
}

deleteTestDir
updateServer
