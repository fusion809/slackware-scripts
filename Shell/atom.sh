function apmi {
  apm install "$@" --no-confirm
}

function apmup {
  apm update --no-confirm
}

function apmr {
  apm remove "$@" --no-confirm
}
