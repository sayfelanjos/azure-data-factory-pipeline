# Parameters
$DATA_FACTORY_NAME="datafactoryb2v42c6lrdhxs"
$RESOURCE_GROUP_NAME="Lab-Neolude-BI"

# Trigger Pipeline

az datafactory trigger start `
    --factory-name $DATA_FACTORY_NAME `
    --resource-group $RESOURCE_GROUP_NAME `
    --name "adf-pipeline-trigger" 