PACKAGES=(
  "eslint"
  "typescript"
  "ts-node"
  "@types/node"
  "typescript-eslint"
)

for p in $PACKAGES; do
  npm install -g $p
done
