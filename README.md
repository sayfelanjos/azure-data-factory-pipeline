## **Automatização de criação do Azure Data Factory**

[![Build Status](https://dev.azure.com/neolude/NEOLUDE-BI/_apis/build/status%2FCria%20Azure%20Data%20Factory%20Pipeline?branchName=create-bicep-resource-group-template)](https://dev.azure.com/neolude/NEOLUDE-BI/_build/latest?definitionId=1&branchName=create-bicep-resource-group-template)

Este documento serve como guia para utilização do Azure DevOps Pipeline na criação e configuração de um ambiente Azure Data Factory.

Siga os seguintes passos para execução do pipeline.

1. Abra o Azure DevOps pelo link: *https://dev.azure.com/neolude*.

2. Escolha o projeto NEOLUDE-BI.

3. Click em **Pipelines** na barra lateral esquerda.

4. Selecione o pipeline **Cria Azure Data Factory Pipeline**.

5. Click em **Run pipeline**, botão azul no canto superior direito da tela.

6. No forms que aparecerá no canto direito da tela você terá que preencher os seguintes campos:

    * *Branch/tag* - Escolha a versão do pipeline que será executado. Você poderá escolher através da tag ou no nome da branch. A ultima versão estará na branch **main** e na tag **last-version**.

    * *Nome do cliente para o qual serão criados os recursos* - Nome que será dado ao **Resource Group**. Uma sugestão é colocar um nome que identifique facilmente o propósito dos recursos como, por exemplo, o nome do cliente. 

    * *API URL* - URL que será usada para extrair os dados. Default: *https://data-api.neolude.com.br*

    * *Ambiente de desenvolvimento ex: dev, stg, prod* - Ambiente de desenvolvimento. Os mais comumente utilizados são: development (dev), staging (stg), production (prod).

    * *Departamento responsável* -  Departamento que estará usufruindo dos recursos criados. Exemplos: Business Inteligence (bi), Marketing (mkt), Information Tecnology (it). Obs: O padrão é utilizar a abreviação com letras minúsculas.

7. Após preencher os campos listados acima, vá em *Advanced options* e click em *Variables*.
Preencha os valores para *adminLogin*, *adminPassword*, que serão os dados de acesso para o banco de dados SQL, e *apiToken* que é o token de acesso a API.

8. Por fim click em **Run**, botão azul no canto inferior direito, e aguarde a criação do Azure Data Factory.

9. Após finalizado o processo de criação, o Azure Data Factory poderá ser acessado pelo portal *https://portal.azure.com*.
