variable "namespace" {
}
variable "environment" {
}
variable "region" {
}

variable "create_peering" {
  default = true
}

variable "primary_vpc_name" {
}

variable "utility_vpc_name" {
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
