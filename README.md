# tf-modulep-vpc

This repository contains the needed aws vpc components and this is the backend module for the root module from the repo `roboshop-terraform`

> Steps to proision VPC and enable vpc peering to default vpc
1) Provision VPC

2) Provision Public & Private subnets under the provisioned vpc
3) VM's provisioned on public subnet should have public & private ip addresses & vm's provisioned on private subnet should have private ip address only. 
4) Provision an IGW and attach that to the VPC. ( You can attach one igw to a single vpc ) and this enables the connectivity from Internet to VPC.
5) Create a routeTable adn attach that routeTable for the public subnet respectively
6) Now add the route as 0.0.0.0/0 as IGW 
7) We should be able to SSH to this public server from the internet.
8) Launch an instance in the private subnet and this won't be having public IP address, that means you cannot access this from the internet.
9) How to access this at this point of time ? You can access this from the public-instance. SSH to the public-server from the internet and from there to the private server. 

10) How can we enable private cummunication from workStation node ( 172.16.0.0/16 ) to the test-vpc network ( 192.16.0.0/24 ) ?
    > let's do the peering between default-vpc to test-vpc ( As both of them are in the same vpc and in same region, we can do this by our self.)

11) Once peering has been enabled, we need to update the routeTables on both the sides, stating if the source is this, use the peering as the route

    > Now if you notice, servers that has public ip has access to the internet. But private servers or the servers in the private subnet which don't have the public ip are not accessible from the internet and the server themselves cannot connect to the internet. 

> If you don't have access to the internet, how can we donwload packages, how can do the patching of the instances ?

12) We need ensure, that servers without private ip are not accessible from the internet. But, if the server want to talk to internet, we need to let them do that.

Scope :
    1) The scope of security group, routeTable of a vpc are specific to a vpc only
    2) If you create security groups or route-table on vpc-x, you can only use them in vpc-x resource only.

