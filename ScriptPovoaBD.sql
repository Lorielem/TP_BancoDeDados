insert into locadora.pessoa
/*CPf, nome, telefone, sexo*/
value ('123', 'ana', '77778888', 'F'),
 ('1234567890', 'dana', '11118888', 'F'),
 ('1534567890', 'detana', '33338888', 'M'),
 ('1734567890', 'brana', '5555888', 'M'),
 ('2234567890', 'teana', '88888888', 'F');

select * from pessoa;


insert into locadora.funcionario 
/*salario, cargo */

values ('123.00', 'Gerente' ),
('23.00', 'vendedor' ),
('128.00', 'Gerente' ),
('13.00', 'vendedor' ),
('193.00', 'vendedor' );

select *from funcionario;

insert into locadora.cliente
		/*saldo, desconto */
values 	('10', '0.0'),
		('10', '0.0'),
		('10', '0.0'),
		('10', '0.0'),
		('10', '0.0');
select *from cliente;


insert into locadora.middia
/* contador, issn, titulo, classificacao, categoria, duracao, quantidade, real, locado*/
values('1','1', 'notebook','novo', '1', '1', '1', '1.0', 'sim'),
('2','1','tablet', 'novo', '2', '1', '1', '1.0', 'sim'),
('3', '1', 'notebook', 'meia vida', '3', '1', '1', '1.0', 'nao'),
('4', '1', 'tablet', 'meia vida', '4','1', '1', '1.0', 'nao'),
('5', '1', 'notebook', 'meia vida', '3', '1', '1', '1.0', 'nao');

select *from midia; 


insert into locadora.data
/*dia, mes, ano*/
value ('12', '1 mes', '2020'),
 ('02', '2 meses', '2021'),
 ('03', '6 meses', '2020'),
 ('01', '1 mes', '2321'),
 ('07', '1 mes', '2019');

select * from localori;

insert into locadora.endereco
/*numero, rua, complemento, bairro, cidade, cep, estado*/
value ('21', 'casa', 'teresopolis', 'JM', '35931000', 'MG'),
('271', 'casa', 'teresopolis', 'JM', '35931000', 'MG'),
('251', 'casa', 'teresopolis', 'JM', '35931000', 'MG'),
('571', 'casa', 'teresopolis', 'JM', '35931000', 'MG'),
('25', 'casa', 'teresopolis', 'JM', '35931000', 'MG');

select * from endereco;






