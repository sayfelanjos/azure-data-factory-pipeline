# /*****************\HEADER/******************
# * COMPANY: ENG4TECH LTDA                  *
# * WEBPAGE: www.eng4tech.com.br            *
# * AUTHORS: Saymon Felipe                  *
# * VERSION: 1.0                            *
# * CREATED: 12/20/2023, 12:37:30 AM        *
# * MODIFIED: 12/27/2023, 5:23:03 PM        *
# * FILE: create-trigger.ps1                *
# *******************************************/

# Create Trigger
az datafactory trigger create `
    --factory-name "datafactoryb2v42c6lrdhxs" `
    --resource-group "Lab-Neolude-BI" `
    --properties scheduleTrigger.json `
    --name "adf-pipeline-trigger"