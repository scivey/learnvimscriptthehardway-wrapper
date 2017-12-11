#!/usr/bin/env zsh

set -uo pipefail
setopt err_return

#
. ${0:A:h}/_common.zsh
() {
    local ext_d=${LVS_THWW__EXT_D}
    local gh_user='sjl'
    local user_url="https://github.com/${gh_user}"
    typeset -a repo_names ;
    repo_names=(
        'bookmarkdown'
        'learnvimscriptthehardway'
    )
    local curr="" upstream="" ours="" ;
    for curr in ${repo_names[@]}; do
        upstream="${user_url}/${curr}.git"
        ours=${ext_d}/${gh_user}/${curr}
        mkdir -p ${ours:A:h} ;
        # no version tags upstream
        braid add "$upstream" "$ours" --branch=master
    done
} $@ ;

