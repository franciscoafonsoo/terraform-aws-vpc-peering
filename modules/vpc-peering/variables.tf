variable "namespace" {
}
variable "environment" {
}
variable "region" {
}

variable "create" {
  default = true
}

variable "suffix_sg" {
  default = "eks-eks_worker_sg"
}

variable "suffix_route_public" {
  default = "vpc-public"
}

variable "suffix_route_private" {
  default = "vpc-private"
}

variable "primary_vpc_name" {
}

variable "utility_vpc_name" {
}

variable "primary_route_public_name" {
}

variable "primary_route_private_name" {
}

variable "utility_route_public_name" {
}

variable "utility_route_private_name" {
}

variable "primary_sg_name" {
}

variable "utility_sg_name" {
}
