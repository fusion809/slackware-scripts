function slapin {
	slapt-get -i "$@"
}

function slaprm {
	slapt-get -r "$@"
}

function update {
	slapt-get -u && slapt-get --upgrade "$@"
}

function instl {
	if [[ -n "$@" ]]; then
		installpkg "$@"
	else
		installpkg *.txz || installpkg *.tgz || installpkg *.tbz
	fi
}
