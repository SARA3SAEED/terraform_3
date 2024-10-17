
resource "alicloud_security_group" "SG_node2" {
  name        = "SG_node2"
  description = "SG node2 Allwo"
  vpc_id      = alicloud_vpc.vpc1.id
}


# resource "alicloud_security_group_rule" "allow_all_sshRDS" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "22/22"
#   priority          = 1
#   security_group_id = alicloud_security_group.SG_node2.id
#   source_security_group_id = alicloud_security_group.SG_node1.id
# }

# resource "alicloud_security_group_rule" "allow_all_redis" {
#   type              = "ingress"
#   ip_protocol       = "tcp"
#   policy            = "accept"
#   port_range        = "6379/6379"
#   priority          = 1
#   security_group_id = alicloud_security_group.SG_node2.id
#   source_security_group_id = alicloud_security_group.SG_node1.id
# }