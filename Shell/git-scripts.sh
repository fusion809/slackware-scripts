## Update local slackware-scripts repo
function cps {
  sudo chmod +x -R {$HOME,/root}/Shell/
  rm -rf $GHUBM/scripts/slackware-scripts/Shell && mkdir $GHUBM/scripts/slackware-scripts/Shell
  sudo rm -rf $GHUBM/scripts/slackware-scripts/root/Shell
  cp -a $HOME/Shell/* $GHUBM/scripts/slackware-scripts/Shell
  cp -a $HOME/{.bashrc,.zshrc} $GHUBM/scripts/slackware-scripts/
  sudo cp -a /root/{Shell,.bashrc,.zshrc} $GHUBM/scripts/slackware-scripts/root/
}

function cdss {
  cd $GHUBM/scripts/slackware-scripts
}

## Update sabayon-scripts GitHub repo
function shup {
  cps && cdss && push "$1" && cd - && szsh
}
