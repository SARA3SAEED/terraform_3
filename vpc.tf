# ----------------create VPC ------------------

# Create a Virtual Private Cloud (VPC) with the specified CIDR block.
resource "alicloud_vpc" "vpc1" {
  vpc_name   = "flare1"
  cidr_block = "172.18.0.0/16"
}


# ----------------create Zone ------------------

data "alicloud_zones" "zones_ds" {
  available_resource_creation = "VSwitch"
}
