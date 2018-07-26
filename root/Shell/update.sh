function slpin {
    slpkg -s sbo "$@"
}

function slaprm {
    slackpkg remove "$@"
}

function update {
    slpkg upgrade "$@" ; flatpak update
}
