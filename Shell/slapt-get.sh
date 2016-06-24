function slapup {
  sudo slapt-get -u && sudo slapt-get --upgrade
}

function slapin {
  sudo slapt-get -i "$@"
}

function slaprm {
  sudo slapt-get -r "$@"
}
