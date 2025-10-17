eval (ssh-agent -c) &>/dev/null
ssh-add ~/.ssh/github_rsa &>/dev/null

export ASDF_GOLANG_MOD_VERSION_ENABLED=false
export FZF_DEFAULT_OPTS='
 --no-color'
export CLICOLOR=1
export GPG_TTY=$(tty)
export GPG_TTY
export DOTFILES_DIR="$HOME/.dotfiles"

set fish_greeting

source ~/.config/fish/alias.fish

bind \cf "exec 'tmux-sessionizer'"
source ~/.config/fish/path.fish

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

if test -e ~/.env
    envsource ~/.env
end


set --erase pure_symbol_git_stash

function fish_prompt
    set -l last_status $status
    # Prompt status only if it's not 0
    set -l stat
    if test $last_status -ne 0
        set stat (set_color normal)"[$last_status]"
    end

    set -l j (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\[\1\]/')
    if jj root --quiet &>/dev/null
        set j (jj log --ignore-working-copy --no-graph --color never -r @ -n1 -T '
        surround(
            "[",
            "]",
            separate(" ",
                bookmarks.map(|x| if(
                    x.name().substr(0, 10).starts_with(x.name()),
                    x.name().substr(0, 10),
                    x.name().substr(0, 9) ++ "…")
                ).join(" "),
                surround("\"","\"",
                    if(
                        description.first_line().substr(0, 24).starts_with(description.first_line()),
                        description.first_line().substr(0, 24),
                        description.first_line().substr(0, 23) ++ "…"
                    )
                ),
                change_id.shortest(),
                commit_id.shortest(),
                coalesce(
                if(empty, "empty"),
                    separate(" ",
                        diff.files().len() ++ "m",
                        diff.stat().total_added() ++ "+",
                        diff.stat().total_removed() ++ "-",
                    )
                ),
                if(conflict, "conflict"),
                if(divergent, "divergent"),
                if(hidden, "hidden"),
            )
        )
    ')
    end

    string join '' --   $stat "[$(prompt_pwd)]" $j  "\$ "
end
