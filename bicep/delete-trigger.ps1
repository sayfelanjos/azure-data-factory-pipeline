# Parameters
$DATA_FACTORY_NAME="datafactoryb2v42c6lrdhxs"
$RESOURCE_GROUP_NAME="Lab-Neolude-BI"
$TRIGGER_NAME="adf-pipeline-trigger"

az datafactory trigger stop --factory-name $DATA_FACTORY_NAME --resource-group $RESOURCE_GROUP_NAME --name $TRIGGER_NAME
az datafactory trigger delete --factory-name $DATA_FACTORY_NAME --resource-group $RESOURCE_GROUP_NAME --name $TRIGGER_NAME