# /*****************\HEADER/******************
# * COMPANY: ENG4TECH LTDA                  *
# * WEBPAGE: www.eng4tech.com.br            *
# * AUTHORS: Saymon Felipe                  *
# * VERSION: 1.0                            *
# * CREATED: 12/20/2023, 12:37:30 AM        *
# * MODIFIED: 12/27/2023, 5:20:19 PM        *
# * FILE: start-trigger.ps1                 *
# *******************************************/

# Parameters
$DATA_FACTORY_NAME="datafactoryb2v42c6lrdhxs"
$RESOURCE_GROUP_NAME="Lab-Neolude-BI"

# Trigger Pipeline

az datafactory trigger start `
    --factory-name $DATA_FACTORY_NAME `
    --resource-group $RESOURCE_GROUP_NAME `
    --name "adf-pipeline-trigger" 