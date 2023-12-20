# Parameters
$PIPELINE_NAME="FromRestToBlobPipeline"

# Create Trigger
az datafactory trigger create `
    --factory-name "datafactoryb2v42c6lrdhxs" `
    --resource-group "Lab-Neolude-BI" `
    --properties scheduleTrigger.json `
    --name "adf-pipeline-trigger"