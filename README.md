# Terraform-AWS-Jenkins mini-project
![My image](./terraform.png)

## Using Jenkins to Deploy nodeJS app on EC2 instance and using terraform to build the infrastructure on AWS.

### Project has 2 environments :
- ### dev => which in US-EAST-1 Region
- ### prod => which in EU-Central-1 Region

### You need to authenticate your aws account to attach it with terraform by:
- use this command:
```
vim ~/.aws/credentials
```
- Add your account's (Access Key ID) and (Secret Key ID) to the file for example:
```
[default]
aws_access_key_id = <YOUR ACCESS KEY ID>
aws_secret_access_key = <YOUR SECRET KEY ID>

``` 
- now you are authenticated to your AWS account.

### To run the development environment type:
```bash
terraform destroy --var-file dev.tfvars 
```

### To run the production environment type:
```bash
terraform destroy --var-file prod.tfvars 
```