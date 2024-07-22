output "basename" {
  value       = basename(abspath(path.root))
  description = "chemin absolu"
}