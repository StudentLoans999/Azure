$config = @{
  "fileUris" = (,"https://storageact345.blob.core.windows.net/script/installIISandHTML.ps1");
  "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File installIISandHTML.ps1"
}
 
$set = Get-AzVmss -ResourceGroupName "demoRG" -VMScaleSetName "demoScaleSet"
$set = Add-AzVmssExtension -VirtualMachineScaleSet $set -Name "customScriptExtScaleSet" -Publisher "Microsoft.Compute" -Type "CustomScriptExtension" -TypeHandlerVersion 1.9 -Setting $config
Update-AzVmss -ResourceGroupName "demoRG" -Name "demoScaleSet" -VirtualMachineScaleSet $set

# 1. Get URL of PowerShell script file
# 2. Get reference to scale set
# 3. Add custom extension to scale set
# 4. Update the scale set
