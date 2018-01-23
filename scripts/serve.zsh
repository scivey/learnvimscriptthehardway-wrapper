#!/usr/bin/env zsh

set -uo pipefail

. ${0:A:h}/_common.zsh

_launch-py2() { exec python -m SimpleHTTPServer --bind $1 $2 ; }

_launch-py3() { exec python -m http.server --bind $1 $2 ; }

_launch-server() {
    if python -c 'import SimpleHTTPServer' &>/dev/null ; then
        _launch-py2 $@ ;
    else
        _launch-py3 $@ ;
    fi
}

() {
    local -A optmap ; optmap+=(
        '-p' '8000'
        '-i' '127.0.0.1'
    )
    zparseopts -D -E -K -M -A optmap \
        p: -port:=p \
        i: -interface:=i

    local dest_d=$LVS_THWW__LEARNVIML_BUILD_DEST ;
    local root_d=$LVS_THWW__ROOT_D ;
    if [[ ! -d $dest_d ]]; then
        pushd $root_d ;
        make render ;
        popd ;
    fi
    [[ -d $dest_d ]] || die "'$dest_d' should always exist here." ;
    pushd $dest_d ;
    _launch-server ${optmap[-i]} ${optmap[-p]};

} $@ ;

