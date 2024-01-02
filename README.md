# shell-practice
- EC2上でシェルスクリプトを練習するためのサンプルです
- AWSリソースの管理にterraformを使用しています
## 事前準備
- AWSリソースを展開
- IPアドレスが発行されるので、メモしておく
```
terraform apply
```
- ローカルにキーペアを作成
```
aws secretsmanager get-secret-value --secret-id shell-keypair | jq -r .SecretString > shell-keypair.pem
```
- パーミッションの変更
```
chmod 600 shell-keypair.pem
```
- SSH接続
```
ssh -i shell-keypair.pem ec2-user@xxx.xxx.xxx.xxx
```
