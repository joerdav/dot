eval (ssh-agent -c) &>/dev/null
ssh-add ~/.ssh/github_rsa &>/dev/null

export ASDF_GOLANG_MOD_VERSION_ENABLED=false
export FZF_DEFAULT_OPTS='
 --color=fg:#ffffff,bg:#000000,hl:#ffffff
 --color=fg+:#ffffff,bg+:#000000,hl+:#ffffff
 --color=info:#ffffff,prompt:#ffffff,pointer:#ffffff
 --color=marker:#ffffff,spinner:#ffffff,header:#ffffff'
export CLICOLOR=1
export GPG_TTY=$(tty)
export GPG_TTY
export DOTFILES_DIR="$HOME/.dotfiles"

set fish_greeting

source ~/.config/fish/alias.fish

bind \cf "exec 'tmux-sessionizer'"

eval "$(atuin init fish)"

if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

set -gx ASDF_GOLANG_MOD_VERSION_ENABLED true

source ~/.config/fish/path.fish

set --erase pure_symbol_git_stash

function fish_prompt
    set -l last_status $status
    # Prompt status only if it's not 0
    set -l stat
    if test $last_status -ne 0
        set stat (set_color normal)"[$last_status]"
    end

    string join '' --   $stat "[$(prompt_pwd)]" (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\[\1\]/') "\$ "
end
