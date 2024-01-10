@export()
var schemaMappings = {
  pipelineName: ''
  relativeURL: ''
  dataSetInName: ''
  dataSetOutName: ''
  schemaMapping: {
    id: 'id'
    name: 'name'
    username: 'username'
    email: 'email'
    'address.street': 'street'
    'address.suite': 'suite'
    'address.city': 'city'
    'address.zipcode': 'zipcode'
    'address.geo.lat': 'lat'
    'address.geo.lng': 'lng'
    phone: 'phone'
    website: 'website'
    'company.name': 'company_name'
    'company.catchPhrase': 'company_catch_phrase'
    'company.bs': 'company_bs'
  }
  tableStructure: [
    {
      name: 'id'
      type: 'Int64'
    }
    {
      name: 'name'
      type: 'String'
    }
    {
      name: 'username'
      type: 'String'
    }
    {
      name: 'email'
      type: 'String'
    }
    {
      name: 'street'
      type: 'String'
    }
    {
      name: 'suite'
      type: 'String'
    }
    {
      name: 'city'
      type: 'String'
    }
    {
      name: 'zipcode'
      type: 'String'
    }
    {
      name: 'lat'
      type: 'String'
    }
    {
      name: 'lng'
      type: 'String'
    }
    {
      name: 'phone'
      type: 'String'
    }
    {
      name: 'website'
      type: 'String'
    }
    {
      name: 'company_name'
      type: 'String'
    }
    {
      name: 'company_catch_phrase'
      type: 'String'
    }
    {
      name: 'company_bs'
      type: 'String'
    }
  ]
}
