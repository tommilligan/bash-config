echo "Loaded common bash-config"

# General
alias please='sudo $(history -p !!)'
alias pls="please"
mkcd () { mkdir ${1} && cd ${1}; }
alias clean="bleachbit --preset"

# Navigate to this repo
alias bash-config="echo 'bash-config repo location not set'"

# Networking
alias myip="curl http://ipecho.net/plain"

# Git
alias git-review="git log --oneline --decorate --graph --all"
ssh-win-init () {
	env=~/.ssh/agent.env

	agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

	agent_start () {
		(umask 077; ssh-agent >| "$env")
		. "$env" >| /dev/null ; }

	agent_load_env

	# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
	agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

	if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
		agent_start
		ssh-add
	elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
		ssh-add
	fi

	unset env
}

