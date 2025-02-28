zmodload zsh/zprof

eval "$(ssh-agent -s)" &>/dev/null
ssh-add ~/.ssh/github_rsa &>/dev/null

# Environment Variables
export ZSH="$HOME/.oh-my-zsh"
export ZSH_PATH=$(which zsh)
export SHELL=$(which zsh)

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#ffffff,bg:#000000,hl:#ffffff
 --color=fg+:#ffffff,bg+:#000000,hl+:#ffffff
 --color=info:#ffffff,prompt:#ffffff,pointer:#ffffff
 --color=marker:#ffffff,spinner:#ffffff,header:#ffffff'
export CLICOLOR=1
GPG_TTY=$(tty)
export GPG_TTY

autoload -Uz vcs_info
setopt prompt_subst
unsetopt PROMPT_SP
zstyle ':vcs_info:git*' formats "[%b]"
precmd() {
    vcs_info
}
PROMPT='[%?][%~% ]${vcs_info_msg_0_}${TICKET_RESULT}%B$%b '
RPROMPT=''

# oh-my-zsh
plugins=(git web-search)
ZSH_WEB_SEARCH_ENGINES=(
  phind "https://www.phind.com/agent?q="
)
source $ZSH/oh-my-zsh.sh

bindkey -s ^f "tmux-sessionizer\n"

eval "$(direnv hook zsh)"

# User configuration
DOTFILES_DIR="$HOME/.dotfiles"

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{function,private_function,env,path,private_env,alias,private_alias,completion,custom}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

export DOTFILES_DIR

eval "$(atuin init zsh)"

if [[ $(is-macos) == 0 ]]; then
    autoload -Uz compinit && compinit
    source $(brew --prefix asdf)/libexec/asdf.sh
else
    . $HOME/.asdf/asdf.sh
fi

complete -o nospace -C $HOME/go/bin/xc xc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/joe/.sdkman"
[[ -s "/home/joe/.sdkman/bin/sdkman-init.sh" ]] && source "/home/joe/.sdkman/bin/sdkman-init.sh"

#zprof

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/josephdavidson/go/bin/xc xc
