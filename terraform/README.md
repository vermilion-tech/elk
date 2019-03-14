# Terraform - ELK
https://www.terraform.io/docs/configuration-0-11/index.html

### Export DigitalOcean API Token
`$ export TF_VAR_do_token=****************`

### Deploy
`$ terraform init`
`$ terraform validate`
`$ terraform plan -out terraform.plan`
`$ terraform apply terraform.plan`
or
`$ make deploy`

### Destroy
`$ terraform destroy`
or
`$ make destroy`
