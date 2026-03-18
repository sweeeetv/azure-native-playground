variable "app_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "container_app_environment_id" { type = string }
variable "image_name" { type = string } # e.g., "myacr.azurecr.io/app:v1"
variable "user_assigned_identity_id" { type = string }
variable "target_port" { 
  type    = number
  default = 3000 
}