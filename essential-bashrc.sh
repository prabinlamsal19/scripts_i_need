# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#thefuck
eval $(thefuck --alias)

#flutter aliases 
alias flbr='flutter pub run build_runner watch --delete-conflicting-outputs' 
alias flbrb='flutter pub run build_runner build --delete-conflicting-outputs' 
alias flget='flutter pub get'
alias flr='flutter run --dart-define=flavor=staging'
alias flc='flutter clean'
alias flget-all='~/bin/flutter-pubget-directory.sh'

#folder alias
alias notes='cd ~/Documents/misc-docs/notes && nvim .'
alias note="cd ~/Documents/misc-docs/notes  &&  vim note-$(date +"%b-%d\ %Y")" 

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

export JAVA_HOME=/usr/lib/jvm/default-java
export ANDROID_HOME=/home/user/Android/Sdk


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GITHUB_TOKEN='GITHUB_TOKEN_HERE'
alias ghtoken="echo $GITHUB_TOKEN | xclip -sel clip"


DEBEMAIL="prabinlamsal74@gmail.com"
debfullname="Prabin Lamsal"
export DEBEMAIL DEBFULLNAME

