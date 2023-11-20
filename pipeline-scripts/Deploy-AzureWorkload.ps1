param (
  [Parameter()]
  [String]$Location = "$($env:LOCATION)",

  [Parameter()]
  [String]$TemplateFile,

  [Parameter()]
  [String]$TemplateParameterFile
)

# Parameters necessary for deployment
$inputObject = @{
  DeploymentName        = 'deploy-{0}' -f ( -join (Get-Date -Format 'yyyyMMddTHHMMssffffZ')[0..63])
  Location              = $Location
  TemplateFile          = $TemplateFile
  TemplateParameterFile = $TemplateParameterFile
  Verbose               = $true
}
write-host "foo"
New-AzSubscriptionDeployment @inputObject
