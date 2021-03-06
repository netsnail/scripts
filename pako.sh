#!/bin/bash

# set font size
gsettings set org.gnome.desktop.interface font-name 'Ubuntu 10'

# configure panel clock
gsettings set com.canonical.indicator.datetime show-date true
gsettings set com.canonical.indicator.datetime show-day true
gsettings set com.canonical.indicator.datetime show-week-numbers true

# configure panel sound
gsettings set com.canonical.indicator.sound visible true
gsettings set org.gnome.desktop.sound event-sounds false

# remove keyboard switch indicator from panel
gsettings set com.canonical.indicator.keyboard visible false

# configure workspaces
gsettings set org.gnome.desktop.wm.preferences num-workspaces 2

# configure session
gsettings set org.gnome.desktop.session idle-delay 600

# configure nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.list-view default-zoom-level 'smallest'

# configure gedit
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor create-backup-copy false

# autostart
[ ! -d ~/.config/autostart ] && mkdir ~/.config/autostart && chmod 700 ~/.config/autostart
ln -s /usr/share/applications/firefox.desktop ~/.config/autostart/
ln -s /usr/share/applications/thunderbird.desktop ~/.config/autostart/
ln -s /usr/share/applications/skype.desktop ~/.config/autostart/

# dont forward locale to server
sudo sed -i 's|    SendEnv LANG LC_*|#   SendEnv LANG LC_*|g' /etc/ssh/ssh_config
