param (
  [Parameter()]
  [String]$Location = "$($env:LOCATION)",

  [Parameter()]
  [String]$TemplateFile,

  [Parameter()]
  [String]$TemplateParameterFile
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
function Get-AzResourceManagerAccessToken {
    $context = Get-AzContext
    $resourceProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile
    $client = New-Object Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient($resourceProfile)

    $token = $($client.AcquireAccessToken(($context).Tenant.TenantId).AccessToken)

    return $token
}

# Use powershell to get an accestoken based on the currently signed in account/service principal
$headers = @{
    Authorization = "Bearer $(Get-AzResourceManagerAccessToken)"
}

$roleDefinitionId = (Get-AzRoleDefinition -Name $RoleName).Id
