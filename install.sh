#!/bin/bash

rm -rf ~/.config/nvim/
mkdir -p ~/.config/nvim
cp init.lua ~/.config/nvim
cp -r lua ~/.config/nvim
cp -r lsp ~/.config/lsp
