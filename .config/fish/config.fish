if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec Hyprland > ~/.hyprland.log
  end
end

if status is-interactive
	alias ls="lsd"
	
	alias v="vim"
	alias nv="nvim"
	
	alias gc="git clone"
	alias gst="git status"
	alias bat="bat -p"
	
	alias la="lsd -la"
  
	set -U fish_user_paths $HOME/bin $fish_user_paths
	set -U fish_user_paths $HOME/.local/bin $fish_user_paths
	alias dotfiles="git --git-dir=/home/q/repos/dotfiles --work-tree=$HOME"
  alias chromium-browser-stable="chromium-browser-stable --disable-gpu --disable-software-rasterizer"

	set -x PF_INFO "ascii title os kernel wm shell pkgs memory"
  
  set -x TERM "xterm-256color"
  set -x EDITOR "nvim" 
  set -x VISUAL "nvim"

  set -x XDG_DATA_HOME $HOME/.local/share

	set srcdir "$HOME/.cache/"
	set pkgdir "$HOME/.npm/"
	alias npm="npm --cache $srcir/npm-cache"
  
	set fish_greeting
	# Commands to run in interactive sessions can go here
end
