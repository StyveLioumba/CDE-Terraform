locals {
  route_to_internet = "0.0.0.0/0"
  date              = formatdate("DD-MM-YYYY", time_static.creation.rfc3339)
  user              = "Sli"
  subnet_count      = 3

  tags = {
    Name  = local.user
    Owner = local.user
    TP    = basename(abspath(path.root))
  }
}

locals {
  vpc_cdir          = "10.1.0.0/16"
  subnets = cidrsubnets(local.vpc_cdir,8,8)
  private_subnets_cidr = [
    "10.1.1.0/24",
    "10.1.3.0/24"

  ]
  public_subnets_cidr = [
    "10.1.0.0/24",
    "10.1.2.0/24"
  ]


}