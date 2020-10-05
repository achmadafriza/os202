# Script to Automate Logging

echo "Let's log your week!"
echo "What Week do you want to log? "
read week

count = 0
valid = true
while [ $true ]
do
    echo "Logging W$week...\n\n"

    for i in $(wget -O- -q https://osp4diss.vlsm.org/ETC/logCodes.txt)
    do
        echo $i
    done

    echo "\nLog Code: "
    read logCode

    echo "Minutes: "
    read minutes

    echo "Description: "
    read desc

    echo "ZCZC $week $minutes $logCode $desc\nIs this Correct? (y/n) "
    read confirm

    while [[ true ]]
    do
        case $confirm in
        "y")
        echo "ZCZC $week $minutes $logCode $desc" > ~/os202/TXT/mylog.txt ;;
        "Y")
        echo "ZCZC $week $minutes $logCode $desc" > ~/os202/TXT/mylog.txt ;;
        "n")
        break ;;
        "N")
        break ;;
        *)
        echo "ZCZC $week $minutes $logCode $desc\nIs this Correct? (y/n) "; read confirm ;;
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
        valid = false ;;
        "N")
        valid = false ;;
        *)
        echo "Want to Log more? (y/n) "; read confirm ;;
        esac
    done
    ((count++))
done

echo "$count log is added..."