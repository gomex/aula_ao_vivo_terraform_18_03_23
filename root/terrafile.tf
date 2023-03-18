module "test_servers" {
  source = "../modulo"

  for_each = var.server_pool

  hostname                 = each.key
  instance_type            = each.value.instance_type
  ebs_volume_size          = each.value.ebs_volume_size
  az                       = each.value.az
  ebs_enabled              = each.value.ebs_enabled
  root_block_device_volume_size   = each.value.root_block_device_volume_size
  ami_release              = each.value.ami_release
}