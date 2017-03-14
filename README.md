# Moody

Moody. So can be anything. Swift version.

## Requirements
- [Vapor toolbox](https://github.com/vapor/toolbox)
- PostgreSQL
  - Add `Config/secrets/postgresql.json`:

  ```
  {
    "host": "127.0.0.1",
      "user": "postgres",
      "password": "",
      "database": "test",
      "port": 5432
  } 
  ```


## Getting Started
```
make run
```
Go to [localhost:8080](http://localhost:8080)

## Development

### Client
```
make run-client
cd ./Resources/SPA && vim .
```
Go to [localhost:3000](http://localhost:3000)

### API/Vapor
```
make run-vapor
```
