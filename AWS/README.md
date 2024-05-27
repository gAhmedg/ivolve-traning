## Lab 19: AWS Security

### Objective:
This lab focuses on setting up a secure AWS environment by creating user groups, managing user permissions, and ensuring proper access control. The main tasks include:

1. Creating an AWS account.
2. Creating two IAM groups (admin and developer).
3. Configuring user access as per the specified requirements
4. Listing all users and groups using AWS CLI commands.
5. Taking screenshots to document EC2 and S3 access.


---
### 1. Create IAM Groups
    1-Open the IAM console and click on User groups in the left-hand navigation pane.
    2-Create group and enter the group name admin.
    3-Attach the AdministratorAccess policy to this group.
    4-Click Create group again and enter the group name developer.
    5-Attach a policy that provides S3 access only (AmazonS3FullAccess).
![alt text](screenshot/lab19-groups.png)

### 2. Create IAM Users and Assign Permissions
Click Add user and create the following users with specified access 
    1. admin1
        Select AWS Management Console access only.
        Enable Require MFA.
        Assign this user to the admin group.
    2. admin2 
        Select Programmatic access only.
        Assign this user to the admin group.  

![alt text](screenshot/lab19-admingroup.png)

    3. dev-user
        Select both AWS Management Console access and Programmatic access.
        Assign this user to the developer group.
![alt text](screenshot/lab19-developergroup.png)

### 3. Verify IAM Users 
    1. admin1 with MFA

![alt text](screenshot/lab19-admin1-login.png)

---

![alt text](screenshot/lab19-mfa.png)

---
    2. admin2 List All Groups Using CLI Commands
    
```bash
    aws iam list-groups
```

![alt text](screenshot/lab19-admin2-cli.png)

    3. dev-user Verify Access for s3 and ec2 

using cli 
 show the account id and user , show all ec2 and  show all s3
```bash
aws sts get-caller-identity --query '{Account: Account, Arn: Arn}' --output text
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,Tags[?Key==`Name`].Value|[0]]' --output table
ws s3api list-buckets --query 'Buckets[*].Name' --output table
```
![alt text](screenshot/lab19-dev-user-cli-s3-ec2.png)



---


## Lab 20: Launching an EC2 Instance

### Objective

Create a private subnet and launch an EC2 instance. Configure security groups and connect to the instance using a bastion host.

***
### Steps to Complete the Lab

#### 1. Set Up the VPC and Subnet
    1. Create a VPC:

        Go to the AWS Management Console.
        Navigate to the VPC dashboard.
        Click on "Create VPC".
        create Private Subnet
        Provide a name and CIDR block 

    2. Create Subnets:

    In the VPC dashboard, click on "Subnets".
    Click on "Create subnet".
    Select your VPC and provide a subnet name (e.g., Private Subnet).

#### 2. Launch the EC2 Instance
    Launch an Instance:
       
        Choose an Amazon Machine Image (AMI)and Select an instance type.
        Select the VPC and the private subnet created earlier.
        Ensure "Auto-assign Public IP" is disabled (for Private ec2).
        Ensure "Auto-assign Public IP" is enable (for Bastion-server ec2).
        Configure a security group to allow traffic (e.g., SSH from the bastion host and the same for Private ).
***
![Alt text](screenshot/lab20-instances.png)
***
#### 3. Configure the Security Groups
Create a Security Group for the EC2 Instance:

    another security group (BastionHostSG).
    Add an inbound rule to allow SSH from your IP (or a range of IPs). allow prot 22 for ssh.
***
![Alt text](screenshot/lab20-security.png)
***
#### 4. Connect to the Instances
1. Connect to the Bastion Host:
    ```bash
        scp -i "host1.pem" host1.pem ubuntu@ec2-52-87-170-249.compute-1.amazonaws.com:/home/ubuntu/
        ssh -i host1.pem ec2-user@bastion-host-public-ip
    ```
using scp for key to using the key 
2. Connect to the Private Instance via the Bastion Host:
    ```bash
    ssh -i path/to/key.pem ec2-user@private-instance-private-ip
        ```

***
Bastion-ssh

![Alt text](screenshot/Bastion-ssh.png)
***
private-ssh.png

![Alt text](screenshot/private-ssh.png)
***