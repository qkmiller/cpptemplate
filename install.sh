#!/usr/bin/env bash

bin=$HOME/.local/bin/
templates=$HOME/.config/mkproject/templates/

echo "Installing to $HOME/.local/bin"
echo "Copying templates to $HOME/.config/mkproject/templates"
mkdir -p $bin $templates
cp -i $PWD/mkproject $bin/mkproject
cp -i $PWD/cpp_makefile.mk $templates
cp -i $PWD/cpp_main.cpp $templates
#chmod +x $bin/mkproject
