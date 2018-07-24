function slpkup {
    if [[ -f /usr/bin/slpkg ]]; then
         sudo slpkg upgrade
    else
         printf "slpkg isn't installed, please install it from https://github.com/dslackw/slpkg/releases.\n"
    fi
}

alias slpkgup=slpkup

function flatup {
    if [[ -f /usr/bin/flatpak ]]; then
         sudo flatpak update -y
    else
	 printf "Flatpak isn't installed, so sudo flatpak update isn't being run.\n"
    fi
}

function apmup {
    if [[ -f /usr/bin/apm ]]; then
         apm update --no-confirm
    else
	 printf "Atom doesn't appear to be installed, so not running apm update.\n"
    fi
}

function update {
    slpkgup
    flatup
    apmup
}
