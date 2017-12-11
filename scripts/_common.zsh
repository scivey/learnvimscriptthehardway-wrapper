#!/usr/bin/env zsh
#
set -uo pipefail
setopt err_return ;

LVS_THWW__SCRIPTS_D=${0:A:h}
LVS_THWW__ROOT_D=${LVS_THWW__SCRIPTS_D:h}
LVS_THWW__EXT_D=${LVS_THWW__ROOT_D}/external
LVS_THWW__EPHEM_D=${LVS_THWW__ROOT_D}/ephemeral
LVS_THWW__FIXTURE_D=${LVS_THWW__ROOT_D}/fixture
LVS_THWW__TEST_REPO_NAME='some-repo'
LVS_THWW__TEST_REPO_D=$LVS_THWW__EPHEM_D/$LVS_THWW__TEST_REPO_NAME
LVS_THWW__TEST_UPSTREAM_NAME='an-upstream'
LVS_THWW__TEST_UPSTREAM_D=$LVS_THWW__EPHEM_D/$LVS_THWW__TEST_UPSTREAM_NAME ;
LVS_THWW__TEST_BARE_REPOS_D=$LVS_THWW__EPHEM_D/bare
LVS_THWW__SUBEXT_PY=$LVS_THWW__SCRIPTS_D/git_subtree_externs.py

function pushd() { builtin pushd $@ >/dev/null ; }
function popd() { builtin popd >/dev/null ; }

autoload -Uz colors && colors ;

_say() {
    local name='stree-test'
    local lvl=$1 color=$2 ; shift 2 ;
    local cend=$reset_color ;
    local c1=${fg_bold[$color]} c2=${fg[$color]}
    printf '%s[ %s ]  %s%s' $c1 $name $lvl $cend >&2 ;
    printf '%s - %s%s\n' $c2 "$*" $cend >&2 ;
}
stt::info() { _say 'INFO' white $@ ; }
stt::warn() { _say 'WARN' yellow $@ ; }
stt::fatal() { _say 'FATAL' red $@ ; return 1 ; }
stt::ok() { _say 'SUCCESS' green @$ ; }
die() {
    stt::fatal $@ ; exit 1 ;
}


stree-test::get-own-git-root() {
    pushd $LVS_THWW__ROOT_D ;
    local groot ; read -r groot < <( git rev-parse --show-toplevel ) ;
    popd ;
    echo ${groot:A} ;
}

