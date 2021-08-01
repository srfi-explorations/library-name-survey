#!/bin/sh
set -eu

process() {
    cd download
    echo "$1"
    tar -xf "$1.tar.gz"
    grep -ERhio '\(srfi :[0-9]+ [ a-z0-9-]+\)' "$1" | sort | uniq
    cd ..
}

process_all() {
    process ikarus-0.0.3
    echo
    process larceny-1.3-src
    echo
    process loko-0.8.0
    echo
    process mosh-0.2.7
    echo
    process sagittarius-0.9.7
}

process_all >library-name-list.text
