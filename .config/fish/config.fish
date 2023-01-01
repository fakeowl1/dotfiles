if status is-interactive
    alias ls="lsd"
    alias nv="nvim"
	
	alias gc="git clone"
	alias gst="git status"
	alias bat="bat -p"
    
    alias la="lsd -la"
    
    alias dotfiles="git --git-dir=$HOME/repos/dotfiles --work-tree=$HOME/"

    set -x PF_INFO "ascii title os kernel wm shell pkgs memory"

    set srcdir "$HOME/.cache/"
    set pkgdir "$HOME/.npm/"
    alias npm="npm --cache $srcir/npm-cache"
	
    set fish_greeting
    # Commands to run in interactive sessions can go here
end
