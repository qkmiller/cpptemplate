#!/usr/bin/env bash

SCRIPT=$(basename "$0")
VERSION="1.0.0"
TYPE="$1"
NAME="$2"
function usage
{
    local txt=(
    "Boilerplate generator for Linux C++ projects."
    ""
    "Usage: $SCRIPT [OPTIONS|TYPE] <PROJECT_NAME>"
    "TYPES:"
    "   cpp              select c++ project type"
    "OPTIONS:"
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
    mkdir -p $PWD/$NAME/src $PWD/$NAME/bin $PWD/$NAME/obj $PWD/$NAME/debug
}

function maketemplate
{
    echo "Creating makefile template..."
    sed s/\<PROJECTNAME\>/$NAME/g $HOME/.config/templates/cpp/template.mk > ./$NAME/Makefile
    echo "Creating main template..."
    cat $HOME/.config/templates/cpp/template_main.cpp > ./$NAME/src/main.cpp
}


if [[ $# < 2 || $# > 2 ]]; then
    usage
    exit 0
fi
for arg in $@[@]
do
    case "$arg" in
        --help | -h)
            usage
            exit 0
        ;;
        --version | -v)
            version
            exit 0
        ;;
    esac
done
case "$TYPE" in
    cpp)
        makedirs
        maketemplate
        exit 0
        ;;
    *)
        usage
        exit 0
        ;;
esac
