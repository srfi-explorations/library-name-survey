#!/bin/sh
set -eu

fetch() {
    curl --location --fail --silent --show-error -o "$1" \
        "https://files.scheme.org/$1"
}

fetch ikarus-0.0.3.tar.gz
fetch larceny-1.3-src.tar.gz
fetch loko-0.8.0.tar.gz
fetch mosh-0.2.7.tar.gz
fetch sagittarius-0.9.7.tar.gz
