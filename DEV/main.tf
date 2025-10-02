module "my_vnet" {
    source = "../modules/VNET"
    rsg_name = "rsg66"
    rsg_location = "west-europe"
    vnet_name = "vnet-tfdemo"
    vnet_cidr = "10.0.0.0/16"
    subnet_name = "subnetdemo"
    subnet_cidr = "10.0.1.0/24"

}
#VM Module

module "my-vm" {
    source = "../modules/VM"
    nic_rsg_location=module.my_vnet.rsg_location_out
    nic_rsg_name=module.my_vnet.rsg_name_out
    nic_name="Dev-nic"
    nic_subnet_id=module.my_vnet.subnet_id
    rsg_name = "rsg66"
    rsg_location = "west-europe"
    nic_name = "DEV-nic"
    vm_name = "DEV-VM"
    user_name = "AzureAdmin"
    user_pwd = "AzureAdmin#123"
    vm_enviornment = "Dev Env"

  
}
