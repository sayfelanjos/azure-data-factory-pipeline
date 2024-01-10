import { schemaMappings } from 'cursos.bicep'

var myarray  = [
  schemaMappings
]

var myobject = myarray[0]


output myobjectoutput object = myobject
