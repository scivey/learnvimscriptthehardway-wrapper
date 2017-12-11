#!/usr/bin/env zsh

set -uo pipefail
setopt err_return

#
. ${0:A:h}/_common.zsh

__runit() {
    local trd=$LVS_THWW__TEST_REPO_D ;
    [[ -d $trd ]] || die "'$trd' should exist by now." ;
    pushd $LVS_THWW__ROOT_D ;
    exec braid $@ ;
}
__runit $@ ;

