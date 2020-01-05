# Homebrew install dir
BREW_INSTALL_DIR=
if which brew > /dev/null; then BREW_INSTALL_DIR=$(brew --prefix); fi
export BREW_PREFIX=${BREW_INSTALL_DIR:-/usr/local}

# rbenv install dir
export RBENV_ROOT=${BREW_PREFIX}/var/rbenv

# pyenv install dir
export PYENV_ROOT=${BREW_PREFIX}/var/pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYTHONSTARTUP=$HOME/.pythonrc.py

# jenv install dir
export JENV_ROOT="$HOME/.jenv"

# nvm install dir
export NVM_DIR="$HOME/.nvm"

# Yarn executables
YARN_BIN_DIR=
if which yarn > /dev/null; then
  YARN_BIN_DIR="$(yarn global bin)"
fi

# Android
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
