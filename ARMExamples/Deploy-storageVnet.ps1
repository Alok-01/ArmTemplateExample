### Define Deployment Variables
{
$location = 'Australia Southeast'
$resourceGroupName = 'triangle-storage-iaas-template'
$resourceDeploymentName = 'triangle-storage-iaas-template-deployment'
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

### Define Deployment Variables
{
$location = 'Australia Southeast'
$resourceGroupName = 'triangle-iaas'
$resourceDeploymentName = 'triangle-iaas-deployment'
#$templatePath = $env:SystemDrive + '\' + 'pluralsight'
#$templateFile = 'triangleIaas.json'
$templatePath = 'D:\Github\Alok-01\ArmTemplateExample\ARMExamples'
$templateFile = 'storageVnetDeploy.json'
$template = $templatePath + '\' + $templateFile
$password = "abc@123"
$securePassword = $password | ConvertTo-SecureString -AsPlainText -Force
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

$additionalParameters = New-Object -TypeName Hashtable
$additionalParameters['vmAdminPassword'] = $securePassword

New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    @additionalParameters `
    -Verbose -Force
}
