#!/bin/sh

# This file is what is disabling repos and removing nag in GUI

NAGTOKEN="data.status.toLowerCase() !== 'active'"
NAGFILE="/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js"
SCRIPT="$(basename "$0")"

# disable license nag: https://johnscs.com/remove-proxmox51-subscription-notice/

if grep -qs "$NAGTOKEN" "$NAGFILE" >/dev/null 2>&1; then
	echo "$SCRIPT: Removing Nag ..."
	sed -i.orig "s/$NAGTOKEN/false/g" "$NAGFILE"
	systemctl restart pveproxy.service
fi

# disable paid repo list
disable_repo() {
	local REPO_BASE="$1"

	if [ -f "$REPO_BASE.sources" ]; then
		echo "Disabling $REPO_BASE repo list ..."
		mv -f "$REPO_BASE.sources" "$REPO_BASE.disabled"
	fi
}

# Disable pve-enterprise repo
disable_repo "/etc/apt/sources.list.d/pve-enterprise"

# Disable ceph repo
disable_repo "/etc/apt/sources.list.d/ceph"
