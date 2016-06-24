function cdsh {
  cd $SHL
}

function cdg {
  cd $GHUB/$1
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

function cdat {
  cd $HOME/.atom
}
