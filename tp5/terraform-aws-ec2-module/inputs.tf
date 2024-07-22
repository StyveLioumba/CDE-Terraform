variable "server_name" {
  type        = string
  description = "Nom de l'instance."
}

variable "subnet_id" {
  type        = string
  description = "L'identifiant du sous reseau."
}

variable "instance_number" {
  type        = number
  description = "Nombre d'instance à créer"
  default     = 1
}