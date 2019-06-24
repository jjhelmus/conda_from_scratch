#!/bin/bash
# Helper utilities for build

OPENSSL_VERSION=1.1.1c
OPENSSL_FNAME=openssl-${OPENSSL_VERSION}
PYTHON_VERSION=3.7.3
PREFIX=/opt/cfs

function ensure_prefix {
    mkdir -p ${PREFIX}
}

function build_openssl {
    ensure_prefix
    wget https://www.openssl.org/source/${OPENSSL_FNAME}.tar.gz
    tar xf ${OPENSSL_FNAME}.tar.gz
    pushd ${OPENSSL_FNAME}
    ./config --prefix=/opt/cfs no-shared
    make -j
    make install_sw install_ssldirs
    popd
    rm -rf ${OPENSSL_FNAME} ${OPENSSL_FNAME}.tar.gz
}

function build_python {
    ensure_prefix
    wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
    tar xf Python-${PYTHON_VERSION}.tgz
    pushd Python-${PYTHON_VERSION}
    ./configure --disable-shared --prefix ${PREFIX} --with-openssl=${PREFIX}
    make -j
    make install
    popd
    rm -rf Python-${PYTHON_VERSION} Python-${PYTHON_VERSION}.tgz
}
