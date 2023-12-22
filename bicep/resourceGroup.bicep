targetScope='subscription'

resource newRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'Neolude-Pipeline'
  location: 'brazilsouth'
}
