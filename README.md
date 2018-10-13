# medium-postgresql-backup
Resources for my article about PostgreSQL Backup scenarios 

## Included

### Vagrant/Vagrantfile 

- Setup PostgreSQL 10, with a user vagrant, with password vagrant.
- Allow connection from 0.0.0.0/0
- Set Server to listen on "*"
- Setup NAT Port forwating 5433 -> 5432

#### Start
* vagrant up
* vagrant halt
* vagrant up

vagrant ssh

/* will use port 5433 */
