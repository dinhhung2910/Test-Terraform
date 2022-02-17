# PoC Automation Terraform with GitOps tool

Terraform code includes:

* 1 VPC

* 2 subnets: 1 private subnet, 1 public subnet

* 1 internet gateway

* 1 NACL

* 1 security group: 

    * inbound rule: port ssh 22 from svmc jumphost

    * outbound rule: port 443 access internet

* 1 ec2: t2.micro