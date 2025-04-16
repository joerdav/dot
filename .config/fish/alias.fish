alias v nvim
alias vim nvim

function review
    if not git status -s
            echo 'must start with clean tree!'
            return 1
    end
    git checkout main
    git pull
    set pr (string trim (gh pr ls | fzf | awk '{print $1}'))
    gh pr checkout $pr
    if ! git rebase origin/main
            echo 'rebase failed!'
            return 1
    end
    git reset --soft origin/main
    nvim -c :G
end
