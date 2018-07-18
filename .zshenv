export TERM="xterm-256color"
export ANDROID_HOME=~/Library/Android/sdk
export PYENV_ROOT="$HOME/.pyenv"
export ZSH=$HOME/.oh-my-zsh
export PATH="$PYENV_ROOT/bin:$PATH:"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# FBM DEV SETTINGS
export NAME="DEV"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

  # AWS Auth Strings #
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
