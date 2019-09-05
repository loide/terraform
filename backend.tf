terraform {
  backend "s3" {
    bucket = "terraform-state-q1w2"
    key = "terraform/demo4"
  }
}
