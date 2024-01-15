@description('Data Factory Name')
param dataFactoryName string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource sqlDataSetOut 'Microsoft.DataFactory/factories/datasets@2018-06-01' = {
  name: 'positions_tb'
  parent: dataFactory
  properties: {
    annotations: []
    type: 'AzureSqlTable'
    linkedServiceName: {
      referenceName: 'sqldb-linked-service'
      type: 'LinkedServiceReference'
    }
    schema: [
      {
        name: 'PositionID'
        type: 'bigint'
        precision: 19
      }
      {
        name: 'PositionName'
        type: 'nvarchar'
      }
      {
        name: 'IsDeleted'
        type: 'bit'
      }
      {
        name: 'AuditCreatedDate'
        type: 'nvarchar'
      }
      {
        name: 'AuditLastUpdatedDate'
        type: 'nvarchar'
      }
      {
        name: 'Page'
        type: 'bigint'
        precision: 19
      }
      {
        name: 'PageSize'
        type: 'bigint'
        precision: 19
      }
      {
        name: 'MaximumPageSize'
        type: 'bigint'
        precision: 19
      }
    ]
    typeProperties: {
      table: 'positions'
      schema: 'neolude'
    }
    folder: {
      name: 'sql_tables'
    }
  }
}
