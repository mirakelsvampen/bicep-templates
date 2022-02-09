var adminUsername = 'epirocadmin'

module linuxVm 'modules/virtualMachine.bicep' = {
  name: 'linuxVm'
  params: {
    adminUsername: adminUsername
    sku: '18.04-LTS'
    vmSize: 'Standard_DS2_v2'
    vmName: 'adoagent-vm-weeu-dev-001'
    subnetName: 'ben-dev-shared-intsrv01'
    vnetId: '/subscriptions/29c25af1-9bcd-4aab-960d-5665914cb916/resourceGroups/ben-dev-shared-network/providers/Microsoft.Network/virtualNetworks/ben-shared-vnet-spoke01-d'
    keyvaultName: 'k8s-keyv-weeu-dev-001'
    tags: {}
    pubKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: loadTextContent('./keys/ben_epiroc.pub', 'utf-8')
      }
    ]
  }
}
