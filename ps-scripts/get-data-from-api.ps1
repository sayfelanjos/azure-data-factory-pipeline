$jsonString = @"
{
    "data": [

    ]
}
"@

$jsonObject = ConvertFrom-Json $jsonString

for ($i = 2; $i -gt 0; $i--) {
    curl --location "https://data-api.neolude.com.br/examtakenanswers?page=$($i)&page_size=5000" `
    --header 'x-api-key: WR9mNZdh9r2D8bZK4U1q12NvtlVJVobI4CaKBiEu' $jsonObject.data.Add()
}
