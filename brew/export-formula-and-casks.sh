#!/bin/bash

echo "Exporting Homebrew formulae"
brew leaves >l.txt

echo "Exporting Homebrew casks"
brew list --cask -1 >x.txt
