#!/usr/bin/env zsh

set -uo pipefail
setopt err_return

. ${0:A:h}/_common.zsh



# cat - <<-'EOD'
# master/braid//home/scott/ncode/learnvimscriptthehardway-wrapper/external/sjl/bookmarkdown
# EOD

# no version tags upstream
UPSTREAM_BRANCH='master'

() {
    local abs_ext_d=${LVS_THWW__EXT_D}
    local ext_d="" ;
    ext_d=$(realpath -m --relative-to ${LVS_THWW__ROOT_D} $abs_ext_d)

    local gh_user='sjl'
    local user_url="https://github.com/${gh_user}"
    typeset -a repo_names ;
    repo_names=( 'bookmarkdown' 'learnvimscriptthehardway' )
    local curr="" upstream="" ours="" ;
    typeset -a braid_call ;
    for curr in ${repo_names[@]}; do
        upstream="${user_url}/${curr}.git"
        ours=${ext_d}/${gh_user}/${curr}
        braid_call=(
            'braid' 'add'
            "$upstream"
            "$ours"
            "--branch=$UPSTREAM_BRANCH"
        )
        # mkdir -p ${ours:A:h} ;
        lvthw::info "braid call is: " ;
        ds-argshow-bin ${braid_call[@]} ;
        ${braid_call[@]} ;
    done
} $@ ;

