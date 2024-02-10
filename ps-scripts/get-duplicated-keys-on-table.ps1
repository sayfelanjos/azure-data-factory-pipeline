$array = ConvertFrom-Json $json

for ($i = $array.Length; $i -gt 1; $i--) {
    $element = $array[$i].CampaignContentID 
    for ($j = $i - 1; $j -ge 0; $j-- ) {
        if ($element -eq $array[$j].CampaignContentID) {
            # $array[$j]
            $element
        }
    }
}

