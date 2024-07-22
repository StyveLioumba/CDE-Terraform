resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.my_bucket.id
  key          = "index.html"
  source       = "./files/index.html"
  etag         = filemd5("./files/index.html")
  content_type = "text/html"
}