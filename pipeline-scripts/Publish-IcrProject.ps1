param(
    [Parameter()]
    [String]$ARCHIVE_PATH,
    [Parameter()]
    [String]$AZURE_FUNCTIONAPP_NAME = "$($env:AZURE_FUNCTIONAPP_NAME)",
    [Parameter()]
    [String]$AZURE_FUNCTIONAPP_RESOURCE_GROUP_NAME = "$($env:AZURE_FUNCTIONAPP_RESOURCE_GROUP_NAME)"
)

Publish-AzWebApp -ArchivePath $ARCHIVE_PATH `
  -Type "zip" `
  -Name $AZURE_FUNCTIONAPP_NAME `
  -ResourceGroupName $AZURE_FUNCTIONAPP_RESOURCE_GROUP_NAME `
  -Force `
  -Verbose
