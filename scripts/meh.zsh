#!/usr/bin/env zsh

set -uo pipefail
setopt err_return

#
. ${0:A:h}/_common.zsh

() {
    local repo_d=$LVS_THWW__ROOT_D ;
    local ext_d=$LVS_THWW__EXT_D
    local fake_ext=$ext_d/some-user/some-repo
    lvthw::info "   repo_d:  '$repo_d'"
    lvthw::info "    ext_d:  '$ext_d'"
    lvthw::info " fake_ext:  '$fake_ext'"

    integer cutoff=0; cutoff=${#repo_d} ;
    local adj_d=${fake_ext:${cutoff}} ;

    printf '\n' >&2 ;
    lvthw::info "    adj_d:  '$adj_d'"
} $@ ;

