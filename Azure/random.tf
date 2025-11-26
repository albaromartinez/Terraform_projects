resource "random_string" "random_name" {
  length           = 8
  special          = true
  upper            = false
  override_special = false
}

