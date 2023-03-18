server_pool = {
    teste = {
        instance_type   = "t3.small"
        ebs_volume_size   = "200"
        az = "us-west-2a"
        ebs_enabled = true
        root_block_device_volume_size = "10"
        ami_release = "v0.2.2"
    },
}