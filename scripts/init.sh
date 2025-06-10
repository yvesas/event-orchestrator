#!/bin/sh

# echo "🔄 Aguardando PostgreSQL estar pronto..."
# while ! nc -z postgres 5432; do
#   sleep 0.1
# done
# echo "✅ PostgreSQL está pronto!"

# echo "🔄 Aguardando Redis estar pronto..."
# while ! nc -z redis 6379; do
#   sleep 0.1
# done
# echo "✅ Redis está pronto!"

echo "🔄 Gerando cliente Prisma..."
npx prisma generate

echo "🔄 Verificando migrações do banco de dados..."
# Verifica se existe a tabela _prisma_migrations
if ! npx prisma migrate status | grep -q "Database schema is up to date"; then
  echo "📦 Criando migração inicial..."
  # Força a criação do diretório de migrações se não existir
  mkdir -p prisma/migrations
  # Garante permissões de escrita
  chmod -R 777 prisma/migrations
  # Tenta criar a migração inicial
  npx prisma migrate dev --name init --create-only
  # Aplica a migração
  npx prisma migrate deploy
else
  echo "🔄 Aplicando migrações existentes..."
  npx prisma migrate deploy
fi

# echo "🚀 Iniciando aplicação..."
# npm run start:dev 