
# Create Security Group
resource "alicloud_security_group" "SG_node1" {
  name        = "SG_node1"
  description = "SG node1 Allwo"
  vpc_id      = alicloud_vpc.vpc1.id
}



# # Add Security Group Rules
resource "alicloud_security_group_rule" "ssh" {
  security_group_id = alicloud_security_group.SG_node1.id
  ip_protocol       = "tcp"
  port_range        = "22/22"
  cidr_ip           = "0.0.0.0/0"
  policy            = "accept"
  priority          = 1
  type              = "ingress"  
}



# # Add Security Group Rules
resource "alicloud_security_group_rule" "http" {
  security_group_id = alicloud_security_group.SG_node1.id
  ip_protocol       = "tcp"
  port_range        = "80/80"  
  cidr_ip           = "0.0.0.0/0"  
  policy            = "accept"
  priority          = 1
  type              = "ingress"  
}

