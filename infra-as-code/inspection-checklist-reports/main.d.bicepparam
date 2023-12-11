using 'main.bicep'

param env = 'd'
param serviceName = readEnvironmentVariable('ICR_SERVICE_NAME')
param subscriptionPurposeName = readEnvironmentVariable('SUBSCRIPTION_PURPOSE')
