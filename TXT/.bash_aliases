alias cl="clear"
alias h="history"
alias slocal="ssh -p 6022 achmadafriza@localhost"
alias sbadak="ssh -p 6023 achmad.afriza@localhost"
alias tunnel='ssh -L 6023:badak.cs.ui.ac.id:22 achmad.afriza@kawung.cs.ui.ac.id'
alias rsyncDocs="  rsync -auv --delete -e 'ssh -p 6023' achmad.afriza@localhost:/extra/Docs/   ../OSResources/extra/Docs/"
alias rsyncDemos=" rsync -auv --delete -e 'ssh -p 6023' achmad.afriza@localhost:/extra/Demos/  ../OSResources/extra/Demos/"
alias rsyncSlides="rsync -auv --delete -e 'ssh -p 6023' achmad.afriza@localhost:/extra/Slides/ ../OSResources/extra/Slides/"
alias rsyncRLocal="rsync -auv --delete -e 'ssh -p 6022' achmadafriza@localhost:~/OSResources/ ../OSResources/"
alias rsyncRemote="rsync -auv --delete -e 'ssh -l \"Achmad Afriza\"' 10.0.2.2:/c/Programming/OS/os202/ ../os202/"
alias rsyncLocal="rsync -auv --delete -e 'ssh -p 6022' achmadafriza@localhost:~/os202/ ../os202/"
alias logtoday="bash myscript.sh"
alias csiggy="bash createsignature.sh"

# REV01 Mon 05 Oct 2020 09:14:50 AM WIB (rms46)
# START Sat 19 Sep 2020 00:00:00 (rms46)
gitstat() {
   git rev-parse --is-inside-work-tree &> /dev/null
   [ "$?" == "0" ] && git status
   ls -aF
   printf "ZCZC $USER ==== %s ===== PWD:%s\n" "$(date)" $(pwd)
}

# REV02 Mon 05 Oct 2020 07:34:14 AM WIB (RMS)
# REV01 (2020-10-04 07:43 PM UTC+7) Muhamad Yoga Mahendra (aceyoga) 
# START (2020-10-04 03:51 PM UTC+7) Muhamad Yoga Mahendra (aceyoga)
chktoken() {
    [ -z $1 ] && { 
        echo "Usage: chktoken <token>"
        echo "Example 1) chktoken 0"
        echo "           $(chktoken 0)"
        echo "Example 2) chktoken 1"
        echo "           $(chktoken 1)"
        echo "Example 3) chktoken XXXX"
        echo "           $(chktoken XXXX)"
        echo "Is $USER your GitHub Account? If not, please create a new user name"
        echo "If not, please cleate a new user name"
        return 0
    } || [ $1 == 0 ] && {
        echo "0"
        return 0
    } || [ $1 == 1 ] && {
        echo "$USER"
        return 0
    } || {
        STAMP=$(date +%M%S)
        echo "$USER $STAMP-$(echo $STAMP$USER$1 | sha1sum  | cut -c1-4 | tr '[:lower:]' '[:upper:]'  )"
        return 0
    }
}

# REV03 Mon Oct  5 09:25:23 WIB 2020 (RMS)
# REV02 Mon 05 Oct 2020 07:34:14 AM WIB (RMS)
# REV01 (2020-10-04 07:43 PM UTC+7) Muhamad Yoga Mahendra (aceyoga) 
# START (2020-10-04 03:51 PM UTC+7) Muhamad Yoga Mahendra (aceyoga) 
verifyToken() {
    [ -z $3 ] && { 
        echo "verifyToken()"
        echo "Usage: verifyToken TOKEN USER RESULT"
        echo "Or:    verifyToken TOKEN USER RESULT trueFalseMode"
        return 0
    }
    DATE="$(echo $3 | cut -d' ' -f2 | cut -d'-' -f1)"
    SHA="$(echo  $3 | cut -d' ' -f2 | cut -d'-' -f2)"
    RESULT="$(echo $DATE$2$1 | sha1sum  | cut -c1-4 | tr '[:lower:]' '[:upper:]' )"
    [ $SHA == $RESULT  ] && RETURN="1"      || RETURN="0"
    [ -z $4 ]            || return $RETURN
    [ "$RETURN" == "1" ] && echo "Verified" || echo "Error"
}
