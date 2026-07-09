# Dotfiles

Personal macOS dotfiles for Homebrew bundle, Fish shell, Git, Oh My Posh, fzf, tmux, and related app configuration.

## Install packages

Run the install script from the repository root:

```bash
./install.sh
```

The script checks whether Homebrew is already installed. If `brew` is missing, it installs Homebrew with the official installer, then runs `brew bundle` with the repository `Brewfile`.

The `Brewfile` is grouped by package category: developer tools, shell utilities, runtimes, media tools, workflow tools, AI CLIs, desktop apps, browsers, productivity apps, JDK casks, and fonts.

## Set up Fish shell

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

## Set up Git

Link the repository Git configuration into the home directory:

```bash
ln -sf "$PWD/git/.gitconfig" ~/.gitconfig
```

## Set up Oh My Posh

Create the config directory and link the main theme:

```bash
mkdir -p ~/.config/oh-my-posh
ln -sf "$PWD/oh-my-posh/mytheme.omp.json" ~/.config/oh-my-posh/mytheme.omp.json
```

If using the separate Claude theme, link it as well:

```bash
ln -sf "$PWD/oh-my-posh/.claude.omp.json" ~/.config/oh-my-posh/.claude.omp.json
```

## Set up tmux

Link the local tmux configuration:

```bash
ln -sf "$PWD/tmux/tmux.conf.local" ~/.tmux.conf.local
```

## Verify

Check the Homebrew bundle:

```bash
brew bundle check --file="$PWD/Brewfile"
```

Check Fish:

```bash
fish --version
```

Check Oh My Posh:

```bash
oh-my-posh --version
```

