export EDITOR=nvim

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="$XDG_CONFIG_HOME/zsh/history"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
