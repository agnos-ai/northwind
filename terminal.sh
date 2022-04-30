#!/usr/bin/env bash

# Customize terminal output

customize_terminal_output(){
    bold=$(tput bold)
    underline=$(tput smul)
    italic=$(tput sitm)
    header=$(tput setab 4)
    task=$(tput setaf 4)
    info=$(tput setaf 2)
    error=$(tput setaf 160)
    warn=$(tput setaf 214)
    reset=$(tput sgr0)
}