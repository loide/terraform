# terraform
Deploy AWS instances using terraform

## Requirements
* an aws account
* an S3 bucket to store remote state called terraform-state-q1w2

## Using

First, create the file *terraform.tfvars* to store your AWS credentials:
```
$ terraform
$ echo -e "AWS_ACCESS_KEY = "" \nAWS_SECRET_KEY = """ > terraform.tfvars
```
Open *terraform.tfvars*, add your aws credentials and save.

Now, your are ready to deploy:
```
$ terraform plan

$ terraform apply
```
