locals {
  route_to_internet = "0.0.0.0/0"
  vpc_cdir          = "10.1.0.0/16"
  date              = formatdate("DD-MM-YYYY", time_static.creation.rfc3339)
  user              = "Sli"
  subnets = {
    "10.1.0.0/24" = "us-east-1a",
    "10.1.1.0/24" = "us-east-1b",
    "10.1.2.0/24" = "us-east-1c"
  }

  tags = {
    Owner = local.user
    TP    = basename(abspath(path.root))
  }
}