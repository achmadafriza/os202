alias cl="clear"
alias h="history"
alias slocal="ssh -p 6022 achmadafriza@localhost"
alias sbadak="ssh -p 6023 achmad.afriza@localhost"
alias tunnel='ssh -L 6023:badak.cs.ui.ac.id:22 achmad.afriza@kawung.cs.ui.ac.id'
alias rsyncDocs="  rsync -auv --delete -e 'ssh -p 6023' achmad.afriza@localhost:/extra/Docs/   ../OSResources/extra/Docs/"
alias rsyncDemos=" rsync -auv --delete -e 'ssh -p 6023' achmad.afriza@localhost:/extra/Demos/  ../OSResources/extra/Demos/"
alias rsyncSlides="rsync -auv --delete -e 'ssh -p 6023' achmad.afriza@localhost:/extra/Slides/ ../OSResources/extra/Slides/"
alias rsyncLocal="rsync -auv --delete -e 'ssh -p 6022' achmadafriza@localhost:/OSResources/ ../OSResources/"
alias logtoday="bash /TXT/myscript.sh"
alias csiggy="bash /TXT/createsignature.sh"