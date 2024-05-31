provider "aws" {
          region = var.region
          profile = "default"
}



module "ec2" {

    source                 =   "./modules/instance"
    vpcid                  =   module.vpc.vpc_id
    subnetpublicid         =   module.vpc.subnet_public_id
    #output# module.ec2.security_group_ec2_sg_id

}

module "vpc" {

    source                  =   "./modules/vpc"
    vpc_cidr                =   var.region
    public_subnet_cidr      =  var.public_cidr 
    private_subnet_cidr     = var.private_cidr 
    #output# module.vpc.subnet_private_id
    #output# module.vpc.subnet_private2_id
    #output# module.vpc.subnet_public_id

}


module "rds" {

    source                  =   "./modules/RDS"
    allocated_storage       =   20
    engine      =  var.engine
    instance_class = var.instance_class
    db_name     = var.db_name
    username    =   var.username
    password    = var.password
    subnet_ids  = [module.vpc.subnet_private_id,module.vpc.subnet_private_id]
}