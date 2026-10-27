#!/bin/bash

LOCAL_DIR="/home/developer/Downloads"
ISO_NAME="rhel-9.8-x86_64-dvd.iso"
REMOTE_USER="developer"
REMOTE_HOST="192.168.1.227"
REMOTE_DESTINATION="/home/developer/Downloads"

rsync_file(){
	local src="$1"
	local dest="$2"

	echo "[INFO] Starting transfer..."

	rsync -avP "$src" "${REMOTE_USER}@${REMOTE_HOST}:${dest}"

	if [ $? -eq 0 ]; then
		echo "[SUCCESS] File transferred successfully."
	else
		echo "[ERROR] Transfer failed." >&2
		return 1
	fi
}

rsync_file "${LOCAL_DIR}/${ISO_NAME}" "${REMOTE_DESTINATION}"
