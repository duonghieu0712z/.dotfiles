# Dotfiles

Personal dotfiles for macOS and Windows. The repository keeps package manifests, shell profiles, terminal themes, prompt themes, Git configuration, and small CLI helpers in one place.

## Repository layout

| Path | Platform | Purpose |
| :--- | :--- | :--- |
| `homebrew/Brewfile` | macOS | Homebrew package and cask manifest |
| `homebrew/install.sh` | macOS | Homebrew bootstrap and `brew bundle` runner |
| `scoop/Scoopfile.ps1` | Windows | Scoop bucket, package, font, and module manifest |
| `scoop/install.ps1` | Windows | Scoop bootstrap, package installer, and Windows dotfiles applier |
| `fish/` | macOS | Fish shell config, functions, completions, and plugins |
| `fzf/` | macOS | fzf preview helper |
| `git/` | macOS, Windows | Shared Git configuration |
| `iterm2/` | macOS | iTerm2 settings |
| `oh-my-posh/` | macOS, Windows | Oh My Posh themes |
| `powershell/` | Windows | PowerShell profile and Windows Terminal settings |
| `tmux/` | macOS | tmux local configuration |

## macOS setup

Run the Homebrew installer from the repository root:

```bash
./homebrew/install.sh
```

After installing packages, switch the default shell to Fish:

```bash
fish
chsh -s "$(which fish)"
```

Copy the Fish configuration:

```bash
mkdir -p ~/.config/fish
cp -R fish/. ~/.config/fish/
```

Link shared config files:

```bash
ln -sf "$PWD/git/.gitconfig" ~/.gitconfig
mkdir -p ~/.config/oh-my-posh
ln -sf "$PWD/oh-my-posh/mytheme.omp.json" ~/.config/oh-my-posh/mytheme.omp.json
ln -sf "$PWD/tmux/tmux.conf.local" ~/.tmux.conf.local
```

## Windows setup

Run the Scoop installer from the repository root:

```powershell
.\scoop\install.ps1
```

The script installs Scoop if needed, adds buckets from `scoop/Scoopfile.ps1`, installs configured packages and PowerShell modules, then applies the PowerShell profile, Oh My Posh theme, Git config, and Windows Terminal settings.

## Verify

Check the Homebrew bundle on macOS:

```bash
brew bundle check --file="$PWD/homebrew/Brewfile"
```

Check Scoop on Windows:

```powershell
scoop status
```

Check the prompt engine:

```bash
oh-my-posh --version
```
