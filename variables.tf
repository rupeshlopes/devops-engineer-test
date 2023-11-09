# Variables

variable "project_id" {
  description = "the project to deploy the resources"
  type        = string
  default = "integral-genius-266314"
}

variable "name" {
  description = "the name prefix for load balancer resources"
  type        = string
  default = "hw"
}

variable "region" {
  description = "The region of the backend."
  type        = string
  default = "us-central1"
}

variable "cloud_run_service" {
  description = "The name of the Cloud Run service."
  type        = string
  default = "helloworld"
}

variable "domain" {
  description = "The domain name of the load balancer."
  type        = string
  default = "test.io"
}