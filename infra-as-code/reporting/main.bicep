targetScope='subscription'

param env string
param location string

// Deploy Resource Group
resource workloadRg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'reporting-${env}'
  location: location
}
