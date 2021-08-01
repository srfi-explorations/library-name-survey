#!/bin/sh
set -eu
chez --program library-name-groups.scm \
    <library-name-list.text \
    >library-name-groups.text
