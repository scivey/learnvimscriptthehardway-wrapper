#!/usr/bin/env zsh

set -uo pipefail
setopt err_return

. ${0:A:h}/_common.zsh

() {
    local venv_d=${LVS_THWW__VENVS_D}/bmdown ;
    local py_bin='python2.7'
    local ext_sjl=${LVS_THWW__EXT_D}/sjl
    local bmdown_d=${sjl}/bookmarkdown
    local lvthw_d=${sjl}/learnvimscriptthehardway
    local reqs=${bmdown_d}/requirements.txt
    local zinv_b=${LVS_THWW__SCRIPTS_D}/zinve

    typeset -a zinve_call=(
        ${zinv_b} 'exec'
        -d ${venv_d}
        -p ${py_bin}
        -r ${reqs}
    )
    # that's .... repetitive
    local bmdown_bin="${bmdown_d}/bookmarkdown/bookmarkdown" ;

    if [[ ! -e $bmdown_bin ]]; then
        # I don't ever expect this to happen. I just feel the need
        # to check again because the path is absurd.
        lvthw::fatal "expected to find the site build script at '$bmdown_bin'!"
        exit 1 ; # not reached
    fi
    # really, that's where it is.

    local dest_d=$LVS_THWW__LEARNVIML_BUILD_DEST ;
    mkdir -p ${dest_d:h}

    pushd $lvthw_d ;
    rm -rf ${lvthw_d:?BAD}/build ;
    ${zinve_call[@]} -- 'python' ${bmdown_bin} html ;
    popd ;

    rm -rf ${dest_d} ;
    cp -r ${lvthw_d}/build/html ${dest_d}
    lvthw::ok "Success. Built HTML is at:"
    echo ${dest_d}
} $@ ;


