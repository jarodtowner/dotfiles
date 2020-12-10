PACKAGES=(
  "eslint"
  "typescript"
  "ts-node"
  "@types/node"
  "typescript-eslint"
  "pm2"
)

for p in $PACKAGES; do
  npm install -g $p
done
