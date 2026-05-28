variable "docker_image" {
  description = "Docker image for the todo app"
  type        = string
  default     = "sheriff70/todo-app:1.0"
}

variable "namespace" {
  default = "todo-app"
}