#!/bin/bash

# Create OSX wheels for psycopg2
#
# Following instructions from https://github.com/MacPython/wiki/wiki/Spinning-wheels
# Cargoculting pieces of implementation from https://github.com/matthew-brett/multibuild

set -e -x

# Should come from input

PYVER3=2.7.13

# Install Python
PYVER2=${PYVER3:0:3}
PYVER1=${PYVER3:0:1}
PYINST="python-{$PYVER3}-macosx10.6.pkg"
PYURL="https://www.python.org/ftp/python/${PYVER3}/$PYINST"
curl "$PYURL" "$PYINST"
sudo installer -pkg "$PYINST" -target /
MACPYTHON_PY_PREFIX=/Library/Frameworks/Python.framework/Versions
PYEXE=$MACPYTHON_PY_PREFIX/${PYVER2}/bin/python${PYVER2}

# TODO: Install certificates for Python 3.6

