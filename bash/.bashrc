# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Better ls
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -a --icons'
alias tree='eza --tree --icons'
alias gimp=~/Documents/GIMP-3.2.4-x86_64.appimage

#fuzzy finder setup
source /usr/share/fzf/shell/key-bindings.bash
fuzzy(){
    if [ $# -eq 0 ]; then
        fzf
    else
        "$@" "$(fzf)"
    fi
}
fuzzycd(){
    local dir
    dir=$(find . -type d | fzf) || return 
    cd "$dir"
}
#probably should write fuzzymv and fuzzy
docker() {
    if ! systemctl --quiet is-active docker.service; then
        sudo systemctl start docker.service >/dev/null 2>&1
    fi
    command docker "$@"
}
eval "$(starship init bash)"eval "$(mise activate bash)"

export PATH=$PATH:/home/c.kgagangowda/.spicetify
