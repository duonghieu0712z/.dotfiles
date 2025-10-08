eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
    set omp_theme ~/.config/oh-my-posh/mytheme.omp.json
    oh-my-posh init fish --config $omp_theme | source

    zoxide init fish | source
    fzf --fish | source
    jenv init - | source
    pyenv init - fish | source

    set -gx EDITOR /usr/local/bin/code
    set -gx VISUAL $EDITOR

    set -gx FZF_DEFAULT_OPTS '--style=full --layout=reverse --border --preview="~/.config/fzf/preview.sh {}"'

    # set -gxa LDFLAGS '-isysroot $(xcrun --show-sdk-path)'
    # set -gxa CPPFLAGS '-isysroot $(xcrun --show-sdk-path)'

    set -l libs curl llvm node node@22 openjdk@17 gettext
    for lib in $libs
        set -l base /opt/homebrew/opt/$lib
        if test -d $base/lib
            set -gxa LDFLAGS -L$base/lib
        end
        if test -d $base/include
            set -gxa CPPFLAGS -I$base/include
        end
    end

    set -gx ANDROID_HOME /Users/fe-hieu/Library/Android/sdk
    set -gx PATH /Users/fe-hieu/Library/Android/sdk/emulator /Users/fe-hieu/Library/Android/sdk/cmdline-tools/latest/bin /Users/fe-hieu/Library/Android/sdk/platform-tools $PATH

    test -e "$HOME/.iterm2_shell_integration.fish"; and source "$HOME/.iterm2_shell_integration.fish"
end
