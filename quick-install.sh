# Create GitHub directory
if ! [[ -d $HOME/GitHub ]]; then
  mkdir $HOME/GitHub
fi

function slaptget-install {
  TGZ=$(curl -sL https://software.jaos.org/ | grep "x86_64" | grep "tgz" | head -n 2 | cut -d '"' -f 2 | tail -n 1)
  VERSION=$(printf $TGZ | cut -d '/' -f 5 | cut -d '-' -f 3)
  REVISION=$(printf $TGZ | cut -d '/' -f 5 | cut -d '-' -f 5 | sed 's/\.tgz//g')
  curl -sL https://software.jaos.org/$TGZ > /tmp/slapt-get-$VERSION-x86_64-$REVISION.tgz
  su -c "installpkg /tmp/slapt-get-$VERSION-x86_64-$REVISION.tgz"
}

if ! `which slapt-get > /dev/null 2>&1`; then
  slaptget-install
fi

function slaptsrc-install {
  TGZ=$(curl -sL https://software.jaos.org/ | grep "x86_64" | grep "tgz" | tail -n 1 | cut -d '"' -f 2)
  VERSION=$(printf $TGZ | cut -d '/' -f 5 | cut -d '-' -f 3)
  REVISION=$(printf $TGZ | cut -d '/' -f 5 | cut -d '-' -f 5 | sed 's/\.tgz//g')
  curl -sL https://software.jaos.org/$TGZ > /tmp/slapt-src-$VERSION-x86_64-$REVISION.tgz
  su -c "installpkg /tmp/slapt-src-$VERSION-x86_64-$REVISION.tgz"
}

if ! `which slapt-src > /dev/null 2>&1`; then
  slaptsrc-install
fi

if `printf $PATH | grep /usr/sbin > /dev/null 2>&1`; then
  export PATH=$PATH:/usr/sbin
fi

su -c "slapt-get -u"
su -c "slapt-get -i -y openssh zsh git"
su -c "slapt-src -i -y nodejs keychain"

# Clone slackware-scripts repo
if ! [[ -d $HOME/GitHub/mine/scripts/slackware-scripts ]]; then
  git clone https://github.com/fusion809/slackware-scripts $HOME/GitHub/mine/scripts/slackware-scripts
  # Copy across
  cp -a $HOME/GitHub/mine/scripts/slackware-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $HOME/GitHub/mine/scripts/slackware-scripts/root/{Shell,.bashrc,.zshrc} /root/
elif [[ -d $HOME/GitHub/mine/scripts/slackware-scripts ]]; then
  cd $HOME/GitHub/mine/scripts/slackware-scripts
  git pull origin master
  cd -
  # Copy across
  cp -a $HOME/GitHub/mine/scripts/slackware-scripts/{Shell,.bashrc,.zshrc} $HOME/
  sudo cp -a $HOME/GitHub/mine/scripts/slackware-scripts/root/{Shell,.bashrc,.zshrc} /root/
fi

if ! [[ -d $HOME/.oh-my-zsh ]]; then
  # git clone oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
else
  cd $HOME/.oh-my-zsh
  git pull origin master
  cd -
fi

if ! [[ -d $HOME/GitHub/zsh-theme ]] || ! [[ -d $HOME/GitHub/mine/scripts/zsh-theme ]]; then
# Get my self-made zsh-themes
  git clone https://github.com/fusion809/zsh-theme $HOME/GitHub/mine/scripts/zsh-theme
  cp -a $HOME/GitHub/mine/scripts/zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
else
  cd $HOME/GitHub/mine/scripts/zsh-theme
  git pull origin master
  cd -
  cp -a $HOME/GitHub/mine/scripts/zsh-theme/*.zsh-theme $HOME/.oh-my-zsh/themes/
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting ]]; then
  # Get zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

if ! [[ -d $HOME/.oh-my-zsh/plugins/zsh-history-substring-search ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.oh-my-zsh/plugins/zsh-history-substring-search
fi

# Change default login shell to Zsh
chsh -s /bin/zsh
sudo chsh -s /bin/zsh
/bin/zsh
