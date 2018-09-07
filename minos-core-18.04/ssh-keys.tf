resource "digitalocean_ssh_key" "minos-key" {
  name       = "Minos SSH Key"
  public_key = "${file(var.public_key)}"
}
