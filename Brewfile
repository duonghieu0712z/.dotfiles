developer_tools = %w[
  cmake
  coreutils
  curl
  dos2unix
  gcc
  gh
  git
  git-delta
  git-lfs
  llvm
  make
  wget
]

shell_tools = %w[
  bat
  btop
  fd
  fish
  fzf
  hexyl
  htop
  jq
  lsd
  oh-my-posh
  tlrc
  tmux
  zoxide
]

runtimes = %w[
  jenv
  node
  node@22
  nvm
  openjdk@11
  openjdk@17
  ruby
  rustup
]

media_tools = %w[
  ffmpeg
]

workflow_tools = %w[
  czg
]

ai_cli_tools = %w[
  claude-code@latest
  codex
  kiro-cli
]

developer_tools.each { |name| brew name }
shell_tools.each { |name| brew name }
runtimes.each { |name| brew name }
media_tools.each { |name| brew name }
workflow_tools.each { |name| brew name }
ai_cli_tools.each { |name| brew name }

cask_args appdir: "~/Applications"

developer_apps = %w[
  android-studio
  docker-desktop
  fork
  git-credential-manager
  iterm2
  visual-studio-code
  zed
]

browsers = %w[
  brave-browser
  google-chrome
]

productivity_apps = %w[
  alt-tab
  appcleaner
  bitwarden
  dockdoor
  doll
  menumeters
  notion
  obsidian
  openkey
  raycast
  telegram-desktop
  tunnelblick
]

ai_apps = %w[
  chatgpt
  claude
  codex-app
]

communication_apps = %w[
  discord
]

java_casks = %w[
  temurin@21
  zulu@8
]

fonts = %w[
  font-caskaydia-cove-nerd-font
  font-fira-code-nerd-font
  font-powerline-symbols
]

developer_apps.each { |name| cask name }
browsers.each { |name| cask name }
productivity_apps.each { |name| cask name }
ai_apps.each { |name| cask name }
communication_apps.each { |name| cask name }
java_casks.each { |name| cask name }
fonts.each { |name| cask name }
