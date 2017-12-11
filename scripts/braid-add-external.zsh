#!/usr/bin/env zsh

set -uo pipefail
setopt err_return

#
. ${0:A:h}/_common.zsh

__runit() {
    local ext_d=${LVS_THWW__EXT_D}
    exec $LVS_THWW__SCRIPTS_D/braidwrap.zsh add \
        https://github.com/git/git.git \
        committed-vendor/subtree \
        --path=contrib/subtree \
        --branch=master

}
__runit $@ ;

