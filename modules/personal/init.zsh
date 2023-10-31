#
# Define some personal utilities
# Authors: Muyang Li
#


# git related shorthands
alias gsl="clear && clear && git log --graph --pretty=format:'%Cred%h%Creset %C(cyan)%an%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --branches --max-count=40"

# Patreon repo shortcuts
alias prf='cd ~/workspace/patreon_react_features'
alias ppy='cd ~/workspace/patreon_py'

alias rs_prf='rdev new patreon_react_features --dotfiles muyang --name prf --no-set-default'
alias rs_ppy='rdev new patreon_py --dotfiles muyang --name ppy --set-default'
alias rs_tail="rdev services tail '*'"
alias rs_tail_prf="rdev services tail '*' --container-name prf"
alias rs_restart_prf='rdev services restart ssr react next --container-name prf'
alias rs_restart_ppy='rdev services restart --container-name ppy'
alias rs_restart='rs_restart_prf && rs_restart_ppy'
alias rs_recreate='rdev rm prf --no-check && rdev rm ppy --no-check && rdev_prf && rdev_ppy'

alias pytest='/home/dev/patreon_py/bin/rdev/pytest'



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

