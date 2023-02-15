#!/bin/bash

sync () {
    git checkout master
    git pull origin master:master
    git checkout develop
    git pull origin develop:develop
}

sync-repo () {
    for branch in $(git branch -a | grep remotes | grep -v HEAD); do
        git branch --track ${branch##*/} $branch
    done

    git fetch --all
    git pull --all
}

bump () {
    git commit -am "Bump version to $1"
}

track () {
    current=$(git rev-parse --abbrev-ref HEAD)
    git branch --set-upstream-to=origin/$current $current
}
