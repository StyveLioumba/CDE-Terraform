locals {
  date              = formatdate("DD-MM-YYYY", time_static.creation.rfc3339)
  user              = "Sli"

  tags = {
    Name  = "${local.user}-${local.date}"
    Owner = local.user
    TP    = basename(abspath(path.root))
  }
}