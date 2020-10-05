# Script to Automate Logging

echo "Let's log your week!"
echo "What Week do you want to log? "
read week

count=0
valid=true
while [ $valid ]
do
    echo -e "Logging W$week...\n\n"

    cat ~/logCodes.txt

    echo -e "\nLog Code: "
    read logCode

    echo "Minutes: "
    read minutes

    echo "Description: "
    read desc

    echo -e "ZCZC W$week $minutes $logCode $desc\nIs this Correct? (y/n) "
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
        valid=false; break ;;
        "N")
        valid=false; break ;;
        *)
        echo "Want to Log more? (y/n) "; read confirm ;;
        esac
    done
    ((count++))
done

echo "$count log is added..."