module "vpc" {
  source = "./modules/sli-aws-modules-vpc-ha"
  vpc_cidr = local.vpc_cdir
  public_subnets_cdir = local.public_subnets_cidr
  private_subnets_cdir =local.private_subnets_cidr
}