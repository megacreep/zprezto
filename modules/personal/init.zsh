#
# Define some personal utilities
# Authors: Muyang Li
#


# git related shorthands
alias gsl="clear && clear && git log --graph --pretty=format:'%Cred%h%Creset %C(cyan)%an%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --branches --max-count=40"

# Patreon repo shortcuts
alias prf='cd ~/workspace/patreon_react_features'
alias ppy='cd ~/workspace/patreon_py'


ENABLE_TYPECHECK_PATREON_PY=1

devx_restart () {
	if [ $# -ge 1 ]
	then
		services="$@"
		services=("${(z)services}")
	else
		services=(react web api ssr next)
	fi
	for i in $services
	do
		echo "Restarting $i"
		devx service $i restart
	done
}

devx_fix_builder () {
    devx service builder stop
    devx npm ci
    devx service builder start
}

