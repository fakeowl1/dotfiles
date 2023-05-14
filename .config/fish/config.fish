if status is-interactive
	alias ls="lsd"
	
	alias v="vim"
	alias nv="nvim"
	
	alias gc="git clone"
	alias gst="git status"
	alias bat="bat -p"
	
	alias la="lsd -la"
	
	alias dotfiles="git --git-dir=/home/q/repos/dotfiles --work-tree=$HOME"
	
	set -U fish_user_paths $HOME/bin $fish_user_paths

	set -x PF_INFO "ascii title os kernel wm shell pkgs memory"
	set -x TERM "xterm"
  set -x EDITOR "nvim" 
  set -x XDG_DATA_HOME $HOME/.local/share

	set srcdir "$HOME/.cache/"
	set pkgdir "$HOME/.npm/"
	alias npm="npm --cache $srcir/npm-cache"

	set fish_greeting
	# Commands to run in interactive sessions can go here
end
