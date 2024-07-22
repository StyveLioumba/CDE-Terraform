locals {
  route_to_internet = "0.0.0.0/0"
  vpc_cdir          = "10.1.0.0/16"
  date              = formatdate("DD-MM-YYYY", time_static.creation.rfc3339)
  user              = "Sli"
  subnet_count      = 3

  tags = {
    Owner = local.user
    TP    = basename(abspath(path.root))
  }
}