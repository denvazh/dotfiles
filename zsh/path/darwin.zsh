# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# nvm
[[ -f ${BREW_PREFIX}/opt/nvm/nvm.sh ]] && source ${BREW_PREFIX}/opt/nvm/nvm.sh
