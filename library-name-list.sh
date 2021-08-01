#!/bin/sh
set -eu

process() {
    cd download
    test -d "$1" || tar -xf "$1.tar.gz"
    grep -ERhio '\(srfi :[0-9]+ [ a-z0-9-]+\)' "$1" || true
    cd ..
}

process_all() {
    process ikarus-0.0.3
    process larceny-1.3-src
    process loko-0.8.0
    process mosh-0.2.7
    process sagittarius-0.9.7
}

process_all | sort | uniq >library-name-list.text
