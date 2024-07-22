output "bucket_id" {
  value       = aws_s3_bucket.my_bucket.id
  description = "ID du bucket"
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.my_bucket.bucket_domain_name
  description = "Nom de domaine du bucket"
}