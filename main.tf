resource "null_resource" "copy_execute" {

  connection {
    type        = "ssh"
    host        = var.ipAddress
    user        = var.userName
    password    = var.password
  }

  provisioner "file" {
    source      = "code.sh"
    destination = "~/code.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir ~/.ssh/",
      "chmod +x code.sh",
      "~/code.sh",
    ]
  }

  provisioner "file" {
    source      = "~/.ssh/ServerKey"
    destination = "~/.ssh/ServerKey"
  }

    provisioner "file" {
    source      = "~/.ssh/ServerKey.pub"
    destination = "~/.ssh/authorized_keys"
  }

  
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir /root/.ssh",
      "sudo cp ~/.ssh/authorized_keys /root/.ssh/authorized_keys",
    ]
  }

}
