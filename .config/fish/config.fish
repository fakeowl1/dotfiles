if status --is-login
 if test -z "$DISPLAY" -a $XDG_VTNR = 1
   startx &> ~/.bspwm.log
 end
end

if status is-interactive
  set -x XDG_CONFIG_HOME "$HOME/.config"
  set -x XDG_STATE_HOME "$HOME/.local/state"
  set -x XDG_CACHE_HOME "$HOME/.cache"
  set -x XDG_DATA_HOME $HOME/.local/share

  set -x DOCKER_CONFIG "$XDG_CONFIG_HOME/docker" 
  set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
  set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup" 
  set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
  set -x WINEPREFIX "$XDG_DATA_HOME/wine/" 
  set -x JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"
  set -x ANDROID_HOME "$XDG_DATA_HOME/android" 
  set -x _CONDA_ROOT "/opt/anaconda"  
  set -x PYENV_ROOT "$HOME/.pyenv"
  set -g fish_autosuggestion_enabled 0

  if test -e ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
  end

  alias ls="lsd"

  alias v="vim"
  alias nv="nvim"

  alias gc="git clone"
  alias gst="git status"
  alias bat="bat -p"

  alias la="lsd -la"
  
  set -U fish_user_paths $HOME/bin $fish_user_paths
  set -U fish_user_paths $HOME/.local/bin $fish_user_paths
  set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
  set -U fish_user_paths /opt/cuda/bin $fish_user_paths
  
  alias dotfiles="git --git-dir=$HOME/.cfg --work-tree=$HOME"
  alias chromium-browser-stable="chromium-browser-stable --disable-gpu --disable-software-rasterizer"

  set -x PF_INFO "ascii title os kernel wm shell pkgs memory"
  
  set -x TERM "xterm-256color"
  set -x EDITOR "nvim" 
  set -x VISUAL "nvim"

  # set srcdir "$HOME/.cache"
  set pkgdir "$HOME/.npm"
  alias npm="npm --cache $HOME/.cache/npm-cache"
  
  bind \el forward-word
  bind \eh backward-word

  bind \eg beginning-of-line
  bind \eG end-of-line
  
  # fish_ssh_agent

  set fish_greeting
  # Commands to run in interactive sessions can go here
end

# !! Contents within this block are managed by 'conda init' !!
# if test -f /opt/anaconda/bin/conda
#     eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
# end
