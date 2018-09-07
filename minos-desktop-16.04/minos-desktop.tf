resource "digitalocean_droplet" "minos-desktop" {
    count    = "1"
    name     = "${format("minos-desktop-%02d", count.index)}"
    region   = "sfo2"
    image    = "ubuntu-16-04-x64"
    size     = "s-1vcpu-1gb"
    private_networking = true

    ssh_keys = ["${digitalocean_ssh_key.minos-key.id}"]

    connection {
        user        = "root"
        type        = "ssh"
        private_key = "${file(var.private_key)}"
        timeout     = "2m"
    }

    provisioner "remote-exec" {
        script = "provision/01-disable-unattended-upgrades.sh"
    }

    provisioner "remote-exec" {
        script = "provision/01-add-admin-user.sh"
    }

    provisioner "remote-exec" {
        script = "provision/01-install-ansible-deps.sh"
    }

    provisioner "remote-exec" {
        script = "provision/02-install-minos-desktop.sh"
    }
}

output "minos-desktop-output" {
  value = "${digitalocean_droplet.minos-desktop.*.ipv4_address}"
}
