resource "aws_s3_bucket" "my_bucket" {
  bucket_prefix = var.bucket_prefix

  tags = local.default_tags
}