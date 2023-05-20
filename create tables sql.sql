CREATE TABLE 
    Marcas
	(
	 Codigo int identity (1,1),
	 Nome varchar (100),
	 Descricao ntext,
	 CONSTRAINT PK_Marcas PRIMARY KEY (Codigo)
	)

CREATE TABLE
   Produtos
   (
    Codigo int identity (1,1),
	Nome varchar (50),
	Descricao varchar (255),
	Codigo_Marcas int,
	CONSTRAINT PK_Produtos PRIMARY KEY (Codigo),
	CONSTRAINT FK_Produtos_Marcas FOREIGN KEY (Codigo_Marcas)
	    REFERENCES Marcas (Codigo)
   )

CREATE TABLE
 Clientes
 (
  Codigo int identity (1,1) not null,
  CPF char (11) not null,
  Nome varchar (40),
  Email varchar (40),
  Telefone char (11),
  Celular char (11),
  Cep char (8),
  lagadouro varchar (40),
  Estado char (2),
  Cidade varchar (35),
  CONSTRAINT PK_CodigoCliente PRIMARY KEY (Codigo)
 )

CREATE TABLE
Fidelidade
(
 Codigo_Cliente int,
 Data_Adesao DATETIME not null,
 Pontos int,
 CONSTRAINT PK_CodigoClienteFidelidade PRIMARY KEY (Codigo_Cliente),
 CONSTRAINT FK_CodigoCliente_Fidelidade FOREIGN KEY (Codigo_Cliente) REFERENCES Clientes(Codigo)
)

CREATE TABLE
Forma_Pagamento
(
 Codigo int identity (1,1) not null,
 Nome varchar (25),
 Tipo varchar (25),
 CONSTRAINT PK_CodigoPagamento PRIMARY KEY (Codigo)
)

CREATE TABLE
Pedido_Venda
(
 Codigo int identity (1,1) not null,
 Valor DECIMAL (6,2),
 Valor_Imposto DECIMAL (6,2),
 data DATETIME not null,
 Codigo_Forma_Pagamento int not null,
 Codigo_Cliente int not null,
 CONSTRAINT PK_CodigoVenda PRIMARY KEY (Codigo),
 CONSTRAINT FK_CodigoFormaPagamento FOREIGN KEY (Codigo_Forma_Pagamento) REFERENCES Forma_Pagamento (Codigo),
 CONSTRAINT FK_CodigoCliente FOREIGN KEY (codigo_Cliente ) REFERENCES Clientes (Codigo)
)

CREATE TABLE Item_Pedido_Venda
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor_Total DECIMAL(6,2),
	Valor_Imposto DECIMAL(6,2),
	Valor_Unitario DECIMAL(6,2),
	Quantidade int,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Venda INT NOT NULL,
	CONSTRAINT PK_CodigoPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProdutoVenda FOREIGN KEY (Codigo_Produto) REFERENCES Produtos(Codigo),
	CONSTRAINT FK_CodigoVenda FOREIGN KEY (Codigo_Pedido_Venda) REFERENCES Pedido_Venda(Codigo)
)


CREATE TABLE Distribuidor 
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	CNPJ VARCHAR(14) NOT NULL,
	Nome_Fantasia VARCHAR(40) NOT NULL,
	Razao_Social VARCHAR(40) NOT NULL,
	CEP NCHAR(8),
	LogRadouro VARCHAR(40),
	Estado CHAR(2),
	Cidade VARCHAR(35),
	CONSTRAINT PK_CodigoDistribuidor PRIMARY KEY (Codigo)
)


CREATE TABLE Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Data DATETIME NOT NULL,
	Valor DECIMAL(6,2),
	Entregue BIT,
	Codigo_Distribuidor INT NOT NULL,
	CONSTRAINT PK_CodigoPedido_Compra PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoDistribuidor FOREIGN KEY (Codigo_Distribuidor) REFERENCES Distribuidor(Codigo)
)


CREATE TABLE Item_Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	ValorTotal DECIMAL(6,2),
	ValorUnitario DECIMAL(6,2),
	Quantidade int,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Compra INT NOT NULL,
	CONSTRAINT PK_CodigoItemPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProdutoCompra FOREIGN KEY (Codigo_Produto) REFERENCES Produtos(Codigo),
	CONSTRAINT FK_CodigoPedidoCompraItem FOREIGN KEY (Codigo_Pedido_Compra) REFERENCES Pedido_Compra(Codigo),
)

