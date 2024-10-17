# ----------------create VSwitches ------------------

# Create a public VSwitch in the specified zone within the VPC.
resource "alicloud_vswitch" "public1" {
  vpc_id     = alicloud_vpc.vpc1.id
  cidr_block = "172.18.3.0/24"  
  zone_id    = data.alicloud_zones.zones_ds.zones.0.id
}


# Create a private VSwitch in the same zone within the VPC.
resource "alicloud_vswitch" "private1" {
  vpc_id     = alicloud_vpc.vpc1.id
   cidr_block = "172.18.4.0/24" 
  zone_id    = data.alicloud_zones.zones_ds.zones.0.id
}