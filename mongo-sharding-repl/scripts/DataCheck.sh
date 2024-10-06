#!/bin/bash
docker compose exec -T mongos_router mongosh --quiet --port 27020 <<EOF
use somedb;
const count = db.helloDoc.countDocuments();
print("Количество записей: " + count);
EOF

docker compose exec -T shard1 mongosh --quiet --port 27018 <<EOF
use somedb;
const count = db.helloDoc.countDocuments();
print("Количество записей: " + count);
EOF

docker compose exec -T  shard2 mongosh --quiet --port 27019 <<EOF
use somedb;
const count = db.helloDoc.countDocuments();
print("Количество записей: " + count);
EOF
