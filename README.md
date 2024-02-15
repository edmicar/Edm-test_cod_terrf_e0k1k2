# AWS KMS, SNS, e CloudWatch Alarms com Terraform

Este projeto utiliza Terraform para criar e gerenciar uma infraestrutura AWS com foco em segurança (KMS), notificações (SNS) e monitoramento (CloudWatch Alarms). A configuração é feita de maneira modular para permitir fácil personalização e reutilização em diferentes ambientes.

## Índice

- [Introdução](#introdução)
- [Configuração de Ambientes](#configuração-de-ambientes)
- [Como Usar](#como-usar)
  - [Adicionar Novos Recursos](#adicionar-novos-recursos)
    - [KMS](#kms)
    - [SNS](#sns)
    - [CloudWatch Alarms](#cloudwatch-alarms)
- [Gerenciamento de Configurações](#gerenciamento-de-configurações)
  - [Arquivos terraform.tfvars](#arquivos-terraformtfvars)
- [Exemplo de Configuração](#exemplo-de-configuração)
- [Contribuições](#contribuições)

## Introdução

Este repositório contém módulos Terraform para a criação de chaves KMS para criptografia, tópicos SNS para notificações de alarmes e alarmes CloudWatch para monitorar recursos AWS especificamente as StepFunctions.

## Configuração de Ambientes

Utilizamos arquivos `terraform.tfvars` para definir variáveis específicas de cada ambiente (por exemplo, desenvolvimento, teste, produção). Isso permite uma gestão de configuração flexível e fácil de manter.

## Como Usar

### Adicionar Novos Recursos

#### KMS

Para adicionar uma nova chave KMS:

```hcl
module "kms_new" {
  source    = "./aws_module/Kms"
  Kms_alias = "alias/nova_chave_kms"
}
```

#### SNS
Para criar um novo tópico SNS e adicionar subscrições:

```hcl
module "sns_new" {
  source          = "./aws_module/SNS"
  sns_topic_name  = "novo_topico_sns"
  email_addresses = ["email1@example.com", "email2@example.com"]
  kms_key         = module.kms_new.aws_kms_key
}
```
#### CloudWatch Alarms
Para configurar novos alarmes CloudWatch:

```hcl

module "alarm_new" {
  source         = "./aws_module/CLOUDWATCH"
  alarmslist_name = ["nome_alarme_novo"]
  stateMachines  = ["nome_state_machine_novo"]
  sns_topic_arn  = module.sns_new.sns_topic_arn
}
```

#### Gerenciamento de Configurações
Arquivos terraform.tfvars
Para cada ambiente, crie um arquivo terraform.tfvars específico (por exemplo, dev.tfvars, prod.tfvars) com conteúdo semelhante a:

email_addresses = ["novo.email@example.com"]

Exemplo de Configuração
Para aplicar uma configuração em um ambiente específico, use o comando Terraform com o flag -var-file:


```shell
terraform apply -var-file=dev.tfvars
```

#### Contribuições
Contribuições para este projeto são bem-vindas. Para contribuir, por favor, abra uma issue ou um pull request com suas sugestões ou adições.



Esse README.md fornece uma visão geral clara sobre como o projeto é estruturado, como configurar e personalizar os módulos Terraform para diferentes recursos AWS, e como gerenciar as configurações para ambientes distintos usando arquivos `terraform.tfvars`. A inclusão de exemplos específicos para adicionar novos recursos via módulos ajuda os usuários a entender como estender sua infraestrutura conforme necessário.



