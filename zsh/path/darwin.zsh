# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# nvm
[[ -f ${BREW_PREFIX}/opt/nvm/nvm.sh ]] && source ${BREW_PREFIX}/opt/nvm/nvm.sh

# gcloud
export CLOUDSDK_PYTHON="${BREW_PREFIX}/opt/python@3.8/libexec/bin/python"
if [[ -f "${BREW_PREFIX}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]]; then
  source "${BREW_PREFIX}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
fi
if [[ -f "${BREW_PREFIX}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "${BREW_PREFIX}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi
