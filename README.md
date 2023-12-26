# Demo - Mysql / Debezium / RabbitMQ / KibaETL

This project was created with a focus on showcasing the utilization of the Debezium tool to implement a Change Data Capture (CDC) process. It effectively tracks data changes and synchronizes information with various destinations such as databases, indexers, private data stores, disks, etc.

Change Data Capture (CDC) is a technique used in databases to identify and capture changes (additions, updates, or deletions) made to the data. Instead of continuously scanning the entire database, CDC allows you to track and capture only the data that has changed since the last check. This helps in efficiently managing and replicating updates, reducing the workload on the database and improving overall performance.

Here, you'll discover setup files, docker-compose configurations, and additional resources intended to serve as a motivational starting point for your real-world projects.

## Getting Started

<img width="706" alt="Screenshot 2023-12-15 at 00 37 48" src="https://github.com/edsonma/demo_cdc_mysql-debezium-rabbitmq-kibaetl/assets/711579/f80d246d-63e8-42a1-83a5-39f46b7e85ba">


### Technologies
- What technologies will you find here?
  - mysql sql database
  - debezium CDC platform
  - rabbitmq Message broker
  - kibaETL (Extract Transform and Load)
  

### Requirements

- you must have docker engine installed
  Here's an article introducing container tools for your local machine.
  [Beyond Docker: Emulation, Orchestration and Virtualization in Apple Silicon](https://oramind.com/using-docker-kubernetes-efficiently-on-macos/)

  I am Mac user, so I like [OrbStack](https://orbstack.dev/download)

- [Docker Compose](https://docs.docker.com/compose/) is used as a convenient method to effortlessly bootstrap this application.  

### Baby steps

- Clone this repo: 
```fish
  git clone [git@github.com:edsonma/demo_cdc_mysql-debezium-rabbitmq-kibaetl.git](git@github.com:edsonma/demo_cdc_mysql-debezium-rabbitmq-kibaetl.git)
```

- Walk to cloned directory:
```fish
  cd demo_cdc_mysql-debezium-rabbitmq-kibaetl
```

- [LGTM](https://www.urbandictionary.com/define.php?term=Let%27s%20Get%20This%20Money) (use docker-compose)

```fish
docker compose up -d
```

## Contributing

Embrace collaboration with coding hands.
"Contribute your skills, create impact, and collaboratively shape the future of technology!"

### References

#### Debezium connector for mysql
- https://debezium.io/documentation/reference/stable/connectors/mysql.html


#### Based on [Gabriel Bueno](https://github.com/GabrielBueno200) CDC Demo 

- https://github.com/GabrielBueno200/DemoCDCWithRabbitMQAndNetCore/tree/main

--- 
Thank you Man! 
```
Prosit!

.~~~~.
i====i_
|cccc|_)
|cccc|
`-==-'
```
