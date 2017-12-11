#!/usr/bin/env zsh

set -uo pipefail
setopt err_return

#
. ${0:A:h}/_common.zsh

__runit() {
    local trd=$LVS_THWW__TEST_REPO_D ;
    [[ -d $trd ]] || die "'$trd' should exist by now." ;
    exec $LVS_THWW__SCRIPTS_D/braidwrap.zsh add \
        https://github.com/git/git.git \
        committed-vendor/subtree \
        --path=contrib/subtree \
        --branch=master

}
__runit $@ ;

