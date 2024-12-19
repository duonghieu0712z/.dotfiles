if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

set omp_theme '~/.config/oh-my-posh/mytheme.omp.json'
oh-my-posh init fish --config $omp_theme | source

zoxide init fish | source

fzf --fish | source

set -gx EDITOR '/usr/local/bin/code'
set -gx VISUAL $EDITOR

set -gx FZF_DEFAULT_OPTS '--layout=reverse --border --preview="bat {}"'

set -gxa LDFLAGS "-L/opt/homebrew/opt/curl/lib"
set -gxa CPPFLAGS "-I/opt/homebrew/opt/curl/include"

set -gxa LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gxa CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

set -gx LDFLAGS "-L/opt/homebrew/opt/node/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/node/include"

set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@17/include"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
