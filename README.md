# Run Database for the BPC-BDS course

Clone the repository: 

and run the following command in the root directory.
```shell
$ docker-compose up
```

### Connection details

**http://localhost/pgadmin4/**

johndoe@email.cz:postgres


### DB

**Host**: sedaq-db-postgres

**Port**: 5432

**Maintenance database**:  postgres

**Password**: postgres

# "Documentation"

On container startup, flyway will automatically apply all migrations located in ./db/migration/postgresql.

Page 4 in "Project1.pdf" describes how whole application works.
Application in production can be found [here](https://studio-effect.cz).