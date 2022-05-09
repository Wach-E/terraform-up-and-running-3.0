1. Create a special file for the repeatable backend config
touch backend.hcl
2. Populate the backend.hcl with the attributes that will be repeated in the terraform backend
```
# Replace this with your bucket name!
bucket = "terraform-up-and-running-state-14-04-2022"
region = "us-west-2"
# Replace this with your DynamoDB table name!
dynamodb_table = "terraform-up-and-running-locks-14-04-2022"
encrypt        = true
```
3. Run the terraform init with the backend config file
```terraform init --backend-config=backend.hcl```

4. Destroy s3 buckets with contents
- add ```force_destroy = true``` to aws_s3_bucket resource
- apply changes with ```terraform apply```
- destroy bucket with ```terraform destroy```

Migrate backend from remote(s3) to local
```terraform init -migrate-state```