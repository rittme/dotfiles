#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload bashcompinit
bashcompinit

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

# Disable autocorrect
unsetopt correct

export NVM_DIR="/Users/brittmeyer/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Look for .nvmrc in directories.  If found, change to that version of node.
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Doesn't work when in .zshenv
export EDITOR="code"
export GPG_TTY=$(tty)

# added by travis gem
[ -f /Users/eoger/.travis/travis.sh ] && source /Users/eoger/.travis/travis.sh
