resource "aws_ssm_document" "asg_init_windows" {
    name                        = "ASG-SCP-INIT-WINDOWS"
    document_type               = "Command"

    content = <<DOC
{
   "schemaVersion":"2.2",
   "description":"Run a PowerShell script to list Windows instance details",
   "mainSteps":[
      {
         "action": "aws:runPowerShellScript",
         "name": "CertificateInstall",
         "inputs": {
            "runCommand": [
            "aws s3 cp '${var.certificate_path}' C:\\certificates\\ --region eu-west-1\n",
            "$testLocalCertPath = 'c:\\certificates\\schools-test.pfx'\n",
            "$certPass = (Get-SSMParameterValue -Name /certificate/password -WithDecryption $True).Parameters[0].Value | ConvertTo-SecureString -AsPlainText -Force\n",
            "$testLocalPass = $certPass\n",
            "Get-ChildItem Cert:\\LocalMachine\\My\\9CB3D847B5B2481757C63C376EF35FAF0E1F59EF -ErrorAction SilentlyContinue\n",
            "if ($?) {Get-ChildItem Cert:\\LocalMachine\\My\\9CB3D847B5B2481757C63C376EF35FAF0E1F59EF | Remove-Item}\n",
            "$pfxtestLocal = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2\n",
            "$pfxtestLocal.Import($testLocalCertPath,$testLocalPass,\"testrtable,PersistKeySet,MachineKeySet\")\n",
            "$store = New-Object System.Security.Cryptography.X509Certificates.X509Store(\"My\",\"LocalMachine\")\n",
            "$store.Open(\"ReadWrite\")\n",
            "$store.Add($pfxtestLocal)\n",
            "$store.Close()\n",
            "$certThumbprint = $pfxtestLocal.Thumbprint\n",
            "Write-Output \"The test 2020 Local Certificate is installed\"\n",
            "Write-Output '$certThumbprint'\n",
            "Remove-Item 'C:\\certificates' -Recurse\n"
            ]
         }
      },
      {
         "action":"aws:runPowerShellScript",
         "name":"HostnameandDomainJoin",
         "inputs":{
            "runCommand":[
               "$currenthostname = hostname\n",
               "$instanceId = ((Invoke-WebRequest -Uri http://169.254.169.254/latest/meta-data/instance-id -UseBasicParsing).Content)\n",
               "$seq_num = Get-Random -Maximum 99\n",
               "$region = 'eu-west-1'\n",
               "$newhostname = (aws ec2 describe-instances --instance-id $instanceId --region $region --query 'Reservations[0].Instances[0].Tags[?Key==`NAME`].Value' --output text)\n",
               "echo $newhostname$seq_num\n",
               "$domain = (Get-SSMParameterValue -Name /domain/name).Parameters[0].Value\n",
               "$username = (Get-SSMParameterValue -Name /domain/username).Parameters[0].Value\n",
               "$domain_username = \"$domain\\$username\"\n",
               "$password = (Get-SSMParameterValue -Name /domain/password -WithDecryption $True).Parameters[0].Value | ConvertTo-SecureString -AsPlainText -Force\n",
               "$credential = New-Object System.Management.Automation.PSCredential($domain_username,$password)\n",
               "Add-Computer -DomainName $domain -ComputerName \"$currenthostname\" -NewName \"$newhostname$seq_num\" -Credential $credential\n",
               "Restart-Computer -Force\n"           
               ]
            }
         }
      ]
   }
DOC
}



resource "aws_ssm_document" "init_windows" {
    name                        = "INITIALIZATION-WINDOWS"
    document_type               = "Command"

    content = <<DOC
{
   "schemaVersion":"2.2",
   "description":"Run a PowerShell script to list Windows instance details",
   "mainSteps":[
      {
         "action":"aws:runPowerShellScript",
         "name":"runPowerShellWithSecureString",
         "inputs":{
            "runCommand":[
               "$currenthostname = hostname\n",
               "$instanceId = ((Invoke-WebRequest -Uri http://169.254.169.254/latest/meta-data/instance-id -UseBasicParsing).Content)\n",
               "$region = 'eu-west-1'\n",
               "$newhostname = (aws ec2 describe-instances --instance-id $instanceId --region $region --query 'Reservations[0].Instances[0].Tags[?Key==`NAME`].Value' --output text)\n",
               "$domain = (Get-SSMParameterValue -Name /domain/name).Parameters[0].Value\n",
               "$username = (Get-SSMParameterValue -Name /domain/username).Parameters[0].Value\n",
               "$domain_username = \"$domain\\$username\"\n",
               "$password = (Get-SSMParameterValue -Name /domain/password -WithDecryption $True).Parameters[0].Value | ConvertTo-SecureString -AsPlainText -Force\n",
               "$credential = New-Object System.Management.Automation.PSCredential($domain_username,$password)\n",
               "Add-Computer -DomainName $domain -ComputerName \"$currenthostname\" -NewName \"$newhostname\" -Credential $credential\n",
               "Restart-Computer -Force\n"           
]        
}     
}
]
}
DOC
}


resource "aws_ssm_document" "domain_join_windows" {
    name                        = "DOMAIN-JOIN-WINDOWS"
    document_type               = "Command"

    content = <<DOC
{
   "schemaVersion":"2.2",
   "description":"Run a PowerShell script to list Windows instance details",
   "mainSteps":[
      {
         "action":"aws:runPowerShellScript",
         "name":"runPowerShellWithSecureString",
         "inputs":{
            "runCommand":[
               "$domain = (Get-SSMParameterValue -Name /domain/name).Parameters[0].Value\n",
               "$username = (Get-SSMParameterValue -Name /domain/username).Parameters[0].Value\n",
               "$domain_username = \"$domain\\$username\"\n",
               "$password = (Get-SSMParameterValue -Name /domain/password -WithDecryption $True).Parameters[0].Value | ConvertTo-SecureString -AsPlainText -Force\n",
               "$credential = New-Object System.Management.Automation.PSCredential($domain_username,$password)\n",
               "Add-Computer -DomainName $domain -Credential $credential\n",
               "Restart-Computer -Force\n"           
]        
}     
}
]
}
DOC
}


resource "aws_ssm_document" "windows_unjoin_domain" {
  name          = "DOMAIN_UNJOIN_WINDOWS"
  document_type = "Command"

  content = <<DOC
  {
      "schemaVersion":"2.0",
      "description":"Run a PowerShell script to unjoin a Windows instance from the domain",
      "mainSteps":[
         {
            "action":"aws:runPowerShellScript",
            "name":"runPowerShellWithSecureString",
            "inputs":{
               "runCommand":[
                  "$domain = (Get-SSMParameterValue -Name /domain/name).Parameters[0].Value\n",
                  "$username = (Get-SSMParameterValue -Name /domain/username).Parameters[0].Value\n",
                  "$domain_username = \"$domain\\$username\"\n",
                  "$password = (Get-SSMParameterValue -Name /domain/password -WithDecryption $True).Parameters[0].Value | ConvertTo-SecureString -AsPlainText -Force\n",
                  "$credential = New-Object System.Management.Automation.PSCredential($domain_username,$password)\n",
                  "Remove-Computer -UnjoinDomaincredential $credential -WorkgroupName \"WORKGROUP\" -Force -PassThru -Verbose -Restart"
               ]
            }
         }
      ]
   }
DOC
}
