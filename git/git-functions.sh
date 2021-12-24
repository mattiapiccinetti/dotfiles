#!/bin/bash

sync () {
    git checkout master
    git pull origin master:master
    git checkout develop
    git pull origin develop:develop
}

bump () {
    git commit -am "Bump version to $1"
}

track () {
    current=$(git rev-parse --abbrev-ref HEAD)
    git branch --set-upstream-to=origin/$current $current
}
