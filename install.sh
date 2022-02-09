#!/bin/bash

log_file=~/dotfiles_install_progress_log.txt

sudo apt-get -y install zsh
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install vim
if type -p vim > /dev/null; then
    echo "vim Installed" >> $log_file
else
    echo "vim FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install curl
if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo "curl FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install figlet
if type -p figlet > /dev/null; then
    echo "figlet Installed" >> $log_file
else
    echo "figlet FAILED TO INSTALL!!!" >> $log_file
fi

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
rm $log_file

# Install antigen and symlink dotfiles

curl -L git.io/antigen > ~/antigen.zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

if [ ! -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
   exec /bin/zsh
fi

