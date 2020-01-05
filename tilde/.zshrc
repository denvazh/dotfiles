# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Name of the theme to load
# look in ~/.oh-my-zsh/themes/
export ZSH_THEME="mh"

# oh-my-zsh plugins (can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins should be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git git-flow github brew sublime npm vagrant docker)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load user settings
source $HOME/dotfiles/zsh/env.zsh
source $HOME/dotfiles/zsh/path.zsh
source $HOME/dotfiles/zsh/aliases.zsh
source $HOME/dotfiles/zsh/key-bindings.zsh

case "$OSTYPE" in
  darwin*)
    # iTerm2 shell integration
    source $HOME/dotfiles/zsh/iterm2-shell-integration.zsh

    # Amazon AWS
    [[ -f ${BREW_PREFIX}/share/zsh/site-functions/_aws ]] && source ${BREW_PREFIX}/share/zsh/site-functions/_aws

    # Load zsh syntax highlight
    [[ -f ${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ;;
esac

# Load private zsh settings
[[ -f $HOME/.zshlocal ]] && source $HOME/.zshlocal
