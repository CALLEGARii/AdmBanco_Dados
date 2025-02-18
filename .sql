veterano@D007-8:~$ psql -h localhost -U postgres
Password for user postgres: 
psql (14.11 (Ubuntu 14.11-0ubuntu0.22.04.1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=# \pset pager off
Pager usage is off.
postgres=# \l
                                  List of databases
    Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
------------+----------+----------+-------------+-------------+-----------------------
 adb        | postgres | UTF8     | pt_BR.UTF-8 | pt_BR.UTF-8 | 
 adb2       | postgres | UTF8     | pt_BR.UTF-8 | pt_BR.UTF-8 | 
 aula1      | postgres | UTF8     | pt_BR.UTF-8 | pt_BR.UTF-8 | 
 chapregras | postgres | UTF8     | pt_BR.UTF-8 | pt_BR.UTF-8 | 
 postgres   | postgres | UTF8     | pt_BR.UTF-8 | pt_BR.UTF-8 | 
 template0  | postgres | UTF8     | pt_BR.UTF-8 | pt_BR.UTF-8 | =c/postgres          +
            |          |          |             |             | postgres=CTc/postgres
 template1  | postgres | UTF8     | pt_BR.UTF-8 | pt_BR.UTF-8 | =c/postgres          +
            |          |          |             |             | postgres=CTc/postgres
(7 rows)
  
postgres=# \c aula1 
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "aula1" as user "postgres".
aula1=# \dt
            List of relations
 Schema |     Name     | Type  |  Owner   
--------+--------------+-------+----------
 public | aluno        | table | postgres
 public | clientes     | table | postgres
 public | correntista  | table | postgres
 public | funcionarios | table | postgres
 public | pedidos      | table | postgres
(5 rows)

aula1=# exit
veterano@D007-8:~$ psql -h localhost -U postgres
Password for user postgres: 
psql (14.11 (Ubuntu 14.11-0ubuntu0.22.04.1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=# \c a
adb    adb2   aula1  
postgres=# \c aula1 
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "aula1" as user "postgres".
aula1=# \dt
            List of relations
 Schema |     Name     | Type  |  Owner   
--------+--------------+-------+----------
 public | aluno        | table | postgres
 public | clientes     | table | postgres
 public | correntista  | table | postgres
 public | funcionarios | table | postgres
 public | pedidos      | table | postgres
(5 rows)

aula1=# create sequence sid_usuarios;
CREATE SEQUENCE
aula1=# \ds
              List of relations
 Schema |     Name     |   Type   |  Owner   
--------+--------------+----------+----------
 public | sid_usuarios | sequence | postgres
(1 row)

aula1=# 
SELECT NEXTVAL('sid_usuarios');
 nextval 
---------
       1
(1 row)

aula1=# CREATE TABLE Usuarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100)
);
CREATE TABLE
aula1=# insert into usuarios
aula1-# values (nextval('sid_usuarios'), 'joao');
INSERT 0 1
aula1=# select * from aula1
aula1-# select * from aula1;
ERROR:  syntax error at or near "select"
LINHA 2: select * from aula1;
         ^
aula1=# select * from aula1;
ERROR:  relation "aula1" does not exist
LINHA 1: select * from aula1;
                       ^
aula1=# select * from aula1
aula1-# select * from aula1
aula1-# select * from aula1;
ERROR:  syntax error at or near "select"
LINHA 2: select * from aula1
         ^
aula1=# select * from usuarios;
 id | nome 
----+------
  2 | joao
(1 row)

aula1=# select nextval ('sid_usuarios');
 nextval 
---------
       3
(1 row)

aula1=# CREATE TABLE diarios (
    diarioID BIGSERIAL PRIMARY KEY                                                                
    descricao VARCHAR(100)
);
ERROR:  syntax error at or near "descricao"
LINHA 3:     descricao VARCHAR(100)
             ^
aula1=# CREATE TABLE diarios (
    diarioID BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(100)
);
CREATE TABLE
aula1=# \dt
            List of relations
 Schema |     Name     | Type  |  Owner   
--------+--------------+-------+----------
 public | aluno        | table | postgres
 public | clientes     | table | postgres
 public | correntista  | table | postgres
 public | diarios      | table | postgres
 public | funcionarios | table | postgres
 public | pedidos      | table | postgres
 public | usuarios     | table | postgres
(7 rows)

aula1=# \c diarios
a conexão com o servidor em "localhost" (127.0.0.1), porta 5432 falhou: FATAL:  database "diarios" does not exist
Previous connection kept
aula1=# \ds
                  List of relations
 Schema |         Name         |   Type   |  Owner   
--------+----------------------+----------+----------
 public | diarios_diarioid_seq | sequence | postgres
 public | sid_usuarios         | sequence | postgres
(2 rows)

aula1=# \d diarios
                                        Table "public.diarios"
  Column   |          Type          | Collation | Nullable |                  Default                  
-----------+------------------------+-----------+----------+-------------------------------------------
 diarioid  | bigint                 |           | not null | nextval('diarios_diarioid_seq'::regclass)
 descricao | character varying(100) |           |          | 
Indexes:
    "diarios_pkey" PRIMARY KEY, btree (diarioid)

aula1=# insert into diarios 
aula1-# values (default, 'Banco de Dados');
INSERT 0 1
aula1=# \dt
            List of relations
 Schema |     Name     | Type  |  Owner   
--------+--------------+-------+----------
 public | aluno        | table | postgres
 public | clientes     | table | postgres
 public | correntista  | table | postgres
 public | diarios      | table | postgres
 public | funcionarios | table | postgres
 public | pedidos      | table | postgres
 public | usuarios     | table | postgres
(7 rows)

aula1=# select * from diarios;
 diarioid |   descricao    
----------+----------------
        1 | Banco de Dados
(1 row)

aula1=# \ds
                  List of relations
 Schema |         Name         |   Type   |  Owner   
--------+----------------------+----------+----------
 public | diarios_diarioid_seq | sequence | postgres
 public | sid_usuarios         | sequence | postgres
(2 rows)

aula1=# \dt
            List of relations
 Schema |     Name     | Type  |  Owner   
--------+--------------+-------+----------
 public | aluno        | table | postgres
 public | clientes     | table | postgres
 public | correntista  | table | postgres
 public | diarios      | table | postgres
 public | funcionarios | table | postgres
 public | pedidos      | table | postgres
 public | usuarios     | table | postgres
(7 rows)

aula1=# select * from diarios;
 diarioid |   descricao    
----------+----------------
        1 | Banco de Dados
(1 row)

aula1=# insert into diarios 
aula1-# values (default, 'Estrutura de Dados') returning id;
ERROR:  column "id" does not exist
LINHA 2: values (default, 'Estrutura de Dados') returning id;
                                                          ^
aula1=# insert into diarios 
values (default, 'Estrutura de Dados') returning diarioid;
 diarioid 
----------
        2
(1 row)

INSERT 0 1
aula1=# select * from diarios
aula1-# select * from diarios;
ERROR:  syntax error at or near "select"
LINHA 2: select * from diarios;
         ^
aula1=# select * from diarios;
 diarioid |     descricao      
----------+--------------------
        1 | Banco de Dados
        2 | Estrutura de Dados
(2 rows)

aula1=# select curr

aula1=# select currval ('sid_usuarios');
 currval 
---------
       3
(1 row)

aula1=# drop sequence sid_usuarios 
aula1-# drop sequence sid_usa

aula1-# drop sequence sid_usuarios;
ERROR:  syntax error at or near "drop"
LINHA 2: drop sequence sid_usuarios;
         ^
aula1=# drop sequence sid_usuarios;
DROP SEQUENCE
aula1=# \ds
                  List of relations
 Schema |         Name         |   Type   |  Owner   
--------+----------------------+----------+----------
 public | diarios_diarioid_seq | sequence | postgres
(1 row)

aula1=# select * from usuarios;
 id | nome 
----+------
  2 | joao
(1 row)

aula1=# select * from diarios;
 diarioid |     descricao      
----------+--------------------
        1 | Banco de Dados
        2 | Estrutura de Dados
(2 rows)

aula1=# drop table diarios alter column diarioid drop default;
ERROR:  syntax error at or near "alter"
LINHA 1: drop table diarios alter column diarioid drop default;
                            ^
aula1=# alter table diarios ALTER COLUMN diarioID DROP DEFAULT;
ALTER TABLE
aula1=# drop sequence diarios_diarioid_seq; 
DROP SEQUENCE
aula1=# \ds
Did not find any relations.
aula1=# select * from diarios;
 diarioid |     descricao      
----------+--------------------
        1 | Banco de Dados
        2 | Estrutura de Dados
(2 rows)

aula1=# select * from usuarios;
 id | nome 
----+------
  2 | joao
(1 row)

aula1=# \ds
Did not find any relations.
aula1=# \dt
            List of relations
 Schema |     Name     | Type  |  Owner   
--------+--------------+-------+----------
 public | aluno        | table | postgres
 public | clientes     | table | postgres
 public | correntista  | table | postgres
 public | diarios      | table | postgres
 public | funcionarios | table | postgres
 public | pedidos      | table | postgres
 public | usuarios     | table | postgres
(7 rows)

aula1=# create table obra (id_obra bigseriay, codigo varchar(20) unique, descricao varchar(20), constraint pk_obra primary key (id_obra));
ERROR:  type "bigseriay" does not exist
LINHA 1: create table obra (id_obra bigseriay, codigo varchar(20) uni...
                                    ^
aula1=# create table obra (id_obra bigseriay, codigo varchar(20) unique, descricao varchar(20), constraint pk_obra primary key (id_obra));
ERROR:  type "bigseriay" does not exist
LINHA 1: create table obra (id_obra bigseriay, codigo varchar(20) uni...
                                    ^
aula1=# create table obra (id_obra bigseriay, codigo varchar(20) unique, descricao varchar(20), constraint pk_obra primary key (id_obra));
ERROR:  type "bigseriay" does not exist
LINHA 1: create table obra (id_obra bigseriay, codigo varchar(20) uni...
                                    ^
aula1=# create table obra (id_obra bigserial, codigo varchar(20) unique, descricao varchar(20), constraint pk_obra primary key (id_obra));
CREATE TABLE
aula1=# create table maquina (id_maquina bigserial, codigoMaquina varchar(20) unique, marca character varying(20), constraint pk_maquina primary key (id_maquina));
CREATE TABLE
aula1=# create table usa (id_usa bigserial, id_obra bigint, id_maquina bigint, data_do_uso date,
  
aula1=# create table usa (id_usa bigserial, id_obra bigint, id_maquina bigint, data_do_uso date,
aula1(# constraint pk_usa primary key (id_usa),
aula1(# constraint fk_obra foreign key (id_obra) references obra,
aula1(# constraint fk_maquina foreign key (id_maquina) references maquina;
aula1(# );
ERROR:  syntax error at or near ";"
LINHA 4: ...aint fk_maquina foreign key (id_maquina) references maquina;
                                                                       ^
aula1=# create table usa (id_usa bigserial, id_obra bigint, id_maquina bigint, data_do_uso date,
constraint pk_usa primary key (id_usa),
constraint fk_obra foreign key (id_obra) references obra,
constraint fk_maquina foreign key (id_maquina) references maquina
);
CREATE TABLE
aula1=# \ds
                   List of relations
 Schema |          Name          |   Type   |  Owner   
--------+------------------------+----------+----------
 public | maquina_id_maquina_seq | sequence | postgres
 public | obra_id_obra_seq       | sequence | postgres
 public | usa_id_usa_seq         | sequence | postgres
(3 rows)

aula1=# insert into maquina
aula1-# values (default, 'Computador');
INSERT 0 1
aula1=# insert into maquina
values (default, 'Impressora');
INSERT 0 1
aula1=# insert into obra 
aula1-# values (default, 'Obra1');
INSERT 0 1
aula1=# insert into obra 
values (default, 'Obra2');
INSERT 0 1
aula1=# \ds
                   List of relations
 Schema |          Name          |   Type   |  Owner   
--------+------------------------+----------+----------
 public | maquina_id_maquina_seq | sequence | postgres
 public | obra_id_obra_seq       | sequence | postgres
 public | usa_id_usa_seq         | sequence | postgres
(3 rows)

aula1=# select * from maquina;
 id_maquina | codigomaquina | marca 
------------+---------------+-------
          1 | Computador    | 
          2 | Impressora    | 
(2 rows)

aula1=# select * from obra;
 id_obra | codigo | descricao 
---------+--------+-----------
       1 | Obra1  | 
       2 | Obra2  | 
(2 rows)

aula1=# select * from us
usa             usa_id_usa_seq  usuarios        
aula1=# select * from us
usa             usa_id_usa_seq  usuarios        
aula1=# select * from usa;
 id_usa | id_obra | id_maquina | data_do_uso 
--------+---------+------------+-------------
(0 rows)

aula1=# insert into usa
aula1-# values (nextval('usa_id_usa_seq'),
aula1(# select id_obra from obra where codigo = 'o001',
aula1(# select id_maquina from maquina where codigo = 'm001',
aula1(# '23/07/2002');
ERROR:  syntax error at or near "select"
LINHA 3: select id_obra from obra where codigo = 'o001',
         ^
aula1=# insert into usa
values (nextval('usa_id_usa_seq'),
(select id_obra from obra where codigo = 'o001'),
(select id_maquina from maquina where codigo = 'm001'),
'23/07/2002');
ERROR:  column "codigo" does not exist
LINHA 4: (select id_maquina from maquina where codigo = 'm001'),
                                               ^
aula1=# insert into usa
values (nextval('usa_id_usa_seq'),
(select id_obra from obra where codigo = 'o001'),
(select id_maquina from maquina where codigo = 'm001'),
'23/07/2002');
ERROR:  column "codigo" does not exist
LINHA 4: (select id_maquina from maquina where codigo = 'm001'),
                                               ^
aula1=# insert into usa
values (nextval('usa_id_usa_seq'),
(select id_obra from obra where codigo = 'Obra1'),
(select id_maquina from maquina where codigo = 'Computador'),
'23/07/2002');
ERROR:  column "codigo" does not exist
LINHA 4: (select id_maquina from maquina where codigo = 'Computador')...
                                               ^
aula1=# insert into usa
values (nextval('usa_id_usa_seq'),
(select id_obra from obra where codigo = 'Obra1'),
(select id_maquina from maquina where codigo = 'computador'),
'23/07/2002');
ERROR:  column "codigo" does not exist
LINHA 4: (select id_maquina from maquina where codigo = 'computador')...
                                               ^
aula1=# insert into usa
values (nextval('usa_id_usa_seq'),
(select id_obra from obra where codigo = 'Obra1'),
(select id_maquina from maquina where codigomaquina = 'Computador'),
'23/07/2002');
INSERT 0 1
aula1=# insert into usa
values (nextval('usa_id_usa_seq'),
(select id_obra from obra where codigo = 'Obra1'),
(select id_maquina from maquina where codigomaquina = 'Impressora'),
'23/07/2002');
INSERT 0 1
aula1=# insert into usa
values (nextval('usa_id_usa_seq'),
(select id_obra from obra where codigo = 'Obra2'),
(select id_maquina from maquina where codigomaquina = 'Computador'),
'23/07/2002');
INSERT 0 1
aula1=# insert into usa
values (nextval('usa_id_usa_seq'),
(select id_obra from obra where codigo = 'Obra2'),
(select id_maquina from maquina where codigomaquina = 'Impressora'),
'23/07/2002');
INSERT 0 1
aula1=# select * from obra;
 id_obra | codigo | descricao 
---------+--------+-----------
       1 | Obra1  | 
       2 | Obra2  | 
(2 rows)

aula1=# select * from maquina
aula1-# ;
 id_maquina | codigomaquina | marca 
------------+---------------+-------
          1 | Computador    | 
          2 | Impressora    | 
(2 rows)

aula1=# \dt
            List of relations
 Schema |     Name     | Type  |  Owner   
--------+--------------+-------+----------
 public | aluno        | table | postgres
 public | clientes     | table | postgres
 public | correntista  | table | postgres
 public | diarios      | table | postgres
 public | funcionarios | table | postgres
 public | maquina      | table | postgres
 public | obra         | table | postgres
 public | pedidos      | table | postgres
 public | usa          | table | postgres
 public | usuarios     | table | postgres
(10 rows)

aula1=# \ds
                   List of relations
 Schema |          Name          |   Type   |  Owner   
--------+------------------------+----------+----------
 public | maquina_id_maquina_seq | sequence | postgres
 public | obra_id_obra_seq       | sequence | postgres
 public | usa_id_usa_seq         | sequence | postgres
(3 rows)

aula1=# select * from maquina
aula1-# ;
 id_maquina | codigomaquina | marca 
------------+---------------+-------
          1 | Computador    | 
          2 | Impressora    | 
(2 rows)

aula1=# select * from obra;
 id_obra | codigo | descricao 
---------+--------+-----------
       1 | Obra1  | 
       2 | Obra2  | 
(2 rows)

aula1=# select * from usa;
 id_usa | id_obra | id_maquina | data_do_uso 
--------+---------+------------+-------------
      1 |       1 |          1 | 2002-07-23
      2 |       1 |          2 | 2002-07-23
      3 |       2 |          1 | 2002-07-23
      4 |       2 |          2 | 2002-07-23
(4 rows)
