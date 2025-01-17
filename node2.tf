
# Create a new private instance for VPC
resource "alicloud_instance" "node2" {
  # cn-beijing
  availability_zone = data.alicloud_zones.zones_ds.zones.0.id
  security_groups   = [alicloud_security_group.SG_node2.id]

  # series III
  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_name           = "sara"
  system_disk_size           = 40
  system_disk_description    = "system_disk_description"
  image_id                   = "ubuntu_22_04_x64_20G_alibase_20240926.vhd"
  instance_name              = "node2"
  vswitch_id                 = alicloud_vswitch.private1.id
  internet_max_bandwidth_out = 0
  internet_charge_type       = "PayByTraffic"
  instance_charge_type       = "PostPaid"
  key_name                   = alicloud_ecs_key_pair.publickey1.key_pair_name
  user_data = base64encode(file("dock.sh"))
}

output "node2_ip" {
  value = alicloud_instance.node2.private_ip
  
}





