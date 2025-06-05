# Especificações e Requisitos

## **Contexto**

Desenvolver um microserviço crítico que atua como orquestrador de eventos em uma plataforma B2B. Este serviço receberá eventos de parceiros comerciais, validará, processará e distribuirá para outros microserviços, lidando com milhares de eventos simultâneos.

## **Requisitos Funcionais**

1. API REST para recebimento e processamento de eventos:
   * Endpoint para receber eventos de parceiros
   * Consulta de status de processamento de eventos
   * Reprocessamento de eventos com falha
   * Estatísticas de processamento
2. Cada evento deve conter:
   * ID único
   * Tipo de evento (VENDA, DEVOLUÇÃO, ATUALIZAÇÃO_ESTOQUE, etc.)
   * Dados do evento (payload JSON)
   * Origem (ID do parceiro)
   * Timestamp
   * Status de processamento
3. Implementar fluxo de processamento:
   * Validação do evento (formato, campos obrigatórios, regras de negócio)
   * Enriquecimento de dados (adicionar informações relevantes)
   * Distribuição para serviços downstream (simular com filas de mensagens)
   * Persistência do histórico de processamento
4. Sistema de retry e dead-letter:
   * Implementar mecanismo de retry para eventos com falha
   * Após N tentativas, mover para uma fila de dead-letter
   * Permitir reprocessamento manual de eventos na dead-letter

## **Requisitos Técnicos**

* Utilizar Node.js com TypeScript
* Banco de dados PostgreSQL ou MongoDB (vamos definir o melhor para o sistema).
* Documentação da API (Swagger/OpenAPI)
* Containerização com Docker e docker-compose
* Testes automatizados unitários.

## **Entrega**

* README com instruções detalhadas para execução do projeto e breve explicação sobre porque da escolha de usar padrão X e ou lib Y.
* Docker-compose funcional que permita executar a aplicação com um único comando

### **Observações**

* O sistema deve ser projetado para alta concorrência
* Implementar mecanismos de rate limiting para proteger a API
* Considerar aspectos de observabilidade (logs estruturados, métricas)
* Implementar idempotência para garantir processamento único de eventos
* Não é necessário desenvolver interface de usuário, apenas a API REST