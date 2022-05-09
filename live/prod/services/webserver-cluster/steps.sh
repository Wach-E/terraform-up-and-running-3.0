The final snapshot is disabled, as this code is just
for learning and testing (if you don’t disable the snapshot,
nor provide a name for the snapshot via the final_snapshot_identifier parameter, destroy will fail).

For the db_username and db_password input variables, here is how you can set the TF_VAR_db_username and TF_VAR_db_password environment variables on Linux/Unix/macOS systems:

$ export TF_VAR_db_username="(YOUR_DB_USERNAME)"
$ export TF_VAR_db_password="(YOUR_DB_PASSWORD)"

And here is how you do it on Windows systems:

$ set TF_VAR_db_username="(YOUR_DB_USERNAME)"
$ set TF_VAR_db_password="(YOUR_DB_PASSWORD)"

# Powershell
$env:TF_VAR_db_username='(YOUR_DB_USERNAME)'
$env:TF_VAR_db_password='(YOUR_DB_PASSWORD)'

If by chance Ctrl+C goes wrong use the command below to solve it:
```terraform force-unlock ID_of_lock_error```

Migrate backend from remote(s3) to local
```terraform init -migrate-state```