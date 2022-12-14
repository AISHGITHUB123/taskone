A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these
resources on a cloud environment (Azure/AWS/GCP). Please remember we will not be judged
on the outcome but more focusing on the approach, style and reproducibility.

Procedure to deploy a three-tier architecture on azure using Terraform.
----------------------------------------------------------------------

What is three-tier architecture?
--------------------------------

Three-tier architecture is a well-established software application architecture that organizes applications into three logical and physical computing tiers: the presentation tier, or user interface; the application tier, and the data tier.

What is terraform?
------------------

Terraform is an IAC tool, used primarily by DevOps teams to automate various infrastructure tasks. The provisioning of cloud resources, for instance, is one of the main use cases of Terraform. 
It's a cloud-agnostic, open-source provisioning tool written in the Go language and created by HashiCorp.


Problem Statement
--------------------

    In a resource group, One virtual network tied in three subnets.
    Each subnet will have one virtual machine.
    First virtual machine -> allow inbound traffic from internet only.
    Second virtual machine -> entertain traffic from first virtual machine only and can reply the same virtual machine again.
    App can connect to database and database can connect to app but database cannot connect to web.

please find the architecture diagram below : 

![image](https://user-images.githubusercontent.com/105639937/205553857-302862fd-8b08-405b-acad-fb293172aa05.png)



Note: Keep main and variable files different for each component
Solution
The Terraform resources will consists of following structure

├── main.tf                   // The primary entrypoint for terraform resources.
├── vars.tf                   // It contain the declarations for variables.
├── output.tf                 // It contain the declarations for outputs.
├── terraform.tfvars          // The file to pass the terraform variables values.

Module

A module is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

For the solution, we have created and used five modules:

    resourcegroup - creating resourcegroup
    networking - creating azure virtual network and required subnets
    securitygroup - creating network security group, setting desired security rules and associating them to subnets
    compute - creating availability sets, network interfaces and virtual machines
    database - creating database server and database

All the stacks are placed in the modules folder and the variable are stored under terraform.tfvars

To run the code you need to append the variables in the terraform.tfvars

Each module consists minimum two files: main.tf, vars.tf

resourcegroup and networking modules consists of one extra file named output.tf


Deployment Steps
----------------

Step 0 terraform init

used to initialize a working directory containing Terraform configuration files and required plugins

Step 1 terraform plan

used to create an execution plan for the deployment

Step 2 terraform validate

validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc

Step 3 terraform apply

used to apply the changes required to reach the desired state of the configuration
