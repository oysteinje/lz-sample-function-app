using 'main.bicep'

param env = 'd'
param serviceName = readEnvironmentVariable('SERVICE_NAME')
param subscriptionPurposeName = readEnvironmentVariable('SUBSCRIPTION_PURPOSE_NAME')
