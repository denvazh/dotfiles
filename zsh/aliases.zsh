# Enable sudo for aliases
alias sudo="sudo "

# Shortcuts
alias ls="ls -G"
alias be='bundle exec'

# Git
# sync current master with upstream remote state
alias git-fm="git fetch -p && git checkout master && git reset --hard origin/master"

# Homebrew
alias brew-up="brew update && brew upgrade --all && brew cleanup"

# Tools
alias speedtest='curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias globping="ping 8.8.8.8"
