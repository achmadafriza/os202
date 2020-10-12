#!/bin/bash
# Script to Automate Logging
# include this boilerplate
function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

start=${1:-"start"}

jumpto $start

start:
# your script goes here...
echo "Let's log your week!"
echo "What Week do you want to log? "
read week

count=0
while [ true ]
do
    echo -e "Logging W$week...\n\n"

    cat ~/logCodes.txt

    echo -e "\nLog Code: "
    read logCode

    echo "Minutes: "
    read minutes

    echo "Description: "
    read desc

    echo -e "ZCZC W$week $minutes L$logCode $desc\nIs this Correct? (y/n) "
    read confirm

    while [[ true ]]
    do
        case $confirm in
        "y")
        echo "ZCZC W$week $minutes L$logCode $desc" >> ~/os202/TXT/mylog.txt; break ;;
        "Y")
        echo "ZCZC W$week $minutes L$logCode $desc" >> ~/os202/TXT/mylog.txt; break ;;
        "n")
        break ;;
        "N")
        break ;;
        *)
        echo "ZCZC W$week $minutes L$logCode $desc\nIs this Correct? (y/n) "; read confirm ;;
        esac
    done
    
    ((count++))

    echo "Want to Log more? (y/n) "
    read confirm

    while [[ true ]]
    do
        case $confirm in
        "y")
        break ;;
        "Y")
        break ;;
        "n")
        jumpto end ;;
        "N")
        jumpto end ;;
        *)
        echo "Want to Log more? (y/n) "; read confirm ;;
        esac
    done
done

end:
echo "$count log is added..."
