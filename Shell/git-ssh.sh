#############################################################
# The following script was taken from
# http://stackoverflow.com/a/18915067/1876983
#############################################################
# Sign in with SSH at startup
# Makes contributing to GitHub projects a lot simpler.
if ! [[ -f $HOME/.ssh/id_rsa ]]; then
  ssh-keygen -t rsa -b 4096 -C "brentonhorne77@gmail.com"
  git config --global user.name "fusion809"
  git config --global user.email "brentonhorne77@gmail.com"
fi

# start the ssh-agent
# Remember, for this to work you need your SSH keys setup
# https://help.github.com/articles/generating-ssh-keys/

eval `keychain -q --eval id_rsa`
#############################################################
