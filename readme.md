# BINFO-CEP: Exercise 2 JPA document repository

This is a JPA implementation of a document repository .

## Structure

The project is composed by following components:

1. Library `./src/main/java/lu/uni/exercise2/Library.java` Session scoped bean allowing to load yearly documents (default current year)
2. Document `./src/main/java/lu/uni/exercise2/Document.java` Request scoped bean and entity showing the document details.
3. Author `./src/main/java/lu/uni/exercise2/Author.java` Request scoped bean and entity showing the author details.
4. AuthorService (`/src/main/java/lu/uni/exercise2/AuthorService.Java` Application scoped repository for authors
5. DocumentService `/src/main/java/lu/uni/exercise2/DocumentService.Java`) Aplication scoped repository for documents.

> \* The web flow is defined in `./src/main/webapp/WEB-INF/faces-config.xml` and the pages can be found under `./src/main/webapp/` folder.

## Run the application

The application was testes with JDK 22, maven 3.9.6 and provided wildfly docker application server

### Prerequisites

- maven 3.9.6 [https://maven.apache.org](https://maven.apache.org)
- jdk 21 [https://www.oracle.com/java/technologies/downloads/#java21](https://www.oracle.com/java/technologies/downloads/#java22)
- wildfly + mariadb application server

### Build and deploy

- Import DB: `./DB.sql` into mariadb server
  > Docker EX: connect to mariadb docker > exec > run `$ mariadb -h 127.0.0.1 -u javaee -p javaee`, use `eeavaj` for password, copy & paste into terminal the `./DB.sql` file content > ENTER
- Build `$ mvn clean package wildfly:deploy`

### RUN

- Open [http://localhost:8080/Exercise2/](http://localhost:8080/Exercise2/)
