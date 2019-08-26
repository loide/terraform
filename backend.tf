terraform {
  backend "s3" {
    bucket = "terraform-state-w2e3"
    key = "terraform/demo4"
  }
}
