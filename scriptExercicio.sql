create database DB_CDS; /* criação do banco de dados */
use DB_CDS;/*coded by gugz3ra*/
/*--------------criando tabela artistas-------------*/
create table tb_artistas (
	id_Art int auto_increment not null ,
    Nome_Art varchar(100) not null unique key,
   /* dtcadastro timestamp not null default current_timestamp(), /* date */
    constraint Pk_id_Art primary key (id_Art)
       )
    Engine = InnoDB; /* tipo de processamento no banco */
/*--------------criando tabela gravadora-------------*/     
/* definição de chave primária  e estrangeira */
    create table tb_gravadora(
		id_gravadora int auto_increment not null,
        Nome_Gravadora varchar(50) not null unique key,      
        constraint PK_id_gravadora primary key (id_gravadora)
        /*constraint FK_funcionario_pessoa foreign key (idpessoa)
			references tb_pessoas (idpessoa)*/
        );        
        /*insert into tb_pessoas values (null, 'joao','2002-02-02');*/
        select * from tb_gravadora;
  /*--------------criando tabela categorias-------------*/      
	create table tb_categoria (
	id_Cat int auto_increment not null ,
    Nome_Cat varchar(50) not null unique key,
    constraint Pk_id_Car primary key (id_Cat)
       );
    
    /*--------------criando tabela estado-------------*/
    
    create table tb_estado (
	uf_Estado char(2)  not null ,
    Nome_Est char(50) not null unique key,
    constraint Pk_uf_Estado primary key (uf_Estado)
       );
	
        /*--------------criando tabela cidade-------------*/

	create table tb_cidade (
	id_Cidade int auto_increment not null ,
    uf_Estado char(2)  not null,
    Nome_Cat varchar(50) not null,
    constraint Pk_id_Cidade primary key (id_Cidade),
    constraint FK_uf_Estado foreign key (uf_Estado)
			references tb_estado (uf_Estado)
       ); 
       
	describe tb_cidade;
    
    /*--------------criando tabela cidade-------------*/
    
    	CREATE TABLE tb_cliente (
    id_Cliente INT AUTO_INCREMENT NOT NULL,
    id_Cidade int NOT NULL,
    Nome_Cliente VARCHAR(100) NOT NULL,
    end_Cliente VARCHAR(200) NOT NULL,
    renda_Cliente DECIMAL(10 , 2 ) NOT NULL,
    genero_cliente ENUM('F', 'M') NOT NULL,
    CONSTRAINT Pk_id_Cliente PRIMARY KEY (id_Cliente),
    CONSTRAINT FK_id_Cidade FOREIGN KEY (id_Cidade)
        REFERENCES tb_cidade (id_Cidade)
); 

select * from tb_cliente;


       
    	/*--------------criando tabela conjuege-------------*/
        
	CREATE TABLE tb_conjuge (
    id_Conjuge INT AUTO_INCREMENT NOT NULL,
    id_Cliente INT NOT NULL,
    Nome_Conjuge VARCHAR(100) NOT NULL,
    renda_Conjuge DECIMAL(10 , 2 ) NOT NULL,
    genero_conjuege ENUM('F', 'M') NOT NULL,
    CONSTRAINT Pk_id_Cidade PRIMARY KEY (id_Conjuge),
    CONSTRAINT FK_id_Cliente FOREIGN KEY (id_Cliente)
        REFERENCES tb_cliente (id_Cliente)
); 
select * from tb_conjuge;

    
	/*--------------criando tabela funcionario-------------*/
    
     create table tb_funcionario(
		id_funcionario int auto_increment not null,
        nome_funcionario varchar(100) not null,
        end_funcionario varchar(200) not null,
        salario_funcionario decimal(10,2),
        genero_funcionario ENUM('F', 'M') NOT NULL,
        constraint PK_id_funcionario primary key (id_funcionario)
        );
        
       	/*--------------criando tabela dependente------------*/

		CREATE TABLE tb_dependente (
			id_dependente INT AUTO_INCREMENT NOT NULL,
			id_funcionario INT NULL,
			Nome_dependente VARCHAR(100) NOT NULL,
			genero_dependente ENUM('F', 'M') NOT NULL,
			CONSTRAINT Pk_id_dependente PRIMARY KEY (id_dependente),
			CONSTRAINT FK_id_funcionario FOREIGN KEY (id_funcionario)
				REFERENCES tb_funcionario (id_funcionario)
		);
        
       	/*--------------criando tabela titulo-------------*/
        
        CREATE TABLE tb_titulo (
			id_titulo INT AUTO_INCREMENT NOT NULL,
			id_Cat INT NOT NULL,
			id_gravadora INT NOT NULL,
			Nome_CD VARCHAR(100) NOT NULL unique,
			val_CD decimal(10,2) not null,
			qnrd_estoque int not null,
			CONSTRAINT Pk_id_titulo PRIMARY KEY (id_titulo),
			CONSTRAINT FK_id_Cat_titulo FOREIGN KEY (id_Cat)
				REFERENCES tb_categoria (id_Cat),
			CONSTRAINT FK_id_gravadora_titulo FOREIGN KEY (id_gravadora)
				REFERENCES tb_gravadora (id_gravadora)
		);
	
    /*--------------criando tabela titulo-------------*/
    
    CREATE TABLE tb_pedido (
			id_pedido INT AUTO_INCREMENT NOT NULL,
			id_Cliente INT  NULL,
			id_funcionario INT  NOT NULL,
			Nome_CD VARCHAR(100) NOT NULL unique,
			val_CD decimal(10,2) not null,
			qnrd_estoque int not null,
			CONSTRAINT Pk_id_pedido PRIMARY KEY (id_pedido),
			CONSTRAINT FK_id_Cliente_pedido FOREIGN KEY (id_Cliente)
				REFERENCES tb_Cliente (id_Cliente),
			CONSTRAINT FK_id_funcionario_pedido FOREIGN KEY (id_funcionario)
				REFERENCES tb_funcionario (id_funcionario)
		);
        select *from tb_pedido;
        
/*--------------------criando tabela titulo pedido------------*/

   CREATE TABLE tb_titulo_pedido (
			id_titulo_pedido INT AUTO_INCREMENT NOT NULL,
			id_pedido int not null,
			id_titulo int not null,
			Qtd_Cd int not null,
			Valor_Cd decimal(10, 2) not null,
			constraint pk_Titulo primary key (id_titulo_pedido),
			constraint fk_id_pedpedido foreign key (id_pedido) references tb_pedido(id_pedido),
			constraint fk_id_Codtit_pedido foreign key (id_titulo) references tb_titulo(id_titulo)
		);
/*--------------------criando tabela titulo artista------------*/

create table tb_titulo_artista(
	id_titulo_artista int auto_increment  not null ,
    Cod_Art int not null,
    constraint pk_Codtit primary key (id_titulo_artista),
    constraint fk_Cod_Art foreign key (Cod_Art) references tb_artistas(id_Art)
);

