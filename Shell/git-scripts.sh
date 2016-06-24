## Update local slackware-scripts repo
function cps {
  sudo chmod +x -R {$HOME,/root}/Shell/
  rm -rf $GHUBM/slackware-scripts/Shell && mkdir $GHUBM/slackware-scripts/Shell
  sudo rm -rf $GHUBM/slackware-scripts/root/Shell
  cp -a $HOME/Shell/* $GHUBM/slackware-scripts/Shell
  cp -a $HOME/{.bashrc,.zshrc} $GHUBM/slackware-scripts/
  sudo cp -a /root/{Shell,.bashrc,.zshrc} $GHUBM/slackware-scripts/root/
}

function cdss {
  cd $GHUBM/slackware-scripts
}

## Update sabayon-scripts GitHub repo
function shup {
  cps && cdss && push "$1" && cd - && szsh
}
