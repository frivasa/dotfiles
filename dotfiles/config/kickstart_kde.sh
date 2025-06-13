# sudo pacman -S plasma-desktop kscreen ly dolphin kitty
git clone https://aur.archlinux.org/yay.git ~/Downloads/yay
cd ~/Downloads/yay
makepkg -si

sudo pacman -S keepassxc wl-clipboard docker filelight vlc zsh obsidian zsh-syntax-highlighting zsh-autosuggestions ttf-jetbrains-mono-nerd tmux imagemagick gwenview handbrake syncthing obs-studio nodejs npm tree-sitter-cli unzip rclone steam qbittorrent fastfetch yazi okular ollama python-pywal bc python-colorthief
yay -S dotdrop zen-browser-bin vesktop-bin konsave kwin-scripts-krohnkite-git plasma6-applets-panel-colorizer kwin-effect-rounded-corners-git video-downloader

export ZSH=~/.config/ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -fsSL https://pixi.sh/install.sh | sh

dotdrop install -p kde_desktop -f --cfg=~/dotfiles/dotdrop.config
konsave -i ~/dotfiles/newest.knsv
konsave -a newest -f
reboot

