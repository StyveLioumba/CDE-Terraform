module "ec2" {
  source = "./modules/sli-aws-modules-ec2"
  subnets= module.vpc.public_subnets
  server_name = local.tags["Name"]
}