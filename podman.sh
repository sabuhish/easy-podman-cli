#!/bin/bash

# Author Sabuhi Shukurov
VERSION="0.3"

ISSUE_URL="https://github.com/sabuhish/easy-podman-cli/issues"
README_URL="https://github.com/sabuhish/easy-podman-cli/blob/master/README.md"

SCRIPT_URL="https://raw.githubusercontent.com/sabuhish/easy-podman-cli/master/commands"

CURRENT_DIRECTORY=$(pwd)
COMMANDS_DIRECTORY=/usr/local/bin/

# The set -e option instructs bash to immediately exit if any command [1] has a non-zero exit status
set -e


function proceed_before_apply(){
    if [ -e $CURRENT_DIRECTORY/commands/$1 ]; then	
        cp  $1  $COMMANDS_DIRECTORY

    else
        curl "$SCRIPT_URL/commands/$1" -o $1
        mv  $1  $COMMANDS_DIRECTORY

    fi

}

function build_podman(){
    proceed_before_apply  build-podman

}


function connect_container(){
    proceed_before_apply connect-podman
    
}


function podman_restart(){
 
    proceed_before_apply restart-podman
}


function podman_restart_compose(){

    proceed_before_apply restart-podman-compose
}

function dangling_remove_podman(){

    proceed_before_apply dangling-podman
}

function podman_compose_logs(){

    proceed_before_apply podman-compose-logs
}

function down_podman_containers(){

    proceed_before_apply down-podman
    
}


function usage(){

    proceed_before_apply easy-podman
}


function apply_comands(){
    #checking if user is root 0 => root !0  is non-root user
    if [[ $EUID -eq 0 ]]; then
        dangling_remove_podman
        connect_container
        build_podman
        down_podman_containers
        podman_compose_logs
        podman_restart
        podman_restart_compose
        usage
       
        cd $COMMANDS_DIRECTORY

        chmod +x dangling-podman
        chmod +x connect-podman
        chmod +x build-podman
        chmod +x down-podman
        chmod +x podman-compose-logs
        chmod +x restart-podman
        chmod +x restart-podman-compose
        chmod +x easy-podman

        cd $CURRENT_DIRECTORY

    else
        # dangling_remove_podman
        # cd $COMMANDS_DIRECTORY

        # chmod +x dangling-podman
        # cd $CURRENT_DIRECTORY

        echo "Not root user" 

    fi

}

apply_comands

# rm -rf podman.sh