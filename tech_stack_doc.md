# Stack Tecnológica - Event Orchestrator Microservice

## Visão Geral

Este documento apresenta a stack tecnológica escolhida para o desenvolvimento do microserviço orquestrador de eventos, justificando cada decisão técnica baseada nos requisitos do projeto.

## Requisitos do Projeto

- **Volume**: 100 eventos/segundo
- **Finalidade**: Modelo para testes e pesquisa
- **Ambiente**: Desenvolvimento (Docker)
- **Consistência**: Média para alta
- **Retenção**: 1 dia de histórico
- **Integrações**: Simulações de serviços downstream

## Stack Selecionada

### 🚀 **Core Framework**

#### **NestJS + TypeScript**

- **Justificativa**:
  - Framework enterprise-ready com arquitetura modular
  - Dependency Injection nativo
  - Decorators para clean code
  - Suporte nativo a microserviços
  - Excelente integração com TypeScript
  - Documentação automática com Swagger

#### **Express.js** (Interno do NestJS)

- **Justificativa**: Performance adequada para 100 req/s, ecosystem maduro

### 💾 **Persistência**

#### **PostgreSQL**

- **Justificativa**:
  - ACID compliance para consistência dos dados
  - Suporte nativo a JSONB para payloads flexíveis
  - Performance excelente para read/write operations
  - Recursos avançados (índices, particionamento)
  - Ecosystem robusto no Node.js

#### **Prisma ORM**

- **Justificativa**:
  - Type-safety completa com TypeScript
  - Migrations automáticas e versionadas
  - Query builder intuitivo
  - Introspection e schema validation
  - Excelente DX (Developer Experience)

### 🔄 **Message Broker & Queues**

#### **Redis + BullMQ**

- **Justificativa**:
  - Setup simples comparado ao RabbitMQ/Kafka
  - Performance excelente para o volume requerido
  - BullMQ oferece retry automático e dead-letter queues
  - Monitoring e dashboard built-in
  - Menor overhead operacional
  - Suporte nativo a delay e scheduling

### 🛡️ **Validação & Segurança**

#### **Zod**

- **Justificativa**:
  - Type-safe validation
  - Runtime type checking
  - Esquemas reutilizáveis
  - Mensagens de erro customizáveis
  - Performance superior ao Joi

#### **JWT + API Keys**

- **Justificativa**:
  - Stateless authentication
  - Simples de implementar e testar
  - Padrão industry standard
  - Boa performance (sem consultas ao banco)

#### **express-rate-limit + Redis**

- **Justificativa**:
  - Proteção contra abuse
  - Store distribuído com Redis
  - Configuração flexível por endpoint

### 📊 **Observabilidade**

#### **Winston**

- **Justificativa**:
  - Logs estruturados (JSON)
  - Múltiplos transports
  - Níveis de log configuráveis
  - Rotação automática de arquivos

#### **Prometheus + prom-client**

- **Justificativa**:
  - Métricas time-series
  - Padrão de mercado para monitoring
  - Integração com Grafana
  - Métricas customizadas de negócio

### 🧪 **Testes & Documentação**

#### **Jest + Supertest**

- **Justificativa**:
  - Framework padrão para Node.js/TypeScript
  - Mocking avançado
  - Coverage reports
  - Testes de integração com supertest

#### **Swagger/OpenAPI (@nestjs/swagger)**

- **Justificativa**:
  - Documentação automática
  - Geração de tipos TypeScript
  - Interface de testes integrada
  - Padrão OpenAPI 3.0

## Arquitetura de Software

### Padrões Arquiteturais

#### **Clean Architecture**

- Separação clara entre camadas
- Inversão de dependências
- Testabilidade aprimorada
- Baixo acoplamento

#### **Event-Driven Architecture**

- Processamento assíncrono de eventos
- Desacoplamento entre componentes
- Alta escalabilidade
- Resilência a falhas

#### **Repository Pattern**

- Abstração da camada de dados
- Facilita testes unitários
- Flexibilidade para troca de ORMs
- Separação de responsabilidades

#### **Strategy Pattern**

- Diferentes estratégias de processamento por tipo de evento
- Extensibilidade para novos tipos
- Código mais limpo e organizado

### Estrutura de Camadas

```
┌─ Presentation Layer (Controllers, DTOs, Guards)
├─ Application Layer (Services, Use Cases)
├─ Domain Layer (Entities, Value Objects)
├─ Infrastructure Layer (Repositories, External Services)
└─ Cross-Cutting (Logging, Metrics, Validation)
```

## Estrutura do Projeto

```
src/
├── common/           # Utilitários compartilhados
├── config/          # Configurações da aplicação
├── controllers/     # Controladores REST
├── services/        # Lógica de negócio
├── repositories/    # Acesso a dados
├── queues/          # Processamento de filas
├── guards/          # Autenticação e autorização
├── interceptors/    # Logging e métricas
├── validators/      # Schemas de validação
├── types/           # Tipos TypeScript
└── main.ts         # Bootstrap da aplicação
```

## Benefícios da Stack Escolhida

### ✅ **Vantagens**

1. **Type Safety**: TypeScript + Prisma + Zod garantem type safety end-to-end
2. **Developer Experience**: Tooling moderno com excelente DX
3. **Performance**: Adequada para 100 eventos/segundo com margem de crescimento
4. **Simplicidade**: Stack equilibrada entre simplicidade e robustez
5. **Observabilidade**: Logs estruturados e métricas desde o início
6. **Testabilidade**: Arquitetura favorece testes automatizados
7. **Documentação**: API auto-documentada com Swagger

### ⚠️ **Considerações**

1. **Redis Single Point of Failure**: Aceitável para ambiente de desenvolvimento
2. **PostgreSQL**: Pode ser over-engineering para alguns casos, mas oferece flexibilidade futura
3. **Learning Curve**: NestJS tem curva de aprendizado, mas compensa com produtividade


---

**Versão**: 1.0
**Data**: Junho 2025
**Autor**: Yves Siqueira
