eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
    set omp_theme ~/.config/oh-my-posh/mytheme.omp.json
    oh-my-posh init fish --config $omp_theme | source

    zoxide init fish | source
    fzf --fish | source
    source (pyenv init -|psub)

    set -gx EDITOR /usr/local/bin/code
    set -gx VISUAL $EDITOR

    set -gx FZF_DEFAULT_OPTS '--style=full --layout=reverse --border --preview="~/.config/fzf/preview.sh {}"'

    set -l libs curl llvm node openjdk@17
    for lib in $libs
        set -l base /opt/homebrew/opt/$lib
        if test -d $base/lib
            set -gxa LDFLAGS -L$base/lib
        end
        if test -d $base/include
            set -gxa CPPFLAGS -I$base/include
        end
    end

    test -e "$HOME/.iterm2_shell_integration.fish"; and source "$HOME/.iterm2_shell_integration.fish"
end
