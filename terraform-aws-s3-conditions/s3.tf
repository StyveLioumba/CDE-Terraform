resource "aws_s3_bucket" "my_bucket" {
  bucket_prefix = var.environment == "dev" ? "dev-": "prod-"
}