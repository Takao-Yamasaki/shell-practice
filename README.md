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

## ファイルの転送方法
```
scp -i shell-keypair.pem $(FILE) ec2-user@xxx.xxx.xxx.xxx:
```

## ログイン方法
- ec2-userにログイン
```
su - ec2-user
```

## SSHの自動切断回避
- SSHの設定ファイルを編集
```
sudo vi /etc/ssh/sshd_config
```
- コメントアウトを解除
```
# 秒数ごとに応答確認
ClientAliveInterval 120
# 応答確認を行う回数
ClientAliveCountMax 3
```
- SSHを再起動
```
sudo systemctl restart sshd
```



## 参考
- [AWS入門：Terraformで構築したEC2環境にSSH接続する](https://yossi-note.com/ssh_connection_to_the_ec2_environment_built_with_terraform/)
