resource "null_resource" "example" {
  for_each = var.teams
  provisioner "local-exec" {
    command = "echo ${each.key}"
  }
}
