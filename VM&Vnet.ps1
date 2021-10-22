New-AZResourceGroup -Name newRG -Location "East US"
$demosubnetConfig = New-AzVirtualNetworkSubnetConfig -Name default -AddressPrefix 10.3.0.0/24
$vnet = New-AzVirtualNetwork -ResourceGroupName newRG -Location EastUS -Name newVnet -AddressPrefix 10.3.0.0/16 -Subnet $demosubnetConfig
$demoip = New-AzPublicIpAddress -ResourceGroupName newRG -Location EastUS -Name "newIP" -AllocationMethod Dynamic
$RuleConfig = New-AzNetworkSecurityRuleConfig -Name RuleRDP -Protocol Tcp -Direction Inbound -Priority 300 -SourceAddressPrefix "2.49.112.48" -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389 -Access Allow
$securitygroup = New-AzNetworkSecurityGroup -ResourceGroupName newRG -Location EastUS -Name newNSG -SecurityRules $RuleConfig
$nic = New-AzNetworkInterface -Name newNIC890 -ResourceGroupName newRG -Location EastUS -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $demoip.Id -NetworkSecurityGroupId $securitygroup.Id
$cred = Get-Credential
$vmConfig = New-AzVMConfig -VMName newVM -VMSize Standard_D2s_v3 | Set-AzVMOperatingSystem -Windows -ComputerName newVM -Credential $cred | Set-AzVMSourceImage -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Skus 2016-Datacenter -Version latest | Add-AzVMNetworkInterface -Id $nic.Id
New-AzVM -ResourceGroupName newRG -Location EastUS -VM $vmConfig

# 0. Create a RG
# 1. Create a subnet configuration
# 2. Create a Vnet
# 3. Create a Public IP address
# 4. Create a NSG rule
# 5. Create a NSG
# 6. Create a NIC
# 7. Prompt for the Account credentials for the VM
# 8. Create the VM config
# 9. Create the VM
# 10. Use this file as reference to create a Vnet and VM in PS
