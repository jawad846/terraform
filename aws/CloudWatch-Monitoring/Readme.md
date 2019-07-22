SES Monitoring 

This Terraform Script will create Bounce Rate and Complaint Rate of the SES Service.

If you're creating an alarm to monitor your bounce rate, note that Amazon SES recommends that you maintain a bounce rate under 5%. If the bounce rate for your account is greater than 10%, we might automatically pause your account's ability to send email. 

For this reason, you should configure CloudWatch to raise an alarm when the bounce rate is greater than or equal to 0.05 (5%).

If you're creating an alarm to monitor your complaint rate, note that Amazon SES recommends that you maintain a complaint rate under 0.1%. If the complaint rate for your account is greater than 0.5%, we might automatically pause your account's ability to send email. For this reason, you should configure CloudWatch to raise an alarm when the complaint rate is greater than or equal to 0.001 (0.1%).

Steps:
1. initiate the Terraform
    terraform init
2. Check the is no any error
    terraform plan
3. Deploy the Resources
    terraform apply

    or

    terraform apply --sns_topic "sns_arn" --profile "profile" --region "region"

    or create a var.tfvars file and define the values on there and use

    terraform apply --var-file="vars.tfvars"