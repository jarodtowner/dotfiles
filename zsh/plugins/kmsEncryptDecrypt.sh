kms-decrypt () {
  decryptedText=$(\
    echo $1 \
    | base64 --decode \
    | aws kms decrypt --ciphertext-blob fileb:///dev/stdin --output text --query Plaintext \
    | base64 --decode \
  )
  echo $decryptedText
  echo $decryptedText | pbcopy
  echo Copied to clipboard
}

kms-encrypt () {
  keyId=$(aws kms describe-key --key-id alias/LAAMP --output text --query KeyMetadata.KeyId)
  encryptedText=$(aws kms encrypt --key-id $keyId --plaintext $1 --output text --query CiphertextBlob)
  echo $encryptedText
  echo $encryptedText | pbcopy
  echo Copied to clipboard
}