#!/usr/bin/env bash

source ./terminal.sh
customize_terminal_output

# Stop and Remove ALL containers

echo "${header}Stop and remove containers${reset}"

if [[ -z "$(docker ps -a -q | uniq)" ]] ; 
then
    echo "${info}No containers to remove${reset}"
  else
    docker rm -f $(docker ps -a -q | uniq) || exit 1
    echo "${info}All containers have been removed${reset}"
fi

# Remove ALL images

echo "${header}Remove images${reset}"

if [[ -z "$(docker images -a -q | uniq)" ]] ; 
then
    echo "${info}No images to remove${reset}"
  else
    docker rmi -f $(docker images -a -q | uniq) 2> /dev/null || true
    echo "${info}All images not being used have been removed${reset}"
fi

# Delete ALL Volumes

echo "${header}Delete volumes${reset}"

if [[ -z "$(docker volume ls -q | uniq)" ]] ; 
then
    echo "${info}No volumes to delete${reset}"
  else
    docker rmi -f $(docker volume ls -q | uniq)  2> /dev/null | true
    echo "${info}All volumes have been deleted${reset}" 
fi

# Delete RDFox data files

echo "${header}Delete RDFox data files${reset}"
cd home
rm -Rf */
rm -rf .RDFox