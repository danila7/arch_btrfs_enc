#!/bin/bash
mkdir temp mnt build share Videos Downloads
broot --install
echo "Stay near the pc, you will have to enter root password for a few times"
echo "Updating mirrors"
sudo reflector --verbose --sort rate --country Russia --country Germany --age 12 --save /etc/pacman.d/mirrorlist
echo "Setting timezone and time sync..."
timedatectl set-ntp true
timedatectl set-timezone Europe/Moscow 
git config --global user.name "Danila"
git config --global user.email "dghak@bk.ru"
(crontab -l 2>/dev/null; echo "*/2 * * * * ~/scripts/hib_on_low.sh >/dev/null 2>&1") | crontab -
echo "Installing additiional packages..."
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
yay -S  upd72020x-fw mellowplayer swaynagmode qt5-styleplugins gtk-theme-numix-solarized numix-icon-theme-git kotatogram-desktop-bin mimeo perl-file-mimeinfo qbittorrent-enhanced-git pipewire libpipewire02 xdg-desktop-portal xdg-desktop-portal-wlr fedora-firefox-wayland-bin chromium wofi-hg ytop-bin nerd-fonts-dejavu-complete i3ipc-python-git clipman tor-browser smtube youtube-dl translate-shell obs-studio-wayland wlrobs zoom swaylock-effects-git yandex-disk adbfs-rootless-git scrcpy nm-connection-editor hunspell hunspell-en_US hunspell-ru-aot-ieyo hyphen hyphen-en hyphen-ru --noconfirm --sudoloop
yay -Rdd xdg-utils --noconfirm
yay -S xdg-utils-mimeo --noconfirm
echo "Zoom configuration..."
cp /usr/share/applications/Zoom.desktop ~/.local/share/applications
sed -i 's+Exec=/usr/bin/zoom %U+Exec=env QT_QPA_PLATFORM=xcb /usr/bin/zoom %U+g' ~/.local/share/applications/Zoom.desktop
update-desktop-database ~/.local/share/applications &> /dev/null
yay -Rns gnu-free-fonts --noconfirm --sudoloop
nvim -c ":PlugInstall"
echo "# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi" > ~/.zprofile
sudo umount -R /.snapshots
sudo umount -R /home/.snapshots
sudo rm -r /.snapshots
sudo rm -r /home/.snapshots
sudo snapper -c root create-config /
sudo snapper -c home create-config /home
sudo btrfs subvolume delete /.snapshots
sudo btrfs subvolume delete /home/.snapshots
sudo mkdir /.snapshots
sudo mkdir /home/.snapshots
sudo mount -a
sudo chmod 750 /.snapshots
sudo chmod 750 /home/.snapshots
sudo sed -i 's/TIMELINE_CREATE="yes"/TIMELINE_CREATE="no"/g' /etc/snapper/configs/root
sudo sed -i 's/TIMELINE_CREATE="yes"/TIMELINE_CREATE="no"/g' /etc/snapper/configs/home
sudo mkdir /.bootbackup
sudo cp -r /boot /.bootbackup/
sudo snapper -c root create --description "After installation"
sudo snapper -c home create --description "After installation"
sleep 2
rm "after_install.sh"
reboot
