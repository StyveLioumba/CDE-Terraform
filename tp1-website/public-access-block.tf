# permet d'activer l'acces public du sitre web s3
resource "aws_s3_bucket_public_access_block" "mon_bucket" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}