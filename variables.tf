//  The region we will deploy our resources into.
variable "region" {
  description = "Region to deploy the cluster into"
  default     = "ap-northeast-1"
}

variable "common_tags" {
  description = "Common tags to be added on all resources"
}

variable "component" {
  description = "Component name for eg devops"
  default     = "devops"
}

variable "stack" {
  description = "Sub component for eg: jenkins, keycloak"
  default     = "core"
}

variable "stage" {
  description = "stage "
  default     = "dev"
}

variable "name" {
  description = "Security group name"
}

variable "description" {
  description = "Security group description"
}

variable "vpc_id" {
  description = "VPC id in which the security group has to be created"
}

variable "ip_list" {
  description = "ip list"
  default = ["103.81.106.248/30",
    "210.94.41.88/30",
  ]
}

variable "sg_rules" {
  description = "List of security group rules"
  default = [
    { "description" = "Allow http traffic", "type" = "ingress", "from_port" = "80", "to_port" = "80", "protocol" = "tcp" },
    { "description" = "Allow https traffic", "type" = "ingress", "from_port" = "443", "to_port" = "443", "protocol" = "tcp" },
  ]
}
