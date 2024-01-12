Compare-Object `
    -ReferenceObject (Get-Content -Path C:\Users\saymo\eng4tech\neolude\NEOLUDE-BI\armTemplates\pipelines\EXECUTEPPLSNEOLUDE_support_VSTS\pipeline\PPLNEOLUDE_CONTEUDO_2.json) `
    -DifferenceObject (Get-Content -Path C:\Users\saymo\eng4tech\neolude\NEOLUDE-BI\armTemplates\pipelines\EXECUTEPPLSNEOLUDE_support_VSTS\pipeline\PPLNEOLUDE_CONTEUDO.json)