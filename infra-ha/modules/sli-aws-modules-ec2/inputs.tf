variable "server_name" {
  type        = string
  description = "Nom de l'instance."
}

variable "subnets" {
  type = map(string)
  description = "L'identifiant du sous reseau."
}