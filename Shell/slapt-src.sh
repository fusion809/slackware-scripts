function sssi {
  sudo slapt-src -i "$@" -y
}

function ssss {
  sudo slapt-src --search "$@"
}

function sssu {
  sudo slapt-src -u -y
}
