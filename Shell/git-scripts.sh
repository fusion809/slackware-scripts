## Update local slackware-scripts repo
function cps {
  sudo chmod +x -R {$HOME,/root}/Shell/
  rm -rf $HOME/GitHub/mine/slackware-scripts/Shell && mkdir $HOME/GitHub/mine/slackware-scripts/Shell
  sudo rm -rf $HOME/GitHub/mine/slackware-scripts/root/Shell
  cp -a $HOME/Shell/* $HOME/GitHub/mine/slackware-scripts/Shell
  cp -a $HOME/{.bashrc,.zshrc} $HOME/GitHub/mine/slackware-scripts/
  sudo cp -a /root/{Shell,.bashrc,.zshrc} $HOME/GitHub/mine/slackware-scripts/root/
}

function cdss {
  cd $HOME/GitHub/mine/slackware-scripts
}

## Update sabayon-scripts GitHub repo
function shup {
  cps && cdss && push "$1" && cd - && szsh
}
