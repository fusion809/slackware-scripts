function apmi {
  atom-apm install "$@" --no-confirm
}

function apmup {
  atom-apm update --no-confirm
}

function apmr {
  atom-apm remove "$@" --no-confirm
}
