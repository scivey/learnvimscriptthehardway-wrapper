#!/usr/bin/env zsh

set -uo pipefail
setopt err_return

. ${0:A:h}/_common.zsh

# this used to do more, and it probably still should


__runit() {
    pushd $LVS_THWW__ROOT_D ;
    exec braid $@ ;
}
__runit $@ ;

