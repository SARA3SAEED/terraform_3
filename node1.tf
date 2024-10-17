resource "alicloud_instance" "node1" {
  # cn-beijing
  availability_zone = data.alicloud_zones.zones_ds.zones.0.id
  security_groups   = [alicloud_security_group.SG_node1.id]

  # series III
  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_name           = "sara"
  system_disk_size           = 40
  system_disk_description    = "system_disk_description"
  image_id                   = "ubuntu_22_04_x64_20G_alibase_20240926.vhd"
  instance_name              = "node1"
  vswitch_id                 = alicloud_vswitch.public1.id
  internet_max_bandwidth_out = 100
  internet_charge_type       = "PayByTraffic"
  instance_charge_type      = "PostPaid"
  key_name                   = alicloud_ecs_key_pair.publickey1.key_pair_name
  user_data = base64encode(file("dock.sh"))
}


output "node1_ip" {
  value = alicloud_instance.node1.public_ip
  
}