#!/usr/bin/env bash
# this script should be run on a fresh debian bullseye install

# exit if any command fails
set -e

# display a cool logo
function show_logo_with_figlet()
{
    clear
    figlet -c -t -k -f /usr/share/figlet/script.flf "Merazi's post install script"
}

function show_logo()
{
    clear
    echo
    echo
    echo '*   *  *****  *****  *****  *****  * |    *****'
    echo '** **  *      *   *  *   *     *   * |    *    '
    echo '* * *  ****   ***    *****    *    *      *****'
    echo '*   *  *      *  *   *   *   *     *          *'
    echo '*   *  *****  *   *  *   *  *****  *      *****'
    echo
    echo 'Post Install                             Script'
}

# some initial questions...
read -p 'Can I install figlet? -> ' can_install_figlet
if [ $can_install_figlet == "yes" ]; then
    sudo -E apt install figlet --assume-yes
    show_logo_with_figlet
else
    echo "Ok, using plain text instead..."
    sleep 1
    show_logo
fi

# update the repository list
# and install upgrades
function update_and_upgrade()
{
    sudo -E apt update --quiet && sudo -E apt upgrade --quiet --assume-yes
}

# add contrib and non-free to the debian sources.list
# just if they're not already in there
function add_contrib_and_nonfree()
{
    if grep -q 'main contrib non-free' /etc/apt/sources.list; then
	echo "Sources.list already has contrib and non-free"
    else
	echo "Backing up sources.list to sources.list.bak..."
	cp /etc/apt/sources.list /etc/apt/sources.list.bak

	echo "Modifying sources.list..."
	sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

	echo "updating and upgrading..."
	update_and_upgrade
    fi
}

# my install function, with all the flags I want
# it expects a string with all the packages
function install_software()
{
    sudo -E apt install --assume-yes --quiet $*
}

###############
# < some software packs >
#
# You may want to edit the lists, they are kinda
# bloated to be honest, I do not mind it tho.

packages=''  # this variable will hold all my package names

# base tools
function software_pack_base()
{
    packages+='git wget neofetch curl bash-completion dash build-essential '
    packages+='exa bat zip unzip unrar mc '
}

# some editors
function software_pack_editors()
{
    packages+='emacs nano vim-tiny joe geany mousepad leafpad '
}

# some games
function software_pack_games()
{
    packages+='supertuxkart supertux xboard kdiamond openarena doomsday '
    packages+='cuyo cube2 bomberclone 0ad higan warmux minetest fceux '
}

function install_qemu()
{
    echo 'configuring user groups for the user you entered before...'
    sudo -E apt install qemu-kvm libvirt-bin qemu-utils virt-manager --assume-yes --quiet \
	 --install-recommends --install-suggests # give me everything!
    sudo -E usermod -aG libvirtd,kvm,wheel $USER
}

function install_rust()
{
    echo 'Using the installer from https://www.rust-lang.org/tools/install'
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

echo 'adding the base utils to the package list...'
software_pack_base

read -p 'Do you want to install editors? -> ' install_editors
read -p 'Do you want to install games? -> ' install_games

if [ $install_editors == "yes" ]; then
    echo 'adding editors to the package list...'
    software_pack_editors
fi

if [ $install_games == "yes" ]; then
    echo 'adding games to the package list'
    software_pack_games
fi

# install everything!
install_software ${packages}

# additional software configuration...
read -p 'Do you want to install rust? -> ' do_you_want_rust
if [ $do_you_want_rust == "yes" ]; then
    install_rust
fi

read -p 'Do you want to configure qemu and virt-manager? -> ' do_you_want_qemu
if [ $do_you_want_qemu == "yes" ]; then
    install_qemu
fi

# reset the sudo timeout
sudo -K
