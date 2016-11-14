function vgain {
  if ! [[ -d /media/VBox ]]; then
    mkdir -p /media/VBox
  fi
  mount -r /dev/cdrom /media/VBox
  slapt-get -i gcc make bzip2 perl kernel-headers
  cd /media/VBox
  ./VBoxLinuxAdditions.run
}
