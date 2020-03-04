### Define Deployment Variables
{
$location = 'Australia Southeast'
$resourceGroupName = 'contoso-storage-iaas-template'
$resourceDeploymentName = 'contoso-storage-iaas-template-deployment'
#$templatePath = $env:SystemDrive + '\' + 'pluralsight'
$templatePath = 'D:\Github\Alok-01\ArmTemplateExample\ARMExamples'
$templateFile = 'storageVnetDeploy.json'
$template = $templatePath + '\' + $templateFile
}

### Create Resource Group
{
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $location `
    -Verbose -Force
}

### Deploy Resources
{
New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -Verbose -Force
}