#!/usr/bin/env /bin/zsh

source $ZDOTDIR/.zshalias
source $ZDOTDIR/.zshfunctions

# configure nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

# load prompt 
eval $(starship init zsh)

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
