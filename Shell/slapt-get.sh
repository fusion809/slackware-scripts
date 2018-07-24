function slapup {
  sudo slapt-get -u && sudo slapt-get --upgrade -y
}

function slapin {
  sudo slapt-get -i "$@" -y
}

alias ssgi=slapin

function slaprm {
  sudo slapt-get -r "$@" -y
}

alias ssgr=slaprm

function slaps {
  sudo slapt-get --search "$@"
}

alias ssgs=slaps
