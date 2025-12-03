Task_3-High-Availability-Auto-ScalingTask-

High Availability & Auto Scaling – AWS Architecture Setup
Project Description

This project deploys a highly available application architecture on AWS. An internet-facing Application Load Balancer (ALB) receives incoming traffic and distributes it to EC2 instances running in private subnets. These instances are launched and managed by an Auto Scaling Group (ASG) across multiple Availability Zones to ensure reliability and automatic scaling. The backend servers are not publicly accessible, and a NAT Gateway provides secure outbound access for software updates and dependencies.

Architecture Overview

Application Load Balancer (ALB) for public access.

Auto Scaling Group (ASG) for automatic instance scaling and availability.

Two public subnets hosting the ALB and NAT Gateway.

Two private subnets hosting the EC2 instances.

Target Group connecting the ALB to backend EC2 servers.

Internet Gateway (IGW) for public connectivity.

NAT Gateway for secure outbound access from private instances.

Separate route tables to maintain proper routing and subnet isolation.

Traffic Flow

Client requests reach the ALB in public subnets. The ALB forwards requests to the Target Group, which routes traffic to EC2 instances running in private subnets. This ensures backend workloads are secured and not exposed directly to the internet.

Infrastructure as Code

The entire setup is deployed using Terraform, allowing repeatable deployments, easy changes, and controlled infrastructure management.

GitHub Link: https://github.com/anushika-tech

Cleanup

Once testing and validation are complete, remove all AWS resources to avoid unnecessary costs:

terraform destroy
