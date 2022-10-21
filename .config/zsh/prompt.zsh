function git_branch_name() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]];then
        :
    else
        echo '- ('$branch')'
    fi
}

setopt prompt_subst

PROMPT="%F{red}%n%f@%F{blue}%m%f %F{green}%~%f >> "
