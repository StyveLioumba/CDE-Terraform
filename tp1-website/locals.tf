locals {
  owner = "Sli"
  tp    = "terraform-aws-s3"
}

locals {
  default_tags = {
    Owner = local.owner
    TP    = local.tp
  }

  s3_tags = {
    Name = var.bucket_prefix
  }
}