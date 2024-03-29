create database DB_BIBLIOTECA;
use DB_BIBLIOTECA;

create table TB_ASSUNTO
(
CD_ASSUNTO INT PRIMARY KEY AUTO_INCREMENT,
DS_ASSUNTO VARCHAR (64)
);

create table TB_GENERO
(
CD_GENERO INT PRIMARY KEY AUTO_INCREMENT,
NM_GENERO VARCHAR (50)
);

create table TB_AUTOR
(
CD_AUTOR INT PRIMARY KEY AUTO_INCREMENT,
NM_AUTOR VARCHAR (50),
NM_PSEUDONIMO VARCHAR (50)
);

create table TB_PUBLI
(
CD_PUBLI INT PRIMARY KEY AUTO_INCREMENT,
NM_PUBLI VARCHAR (50),
DT_PUBLI date,
ID_GENERO INT,
constraint FK_GENERO_PUBLI FOREIGN KEY (ID_GENERO) references TB_GENERO(CD_GENERO)
);

create table TB_PUBLI_ASSUNTO
(
ID_PUBLI INT,
ID_ASSUNTO INT,
constraint FK_TB_ASSUNTO_PUBLI foreign key (ID_ASSUNTO) references TB_ASSUNTO(CD_ASSUNTO),
constraint FK_TB_PUBLI_PUBLI foreign key (ID_PUBLI) references TB_PUBLI(CD_PUBLI)
);

create table TB_PUBLI_AUTOR
(
ID_PUBLI INT,
ID_AUTOR INT,
constraint FK_TB_AUTOR_PUBLI foreign key (ID_AUTOR) references TB_AUTOR(CD_AUTOR),
constraint FK_TB_PUBLI_AUTOR foreign key (ID_PUBLI) references TB_PUBLI(CD_PUBLI)
);

create table TB_PRATELEIRA
(
CD_PRATELEIRA INT PRIMARY KEY AUTO_INCREMENT,
ID_GENERO INT,
constraint FK_GENERO_PRAT foreign key(ID_GENERO) references TB_GENERO(CD_GENERO)
);

create table TB_UNIDADE
(
CD_UNIDADE INT PRIMARY KEY AUTO_INCREMENT,
NM_UNIDADE VARCHAR (60),
NM_ENDERECO VARCHAR (60),
NU_ENDERECO VARCHAR (60),
NU_CNPJ INT,
NU_TELEFONE INT
);

create table TB_COLABORADOR	 
(
CD_COLAB INT primary key AUTO_INCREMENT,
NM_COLAB VARCHAR (65),
NM_ENDERECO VARCHAR (65),
NU_ENDERECO INT,
NU_TELEFONE INT,
NU_CPF char(11),
ID_UNIDADE INT,
constraint FK_UNIDADE_COLAB foreign key  (ID_UNIDADE) references TB_UNIDADE(CD_UNIDADE)
);

create table TB_RESERVA
(
CD_RESERVA INT PRIMARY KEY AUTO_INCREMENT,
DT_RESERVA DATE,
BL_ATIVA boolean,
ID_COLABORADOR INT,
ID_PUBLI INT,
constraint FK_COLAB_RESERVA FOREIGN KEY (ID_COLABORADOR) references TB_COLABORADOR(CD_COLAB),
constraint FK_PUBLI_RESERVA FOREIGN KEY (ID_PUBLI) references TB_PUBLI (CD_PUBLI)
);

create table TB_EXEMPLAR
(
CD_EXEMPLAR INT PRIMARY KEY AUTO_INCREMENT,
ID_PUBLI INT,
constraint FK_PUBLI_EXEMPLAR foreign key (ID_PUBLI) references TB_PUBLI (CD_PUBLI)
);

create table TB_EMPRESTIMO
(
CD_EMPRESTIMO INT PRIMARY KEY AUTO_INCREMENT,
DT_EMPRESTIMO DATE,
DT_DEVOLUCAO DATE,
DT_LIMITE DATE,
VL_MULTA DECIMAL (2,2),
ID_COLAB INT,
ID_UNIDADE INT,
ID_EXEMPLAR INT,
constraint FK_COLAB_EMPREST FOREIGN KEY (ID_COLAB) references TB_COLABORADOR(CD_COLAB),
constraint FK_EXEMPLAR_EMPREST FOREIGN KEY (ID_EXEMPLAR) references TB_EXEMPLAR (CD_EXEMPLAR)
);

