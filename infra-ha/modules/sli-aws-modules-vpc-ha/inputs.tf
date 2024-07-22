variable "private_subnets_cdir" {
  type        = list(string)
  description = "List des CDIR des sous-reseaux"
}

variable "public_subnets_cdir" {
  type        = list(string)
  description = "List des CDIR des sous-reseaux"
}

variable "vpc_cidr" {
  type        = string
  description = "CDIR du VPC"
}
