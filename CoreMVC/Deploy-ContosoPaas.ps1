### Connect or Login to Azure
{Add-AzureRmAccount}

### Define Deployment Variables
{
$resourceGroupLocation = 'Australia Southeast'
$resourceGroupName = 'contoso-paas'
$resourceDeploymentName = 'contoso-paas-deployment'
###$templatePath = $env:SystemDrive + '\' + 'pluralsight'
$templatePath = 'D:\armtemplate\'##+ '\armtemplate'
###$templateFile = 'contosoPaas.json'
$templateFile = 'contosoPass.json'
$template = $templatePath + '\' + $templateFile
}

### Create Resource Group
{
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $resourceGroupLocation `
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