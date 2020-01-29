# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='subl'
fi

# TODO: configure less

# Grep colors
export GREP_COLOR='1;33'

# Load platform specific configuration
case "$OSTYPE" in
  darwin*)
    source $HOME/dotfiles/zsh/env/darwin.zsh
  ;;
  linux*)
    echo "Linux configuration is WIP"
  ;;
  dragonfly*|freebsd*|netbsd*|openbsd*)
    echo "BSD configuration is WIP"
  ;;
  cygwin*)
    echo "Cygwin not supported"
  ;;
  msys*)
    echo "Nobody should use Windows for development"
  ;;
esac
