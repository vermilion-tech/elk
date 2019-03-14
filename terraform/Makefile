init:
	terraform init

validate:
	terraform validate

plan:
	terraform plan -out terraform.plan

apply:
	terraform apply terraform.plan

destroy:
	terraform destroy

deploy:
	make init
	make validate
	make plan
	make apply
