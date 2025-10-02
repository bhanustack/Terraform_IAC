variable "rsg_name" {}
variable "rsg_location" {}
variable "vnet_name" {}
variable "vnet_cidr"{ 
    default = "10.0.0.0/16"
}
variable "subnet_name"{}
variable "subnet_cidr" {
    default = "10.0.1.0/24"
}