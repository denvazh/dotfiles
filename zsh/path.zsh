# Prepend function

function _prepend_path() {
  PATH="$1:$PATH"
}

# Create PATH in the following order
# 1. Default paths
# 2. ./.bin and ./node_modules/.bin - shortcut to executables inside local project directory
# 3. Custom bin directory with various user scripts

# Load platform specific configuration
# On Mac OS X (Darwin) PATH already have default entries set with path_helper ( see /etc/zprofile )
case "$OSTYPE" in
  darwin*)
    PATH=$PATH
    source $HOME/dotfiles/zsh/path/darwin.zsh
  ;;
  *)
    PATH="./node_modules/.bin:./.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
  ;;
esac

[[ -d "$YARN_BIN_DIR" ]] && _prepend_path "$YARN_BIN_DIR"
[[ -d ~/dotfiles/bin ]] && _prepend_path "$HOME/dotfiles/bin"
[[ -d ~/bin ]] && _prepend_path "$HOME/bin"
[[ -d /Applications/IntelliJ\ IDEA.app/Contents/MacOS ]] && _prepend_path "/Applications/IntelliJ IDEA.app/Contents/MacOS"
[[ -d "$BEALL_DIR/bin" ]] && _prepend_path "$BEALL_DIR/bin"
export PATH

# Remove duplicates
# http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html
typeset -U PATH
