resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.my_bucket.id
  key          = "error.html"
  source       = "./files/error.html"
  etag         = filemd5("./files/error.html")
  content_type = "text/html"
}