#!/usr/bin/env bash

declare username=""
declare password=""
declare base_url=""
declare job_list=""

refresh_status() {
    local query="lastBuild/api/json?pretty=true&tree=result,building"
    tput bold
    
    for job in $job_list; do
        tput setaf 7
        toilet -f standard -t $job
        tput setaf 2

        if [ "$username" ]; then
            curl -s -u "$username:$password" "$base_url/job/$job/$query" | grep result | awk '{print $3}' | sed 's/[",]//g' | toilet -t -f mini
        else
            curl -s "$base_url/job/$job/$query" | grep result | awk '{print $3}' | sed 's/[",]//g' | toilet -t -f mini
        fi 

        echo 
    done

    tput sgr0
}

show_help() {
    echo "Usage: ./bashmon.sh -u <username> -p <password> -b <baseurl> -j <jobs>"
}

OPTIND=1

if [ -z "$1" ]; then
    show_help
    exit 0
fi

while getopts "h?u:p:b:j:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    u)  username=$OPTARG
        ;;
    p)  password=$OPTARG
        ;;
    b)  base_url=$OPTARG
        ;;
    j)  job_list=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

refresh_status
