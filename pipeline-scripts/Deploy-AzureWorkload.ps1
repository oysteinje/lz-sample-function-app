param (
#  [Parameter()]
#  [String]$Location = "$($env:LOCATION)",
#
#  [Parameter()]
#  [String]$TemplateFile,
#
#  [Parameter()]
#  [String]$TemplateParameterFile

  [Parameter()]
  [String]$Foo = "bar"
)

## Parameters necessary for deployment
#$inputObject = @{
#  DeploymentName        = 'deploy-{0}' -f ( -join (Get-Date -Format 'yyyyMMddTHHMMssffffZ')[0..63])
#  Location              = $Location
#  TemplateFile          = $TemplateFile
#  TemplateParameterFile = $TemplateParameterFile
#  Verbose               = $true
#}
#
#New-AzSubscriptionDeployment @inputObject

# Function to get access token
#function Get-AzResourceManagerAccessToken {
#    $context = Get-AzContext
#    $resourceProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile
#    $client = New-Object Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient($resourceProfile)
#
#    $token = $($client.AcquireAccessToken(($context).Tenant.TenantId).AccessToken)
#
#    return $token
#}
#
## Use powershell to get an accestoken based on the currently signed in account/service principal
#$headers = @{
#    Authorization = "Bearer $(Get-AzResourceManagerAccessToken)"
#}

Write-Verbose "get rg"
Get-AzResourceGroup

Write-Verbose "get az key vault"
Get-AzKeyVault

Write-Verbose "get az front door"
Get-AzFrontDoor

Write-Verbose "Get role defs from code"
$listAllAzRoleDefinitions = Get-AzRoleDefinition -Scope "/subscriptions/a83145a3-215b-44a4-9387-a540faaa58e9"

Write-Verbose "Get role defs"
$roleDefinitionId = (Get-AzRoleDefinition -Scope "/subscriptions/a83145a3-215b-44a4-9387-a540faaa58e9").Id
