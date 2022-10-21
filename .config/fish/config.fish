if status is-interactive
    alias ls="lsd"
    alias nv="nvim"
	
	alias gc="git clone"
	alias gst="git status"
	alias bat="bat -p"
    
    alias recscreen="ffmpeg -f x11grab -y -framerate 30 -s 1600x900 -i :0.0 -c:v libx264 -preset superfast -crf 18 "Video/$(date +'%Y-%m-%d_%H:%M').mp4""

    alias la="lsd -la"
    
    set -x PF_INFO "ascii title os kernel wm shell pkgs memory"

    set srcdir "$HOME/.cache/"
    set pkgdir "$HOME/.npm/"
    alias npm="npm --cache $srcir/npm-cache"
	set fish_greeting
    # Commands to run in interactive sessions can go here
end
