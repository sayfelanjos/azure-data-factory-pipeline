# /*****************\HEADER/******************
# * COMPANY: ENG4TECH LTDA                  *
# * WEBPAGE: www.eng4tech.com.br            *
# * AUTHORS: Saymon Felipe                  *
# * VERSION: 1.0                            *
# * CREATED: 12/20/2023, 12:37:30 AM        *
# * MODIFIED: 12/27/2023, 5:18:43 PM        *
# * FILE: delete-trigger.ps1                *
# *******************************************/

# Parameters
$DATA_FACTORY_NAME="datafactoryb2v42c6lrdhxs"
$RESOURCE_GROUP_NAME="Lab-Neolude-BI"
$TRIGGER_NAME="adf-pipeline-trigger"

az datafactory trigger stop --factory-name $DATA_FACTORY_NAME --resource-group $RESOURCE_GROUP_NAME --name $TRIGGER_NAME
az datafactory trigger delete --factory-name $DATA_FACTORY_NAME --resource-group $RESOURCE_GROUP_NAME --name $TRIGGER_NAME