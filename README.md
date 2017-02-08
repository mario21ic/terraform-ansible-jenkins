# Install Jenkins 2 with Terraform + Ansible

Create instance with Terraform:
```
$ cd terraform && terraform apply
```

Install jenkins with Ansible
```
$ cd ansible && ansible-playbook -i ec2.py playbook.yml -vv
```
