## pve-nag-buster 

This is a fork of [foundObjects/pve-nag-buster](https://github.com/foundObjects/pve-nag-buster) to add support for PVE 8+.

----

`pve-nag-buster` is a dpkg hook script that persistently removes license nags
from Proxmox VE 6.x and up. Install it once and you won't see another license
nag until the Proxmox team  changes their web-ui code in a way that breaks the patch.

Please support the Proxmox team by [buying a subscription](https://www.proxmox.com/en/proxmox-ve/pricing) if it's within your
means. High quality open source software like Proxmox needs our support!

### News:

Last updated for: pve-manager/8.1.3 (running kernel: 6.5.11-4-pve)

### How does it work?

The included hook script removes the "unlicensed node" popup nag from the web
gui and disables the pve-enterprise repository list. This script is called
every time a package updates the web gui or the pve-enterprise source list and
will only run if packages containing those files are changed.

The installer installs the dpkg hook script, adds the pve-no-subscription repo list
and calls the hook script once. There are no external dependencies beyond the base
packages installed with PVE by default.

### Installation

**Note: do not run the install command via the web shell, use SSH instead.** Script restarts the GUI when removing nag,
and this interrupts the connection to the web shell and the script never disables enterprise repos.

```sh
wget https://raw.githubusercontent.com/Yrlish/pve-nag-buster/master/install.sh

# Always read scripts downloaded from the internet before running them with sudo
sudo bash install.sh

# or ..
chmod +x install.sh && sudo ./install.sh
```

With Git:
```sh
git clone https://github.com/Yrlish/pve-nag-buster.git

# Always read scripts downloaded from the internet before running them with sudo
cd pve-nag-buster && sudo ./install.sh
```

### Uninstall:
```sh
sudo ./install.sh --uninstall
# remove /etc/apt/sources.list.d/pve-no-subscription.list if desired
```

### Thanks to:

- Original contributors at https://github.com/foundObjects/pve-nag-buster

### Contact:

[Open an issue](https://github.com/Yrlish/pve-nag-buster/issues) on GitHub

Please get in touch if you find a way to improve anything, otherwise enjoy!
