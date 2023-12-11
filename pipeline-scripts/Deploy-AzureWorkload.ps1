param (
  [Parameter()]
  [String]$Location = "$($env:LOCATION)",

  [Parameter()]
  [String]$TemplateFile = "infra-as-code\inspection-checklist-reports\main.bicep",

  [Parameter()]
  [String]$TemplateParameterFile = "infra-as-code\inspection-checklist-reports\main.$($env:ENVIRONMENT).bicepparam",

  [Parameter()]
  [String]$ResourceGroupName = "$($env:AZURE_FUNCTIONAPP_RESOURCE_GROUP_NAME)"
)

$resourceGroupInputObject = @{
  Name     = $ResourceGroupName
  Location = $Location
  Verbose  = $true
  Force    = $true
}


# Parameters necessary for function app deployment
$functionAppInputObject = @{
  DeploymentName        = 'deploy-icr{0}' -f ( -join (Get-Date -Format 'yyyyMMddTHHMMssffffZ')[0..63])
  Location              = $Location
  TemplateFile          = $TemplateFile
  TemplateParameterFile = $TemplateParameterFile
  ResourceGroupName     = $ResourceGroupName
  Verbose               = $true
}

New-AzResourceGroup @resourceGroupInputObject
New-AzResourceGroupDeployment @functionAppInputObject
