#!/usr/bin/env bash

SCRIPT=$(basename "$0")
VERSION="1.0.0"
ARG="$1"
function usage
{
    local txt=(
    "Boilerplate generator for Linux C++ projects."
    ""
    "Usage: $SCRIPT [options] <PROJECT_NAME>"
    ""
    "Options:"
    "   --help, -h       print help"
    "   --version, -v    print version"
    )
    printf "%s\n" "${txt[@]}"
}

function badUsage
{
    local txt=(
    "Option/command not recognized. For help type $SCRIPT --help"
    )
    printf "%s\n" "${txt[@]}"
}

function version
{
    echo "$SCRIPT version $VERSION"
}

function makedirs
{
    echo "Making directories..."
    mkdir -p ./$ARG/src ./$ARG/bin ./$ARG/obj ./$ARG/debug
}

function maketemplate
{
    echo "Creating makefile template..."
    sed s/\<PROJECTNAME\>/$ARG/g ./template.mk > ./$ARG/Makefile
    echo "Creating main template..."
    cat ./template_main.cpp > ./$ARG/src/main.cpp
}


if [[ $ARG = "" ]]; then usage; exit 0; fi
case "$ARG" in
    --help | -h)
        usage
        exit 0
    ;;
    --version | -v)
        version
        exit 0
    ;;
esac
makedirs
maketemplate
