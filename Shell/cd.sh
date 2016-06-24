function cdsh {
  cd $HOME/Shell
}

function cdg {
  cd $HOME/GitHub/$1
}

function cdgm {
  cdg mine/$1
}

function cdgo {
  cdg others/$1
}

function cdsb {
  cdgo SlackBuilds
}
