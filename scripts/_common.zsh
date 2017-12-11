#!/usr/bin/env zsh
#
set -uo pipefail
setopt err_return ;

LVS_THWW__SCRIPTS_D=${0:A:h}
LVS_THWW__ROOT_D=${LVS_THWW__SCRIPTS_D:h}
LVS_THWW__EXT_D=${LVS_THWW__ROOT_D}/external
LVS_THWW__TMP_D=${LVS_THWW__ROOT_D}/tmp
LVS_THWW__VENVS_D=${LVS_THWW__TMP_D}/venvs
LVS_THWW__BUILD_D=${LVS_THWW__ROOT_D}/build
LVS_THWW__LEARNVIML_BUILD_DEST=${LVS_THWW__BUILD_D}/learnvimscriptthehardway
function pushd() { builtin pushd $@ >/dev/null ; }
function popd() { builtin popd >/dev/null ; }


_say() {
    autoload -Uz colors && colors ;
    local name='lvthw'
    local lvl=$1 color=$2 ; shift 2 ;
    local cend=$reset_color ;
    local c1=${fg_bold[$color]} c2=${fg[$color]}
    printf '%s[ %s ]  %s%s' $c1 $name $lvl $cend >&2 ;
    printf '%s - %s%s\n' $c2 "$*" $cend >&2 ;
}
lvthw::info() { _say 'INFO' white $@ ; }
lvthw::warn() { _say 'WARN' yellow $@ ; }
lvthw::fatal() { _say 'FATAL' red $@ ; return 1 ; }
lvthw::ok() { _say 'SUCCESS' green @$ ; }

die() {
    lvthw::fatal $@ ;
    [[ $- != *'i'* ]] || exit 1 ;
    return 1 ;
}


