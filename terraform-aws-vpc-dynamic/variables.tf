variable "region" {
  type        = string
  description = "La region"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "profile de connexion"
  default     = "default"
  type        = string
}

variable "subnets_name" {
  type        = list(string)
  description = "liste de nom de sous reseau"
  default     = ["a", "b"]
}