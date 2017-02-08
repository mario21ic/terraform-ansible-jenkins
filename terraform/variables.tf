variable "region" {
    description = "AWS Region"
    default     = "us-west-2"
}

variable "key_name" {
    description = "The AWS Key Pair"
    default     = "yarkan_oregon"
}

variable "ami" {
    type        = "map"
    description = "A map of AMIs"
    default     = {}
}

variable "instance_type" {
    description = "The instance type to launch"
    default     = "t2.micro"
}
