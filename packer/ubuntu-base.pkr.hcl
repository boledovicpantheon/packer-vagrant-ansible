##
##  Locals
##
locals {
  #buildtime = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  name = "${var.guest_os_vendor}-${var.guest_os_member}-${var.guest_os_version}"
}
##
##  Variables
##
variable "audio_controller" {
  type        = string
  description = "The audio controller type to be used."
  default     = "ac97"
}
variable "boot_command" {
  type        = list(string)
  description = "Boot Command specifies the keys/commands to type when the virtual machine is first booted in order to start OS installer"
  default     = []
}
variable "boot_wait" {
  type        = string
  description = "How long will the process wait before typing the boot command"
  default     = "5s" #10s
}
variable "bundle_iso" {
  type        = bool
  description = "When enabled, Packer includes any attached ISO disc devices into the final virtual machine."
  default     = false
}
variable "communicator" {
  type        = string
  description = "What type of connection will be established to the machine: /none, ssh, winrm/"
  default     = "ssh"
}
variable "cpus" {
  type        = number
  description = "How many CPU cores will be the machine using"
  default     = 1
}
variable "description" {
  type    = string
  default = "Base box for Ubuntu distributions"
}
variable "disable_shutdown" {
  type        = bool
  description = "Disable shutdown, true or false."
  default     = false
}
variable "disk_size" {
  type        = number
  description = "The size, in megabytes, of the hard disk to create for the VM."
  default     = 40000
}
variable "firmware" {
  type        = string
  description = "The firmware to be used: BIOS or EFI."
  default     = "bios"
}
variable "format" {
  type        = string
  description = "Either ovf or ova, this specifies the output format of the exported virtual machine."
  default     = "ovf"
}
variable "gfx_accelerate_3d" {
  type        = bool
  description = "3D acceleration: true or false"
  default     = false
}
variable "gfx_controller" {
  type        = string
  description = "The graphics controller type which will be used."
  default     = "vboxsvga"
}
variable "gfx_vram_size" {
  type        = number
  description = "The VRAM size to be used."
  default     = 4
}
variable "guest_additions_mode" {
  type        = string
  description = "The method by which guest additions are made available to the guest for installation."
  default     = "upload"
}
variable "guest_additions_path" {
  type        = string
  description = " The path on the guest virtual machine where the VirtualBox guest additions ISO will be uploaded."
  default     = "VBoxGuestAdditions.iso"
}
variable "guest_os_family" {
  type        = string
  description = "The guest operating system family."
  default     = ""
}
variable "guest_os_member" {
  type        = string
  description = "The guest operating system member."
  default     = ""
}
variable "guest_os_type" {
  type        = string
  description = "The guest OS type being installed."
  default     = ""
}
variable "guest_os_vendor" {
  type        = string
  description = "The guest operating system vendor."
  default     = ""
}
variable "guest_os_version" {
  type        = string
  description = "The guest operating system version."
  default     = ""
}
variable "hard_drive_interface" {
  type        = string
  description = "The type of controller that the primary hard drive is attached to."
  default     = "sata"
}
variable "headless" {
  type        = bool
  description = "When this value is set to true, the machine will start without a console."
  default     = false
}
variable "host_port_max" {
  type        = number
  description = "The max port to use for the Communicator port on the host machine which is forwarded to the SSH or WinRM port on the guest machine."
  default     = 4444
}
variable "host_port_min" {
  type        = number
  description = "The min port to use for the Communicator port on the host machine which is forwarded to the SSH or WinRM port on the guest machine."
  default     = 2222
}
variable "http_directory" {
  type        = string
  description = "Path to a directory to serve using an HTTP server."
  default     = "http"
}
variable "http_port_max" {
  type        = number
  description = "The max port to use for the HTTP server started to serve the `http_directory`"
  default     = 9000
}
variable "http_port_min" {
  type        = number
  description = "The min port to use for the HTTP server started to serve the `http_directory`"
  default     = 8000
}
variable "iso_checksum" {
  type        = string
  description = "The checksum for the ISO file or virtual hard drive file."
  default     = ""
}
variable "iso_file" {
  type        = string
  description = "Name of the ISO file"
  default     = ""
}
variable "iso_path_external" {
  type        = string
  description = "External folder path to the ISO file"
  default     = ""
}
variable "keep_registered" {
  type        = bool
  description = "Set this to true if you would like to keep the VM registered with virtualbox."
  default     = false
}
variable "memory" {
  type        = number
  description = "The amount of RAM the VM will use"
  default     = 1024
}
variable "nested_virt" {
  type        = bool
  description = "Nested virtualization: false or true."
  default     = true
}
variable "nic_type" {
  type        = string
  description = "The NIC type to be used for the network interfaces."
  default     = "82540EM"
}
variable "shell_scripts" {
  type        = list(string)
  description = "A list of scripts."
  default     = []
}
variable "shutdown_command" {
  type        = string
  description = "The command to use to gracefully shut down the machine once all the provisioning is done."
  default     = ""
}
variable "shutdown_timeout" {
  type        = string
  description = "The amount of time to wait after executing the `shutdown_command` for the virtual machine to actually shut down."
  default     = "5m"
}
variable "skip_export" {
  type        = bool
  description = "When enabled, Packer will not export the VM."
  default     = false
}
variable "ssh_agent_auth" {
  type        = bool
  description = "If true, the local SSH agent will be used to authenticate connections to the source instance."
  default     = false
}
variable "ssh_clear_authorized_keys" {
  type        = bool
  description = "If true, Packer will attempt to remove its temporary key from ~/.ssh/authorized_keys and /root/.ssh/authorized_keys."
  default     = false
}
variable "ssh_disable_agent_forwarding" {
  type        = bool
  description = "SSH agent forwarding, true or false"
  default     = false
}
variable "ssh_file_transfer_method" {
  type        = string
  description = "How to transfer files through ssh"
  default     = "scp"
}
variable "ssh_handshake_attempts" {
  type        = number
  description = "The number of handshakes to attempt with SSH once it can connect."
  default     = 100
}
variable "ssh_keep_alive_interval" {
  type        = string
  description = "How often to send 'keep alive' messages to the server."
  default     = "5s" #-1 to disable
}
variable "ssh_password" {
  type      = string
  default   = "default"
}
variable "ssh_port" {
  type        = number
  description = "The port to connect to SSH"
  default     = 22
}
variable "ssh_pty" {
  type        = bool
  description = "If true, a PTY will be requested for the SSH connection."
  default     = false
}
variable "ssh_timeout" {
  type        = string
  description = "The time to wait for SSH to become available."
  default     = "30m"
}
variable "ssh_username" {
  type        = string
  description = "The username to connect to SSH with"
  default     = "default"
}
variable "vboxmanage" {
  type        = list(list(string))
  description = "Custom VBoxManage commands to execute in order to further customize the virtual machine being created."
  default     = [[]]
}
variable "vm_name" {
  type        = string
  description = "Name of the VM machine"
  default     = "ubuntu-vm"
}
##
##  Source
##
source "virtualbox-iso" "ubuntu-base" {
  audio_controller = var.audio_controller
  boot_command     = var.boot_command
  boot_wait        = var.boot_wait
  bundle_iso           = var.bundle_iso
  communicator         = var.communicator
  cpus = var.cpus
  disable_shutdown     = var.disable_shutdown
  disk_size = var.disk_size
  firmware             = var.firmware
  format            = var.format
  gfx_accelerate_3d = var.gfx_accelerate_3d
  gfx_controller    = var.gfx_controller
  gfx_vram_size     = var.gfx_vram_size
  guest_additions_mode = var.guest_additions_mode
  guest_additions_path = var.guest_additions_path
  guest_os_type        = var.guest_os_type
  hard_drive_interface = var.hard_drive_interface
  headless             = var.headless
  host_port_max        = var.host_port_max
  host_port_min        = var.host_port_min
  http_directory = var.http_directory
  http_port_max        = var.http_port_max
  http_port_min        = var.http_port_min
  iso_checksum = var.iso_checksum
  iso_url = "${var.iso_path_external}/${var.iso_file}"
  keep_registered              = var.keep_registered
  memory           = var.memory
  nested_virt      = var.nested_virt
  nic_type         = var.nic_type
  output_directory = "output/${local.name}/"
  shutdown_command = "echo '${var.ssh_password}' | sudo -S shutdown -P now"
  shutdown_timeout = var.shutdown_timeout
  skip_export                  = var.skip_export
  ssh_agent_auth               = var.ssh_agent_auth
  ssh_clear_authorized_keys    = var.ssh_clear_authorized_keys
  ssh_disable_agent_forwarding = var.ssh_disable_agent_forwarding
  ssh_file_transfer_method     = var.ssh_file_transfer_method
  ssh_handshake_attempts = var.ssh_handshake_attempts
  ssh_keep_alive_interval      = var.ssh_keep_alive_interval
  ssh_password = var.ssh_password
  ssh_port     = var.ssh_port
  ssh_pty                      = var.ssh_pty
  ssh_timeout  = var.ssh_timeout
  ssh_username = var.ssh_username
  vboxmanage                   = var.vboxmanage
  vm_name                      = "${local.name}"

}
##
##  Build
##
build {
  sources = ["source.virtualbox-iso.ubuntu-base"]

  post-processor "vagrant" {
    keep_input_artifact = true
    provider_override   = "virtualbox"
    output              = "../box/packer_${local.name}.box" # Output directory for Vagrant .box templates
  }
  provisioner "shell" {
    execute_command   = "echo '${var.ssh_password}' | {{ .Vars }} sudo -E -S '{{ .Path }}'"
    expect_disconnect = true
    scripts           = var.shell_scripts
    environment_vars = [
      "HOME_DIR=/home/${var.ssh_username}",
      "BUILD_USERNAME=${var.ssh_username}",
    ]
  }
}