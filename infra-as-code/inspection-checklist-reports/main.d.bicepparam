using 'main.bicep'

param env = readEnvironmentVariable('ENVIRONMENT')
param serviceName = readEnvironmentVariable('ICR_SERVICE_NAME')
param subscriptionPurposeName = readEnvironmentVariable('SUBSCRIPTION_PURPOSE')
