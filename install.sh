#!/usr/bin/env bash

bin=$HOME/.local/bin
config=$HOME/.config/templates/cpp
mkdir -p $bin $config
cp $PWD/newproject.sh $bin/newproject
cp $PWD/template.mk $config
cp $PWD/template_main.cpp $config
chmod +x $bin/newproject
