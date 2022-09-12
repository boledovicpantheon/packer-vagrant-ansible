boot_command = [
  "c",
  "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/' ",
  "<enter><wait>",
  "initrd /casper/initrd<enter><wait>",
  "root=/dev/sr0<enter><wait>",
  "boot<enter>"
]
audio_controller             = "ac97"
boot_wait                    = "5s"
bundle_iso                   = false
communicator                 = "ssh"
cpus                         = 4
disable_shutdown             = false
disk_size                    = 50000
firmware                     = "bios"
format                       = "ova"
gfx_accelerate_3d            = true
gfx_controller               = "vboxsvga"
gfx_vram_size                = 64
guest_additions_mode         = "upload"
guest_additions_path         = "VBoxGuestAdditions.iso"
guest_os_family              = "linux"
guest_os_member              = "server"
guest_os_type                = "ubuntu_64"
guest_os_vendor              = "ubuntu"
guest_os_version             = "22.04"
hard_drive_interface         = "sata"
headless                     = false
host_port_max                = 4444
host_port_min                = 2222
http_directory               = "http/"
http_port_max                = 9000
http_port_min                = 8000
iso_checksum                 = "10f19c5b2b8d6db711582e0e27f5116296c34fe4b313ba45f9b201a5007056cb"
iso_file                     = "ubuntu-22.04.1-live-server-amd64.iso"
iso_path_external            = "https://releases.ubuntu.com/22.04"
keep_registered              = false
memory                       = 4096
nested_virt                  = true
nic_type                     = "82540EM"
shell_scripts                = ["scripts/vagrant.sh"]
shutdown_timeout             = "5m"
skip_export                  = false
ssh_agent_auth               = false
ssh_clear_authorized_keys    = false
ssh_disable_agent_forwarding = false
ssh_file_transfer_method     = "scp"
ssh_handshake_attempts       = 100
ssh_keep_alive_interval      = "5s" #-1 to disable
ssh_password                 = "vagrant"
ssh_port                     = 22
ssh_pty                      = false
ssh_timeout                  = "30m"
ssh_username                 = "vagrant"
vboxmanage                   = [[]]
vm_name                      = "ubuntu-jammy"
#shutdown_command            = configured in ubuntu-base.pkr.hcl
