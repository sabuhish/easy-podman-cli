#!/bin/bash

# Author Sabuhi Shukurov
VERSION="0.2"

ISSUE_URL="https://github.com/sabuhish/easy-podman-cli"
README_URL="https://github.com/sabuhish/easy-podman-cli"

SCRIPT_URL="https://raw.githubusercontent.com/sabuhish/easy-podman-cli/master"

CURRENT_DIRECTORY=$(pwd)
COMMANDS_DIRECTORY=/usr/local/bin/

# The set -e option instructs bash to immediately exit if any command [1] has a non-zero exit status
set -e


function build_podman(){
    if [ -e $CURRENT_DIRECTORY/build-podman ]; then	
        cp  build-podman  $COMMANDS_DIRECTORY
    else

        curl "$SCRIPT_URL/build-podman" -o build-podman
        mv  build-podman  $COMMANDS_DIRECTORY
    fi

}


function connect_container(){
    if [ -e $CURRENT_DIRECTORY/connect-podman ]; then	
        cp  connect-podman  $COMMANDS_DIRECTORY

    else
        curl "$SCRIPT_URL/connect-podman" -o connect-podman
        mv  connect-podman  $COMMANDS_DIRECTORY
    fi
}


function podman_restart(){
    if [ -e $CURRENT_DIRECTORY/restart-podman ]; then	
        cp  restart-podman  $COMMANDS_DIRECTORY
 
    else
        curl "$SCRIPT_URL/restart-podman" -o restart-podman
        mv  restart-podman  $COMMANDS_DIRECTORY
    fi
}


function podman_restart_compose(){
    if [ -e $CURRENT_DIRECTORY/restart-podman-compose ]; then	        
        cp  restart-podman-compose  $COMMANDS_DIRECTORY
 
    else
        curl "$SCRIPT_URL/restart-podman-compose" -o restart-podman-compose
        mv  restart-podman-compose  $COMMANDS_DIRECTORY
    fi
}

function dangling_remove_podman(){

    if [ -e $CURRENT_DIRECTORY/dangling-podman ]; then	
        cp dangling-podman $COMMANDS_DIRECTORY
    else
        curl "$SCRIPT_URL/dangling-podman" -o dangling-podman
        mv  dangling-podman  $COMMANDS_DIRECTORY
    fi

}

function podman_compose_logs(){
    if [ -e $CURRENT_DIRECTORY/podman-compose-logs ]; then	        
        cp  podman-compose-logs  $COMMANDS_DIRECTORY

    else
        curl "$SCRIPT_URL/podman-compose-logs" -o podman-compose-logs
        mv  podman-compose-logs  $COMMANDS_DIRECTORY
    fi

}

function down_podman_containers(){

    if [ -e $CURRENT_DIRECTORY/down-podman ]; then	
        cp  down-podman  $COMMANDS_DIRECTORY

    else
        curl "$SCRIPT_URL/down-podman" -o down-podman
        mv  down-podman  $COMMANDS_DIRECTORY
    fi
}


function usage(){
    if [ -e $CURRENT_DIRECTORY/easy-podman ]; then	
        cp  easy-podman  $COMMANDS_DIRECTORY

    else
        curl "$SCRIPT_URL/easy-podman" -o easy-podman
        mv  easy-podman  $COMMANDS_DIRECTORY
    fi
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