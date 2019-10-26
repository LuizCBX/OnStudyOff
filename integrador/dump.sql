create database db_ead;
use db_ead;

CREATE TABLE tb_usuario(
  id_usuario INT NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(200) NOT NULL,
  senha VARCHAR(32) NOT NULL,
  PRIMARY KEY (id_usuario));
  
INSERT INTO tb_usuario (usuario, senha) VALUES ('111','admin');
INSERT INTO tb_usuario (usuario, senha) VALUES ('123','admin');
select * from tb_usuario;

select us.usuario, al.nome from tb_usuario us inner join tb_aluno al on us.id_usuario=al.ra where usuario = '12345';
create table tb_aluno(
	ra int auto_increment primary key,
    nome varchar(100) not null,
    cpf varchar(15) not null,
    dt_nasc varchar (20) not null,
    id_usuario int not null unique,
    id_end int not null,
    id_contato int not null,
    id_curso int not null,
    constraint fk_usuario_pk_ra foreign key (id_usuario) references tb_usuario(id_usuario),
	constraint fk_end_pk_ra foreign key (id_end) references tb_endereco(id_end),
    constraint fk_ct_pk_ra foreign key (id_contato) references tb_contato(id_contato),
	constraint fk_curso_pk_ra foreign key (id_curso) references tb_curso(id_curso)
);
INSERT INTO tb_aluno (nome, cpf, dt_nasc, id_usuario, id_end, id_contato) VALUES ('Carioca','55555555', '11/12/2000', 2);
INSERT INTO tb_aluno (nome, cpf, dt_nasc, id_usuario, id_end, id_contato, id_curso) VALUES ('Carioca','5555555', '11/12/1998', 3, 1, 1, 1);
select * from tb_aluno;

    
create table tb_endereco(
	id_end int auto_increment primary key,
    logradouro varchar(40),
    numero int,
    complemento varchar(40),
    bairro varchar(50),
    cep varchar(15),
    cidade varchar(50),
    estado varchar(50)
);
INSERT INTO tb_endereco (logradouro, numero, complemento, bairro, cep, cidade, estado) 
VALUES ('Rua Jose',666, 'apt 23', 'Alphaville', '0812126', 'São Paulo', 'SP');
select * from tb_endereco;


create table tb_contato(
	id_contato int auto_increment primary key,
    email varchar(50),
    celular varchar(30)
);
INSERT INTO tb_contato (email, celular) 
VALUES ('luiz@bol.com', '(11)98582825');


create table tb_curso(
	id_curso int auto_increment,
    nome varchar(70) not null,
    descricao varchar(200),
    id_nota int not null,
    PRIMARY KEY(id_curso)
);
ALTER TABLE tb_curso ADD id_nota int not null;
ALTER TABLE tb_curso
ADD CONSTRAINT fk_nota_pk_curso
FOREIGN KEY (id_nota) REFERENCES tb_curso(id_nota);

INSERT INTO tb_curso(nome, descricao, id_nota) 
VALUES('Informática', 'Manutenção desktops', 1);
select * from tb_curso;

create table tb_nota(
	id_nota int auto_increment,
    bimestre_1 decimal (5,2), 
    bimestre_2 decimal (5,2),
    bimestre_3 decimal (5,2),
    bimestre_4 decimal (5,2),
    PRIMARY KEY(id_nota)
);
INSERT INTO tb_nota(bimestre_1, bimestre_2, bimestre_3, bimestre_4) 
VALUES(10, 9.0, 8.0, 7.0);
select * from tb_nota;




-- Estrutura da tabela `events`

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(220) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
select * from events;
--
-- Extraindo dados da tabela `events`
--

INSERT INTO `events` (`id`, `title`, `color`, `start`, `end`) VALUES
(1, 'Tutorial PagSeguro', '#FFD700', '2019-05-21 15:00:00', '2019-05-21 16:00:00'),
(2, 'Tutorial FullCalendar editar detalhes do evento', '#0071c5', '2019-05-30 15:00:00', '2019-05-30 00:00:00'),
(3, 'Tutorial FullCalendar Visualizar detalhes do evento', '#0071c5', '2019-05-23 15:00:00', '2019-05-23 16:00:00'),
(4, 'Reuniao 3', '#40e0d0', '2019-05-17 17:00:00', '2019-05-17 18:00:00'),
(5, 'Reuniao 4', '#0071c5', '2019-05-17 15:00:00', '2019-05-17 16:00:00'),
(6, 'Reuniao 5', '#FFD700', '2019-05-17 13:00:00', '2019-05-17 14:00:00'),
(7, 'Reuniao 6', '#0071c5', '2019-05-17 11:00:00', '2019-05-17 12:00:00'),
(8, 'Reuniao 7', '#40e0d0', '2019-05-17 09:00:00', '2019-05-17 10:00:00'),
(9, 'Tutorial', '#228B22', '2019-09-12 00:00:00', '2019-09-13 00:00:00'),
(10, 'Tutorial 2', '#FF4500', '2019-09-13 15:10:10', '2019-09-13 17:15:15');
COMMIT;
