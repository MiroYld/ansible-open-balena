# ansible-open-balena
Ansible playbook to deploy open balena server and admin dashboard

## How to use
```
$ git clone git@github.com:MiroYld/ansible-open-balena.git  
$ cd ansible-open-balena/  
$ ./deploy.sh  
```
## Deploy script
The ```deploy.sh``` script uses the inventory.yml file to deploy the playbook to the server:

## Roles
```
1) test: Test only pings your target and prints a message
2) utils: Install the necessary dependencies
3) open balena : Deploy the open balena server by running the quickstart scripts
4) ui_admin: Deploy the dashboard part for the open balena server
```
## Tips
Put your target in your ```~/.ssh/config``` and simply call your target in the ```inventory.yml```:
Example:
```
Host 
    hostname your-host
    user your-user 
    identityfile ~/.ssh/id_rsa
```
### Domains configuration
The following CNAME records must be configured to point to your host server:
```
api.your-domain.com
registry.your-domain.com
vpn.your-domain.com
s3.your-domain.com
tunnel.your-domain.com
admin-your-domain.com
```
### Access dashboard
To access your admin dashboard page you can follow the url: ```http://admin.your-domain.io:8080/```

### Licence MIT

