# Lab 24: Multi-Tier Application Deployment with Terraform

## Objective
The objective of this lab is to use Terraform to define and deploy a multi-tier architecture in AWS. This includes creating a VPC, public and private subnets, EC2 instances in the public subnet, and an RDS database in the private subnets.

## Architecture Overview
![alt text](<screenshots/Untitled Diagram.drawio.svg>)

### The architecture deployed in this lab includes:
- A VPC with a public and private subnet in each of two availability zones.
- An Internet Gateway attached to the VPC.
- A public route table associated with the public subnets.
- Security groups for EC2 instances and RDS instances.
- An EC2 instance in the public subnet.
- Two RDS MySQL database instances in the private subnets, each in a different availability zone.

## Prerequisites
- AWS Account with necessary permissions to create resources.
- AWS CLI configured with appropriate credentials.
- Terraform installed on your local machine.
- Basic understanding of Terraform and AWS services.


## Files in This Repository
variables.tf: File to define variables used in the Terraform configuration.
vpc.tf: File to define VPC and subnets.
ec2.tf: File to define EC2 instances and  define security groups.
rds.tf: File to define RDS instances.

## Steps to Deploy

### Clone the Repository

```bash
Copy code
git clone https://github.com/gAhmedg/ivolve-traning.git
cd ivolve-traning/terraform/lab24
```
### Initialize Terraform

```bash
Copy code
terraform init
```

### Review the Plan

```bash
Copy code
terraform plan
```
![terraform plan](screenshots/1.png)

### Apply the Configuration

```bash
Copy code
terraform apply
```
![terraform apply](screenshots/2.png)

### Confirm the apply action when prompted.

## Verify the Deployment
After the apply process completes, you can verify the resources in the AWS Management Console.
 the instances created  in console
![instance](screenshots/instance.png)
***
RDS Instances: Launches two RDS MySQL database instances, each in a different availability zone, using the defined subnet group.

![RDS](screenshots/RDS.png)
***
## Cleanup
To destroy the resources created by this Terraform configuration, run:

```bash
Copy code
terraform destroy
```
Confirm the destroy action when prompted.

