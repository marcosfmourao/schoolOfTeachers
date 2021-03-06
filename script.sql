USE [master]
GO
/****** Object:  Database [School_Of_Teachers]    Script Date: 3/3/2017 6:54:55 AM ******/
CREATE DATABASE [School_Of_Teachers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School_Of_Teachers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\School_Of_Teachers.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'School_Of_Teachers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\School_Of_Teachers_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [School_Of_Teachers] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School_Of_Teachers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School_Of_Teachers] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET ARITHABORT OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School_Of_Teachers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School_Of_Teachers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET  DISABLE_BROKER 
GO
ALTER DATABASE [School_Of_Teachers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School_Of_Teachers] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [School_Of_Teachers] SET  MULTI_USER 
GO
ALTER DATABASE [School_Of_Teachers] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School_Of_Teachers] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School_Of_Teachers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School_Of_Teachers] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [School_Of_Teachers] SET DELAYED_DURABILITY = DISABLED 
GO
USE [School_Of_Teachers]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[cod_Admin] [int] IDENTITY(1,1) NOT NULL,
	[codFuncionario] [int] NOT NULL,
	[dados_Complementares] [varchar](100) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[cod_Admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Aula]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aula](
	[cod_Aula] [int] IDENTITY(1,1) NOT NULL,
	[data_Aula] [date] NOT NULL,
	[codCurso] [int] NULL,
	[codInstrutor] [int] NULL,
 CONSTRAINT [PK_Aula] PRIMARY KEY CLUSTERED 
(
	[cod_Aula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Avaliacao]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avaliacao](
	[cod_Avaliacao] [int] IDENTITY(1,1) NOT NULL,
	[data_Avaliacao] [date] NULL,
	[codCurso] [int] NULL,
	[codInstrutor] [int] NOT NULL,
	[matriculaCliente] [int] NOT NULL,
 CONSTRAINT [PK_Avaliacao] PRIMARY KEY CLUSTERED 
(
	[cod_Avaliacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[matricula] [int] IDENTITY(1,1) NOT NULL,
	[dadosComplementares] [varchar](200) NULL,
	[cfp_Cliente] [varchar](14) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Curso](
	[cod_Curso] [int] IDENTITY(1,1) NOT NULL,
	[nome_Curso] [varchar](50) NULL,
	[data_Inicio] [date] NULL,
	[data_Termino] [date] NULL,
	[codInstrutor] [int] NULL,
	[codAvaliacao] [int] NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[cod_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CursoAvaliacao]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CursoAvaliacao](
	[codCurso] [int] NOT NULL,
	[codAvaliacao] [int] NOT NULL,
	[observacao] [varchar](100) NULL,
 CONSTRAINT [PK_CursoAvaliacao] PRIMARY KEY CLUSTERED 
(
	[codCurso] ASC,
	[codAvaliacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CursoCliente]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoCliente](
	[matriculaCliente] [int] NOT NULL,
	[codCurso] [int] NOT NULL,
 CONSTRAINT [PK_CursoCliente] PRIMARY KEY CLUSTERED 
(
	[matriculaCliente] ASC,
	[codCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Endereco](
	[cod_Endereco] [int] IDENTITY(1,1) NOT NULL,
	[cep] [int] NOT NULL,
	[rua] [varchar](20) NOT NULL,
	[bairro] [varchar](50) NOT NULL,
	[numero] [int] NULL,
	[quadra] [varchar](20) NOT NULL,
	[lote] [int] NOT NULL,
	[complemento] [varchar](50) NULL,
	[cidade] [varchar](50) NOT NULL DEFAULT ('palmas'),
	[estado] [varchar](30) NOT NULL DEFAULT ('Tocantins'),
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[cod_Endereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Especializaccao]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Especializaccao](
	[codigo] [int] NOT NULL,
	[especializacao] [varchar](20) NULL,
 CONSTRAINT [PK_Especializaccao] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Funcionario](
	[cod_Funcionario] [int] IDENTITY(1,1) NOT NULL,
	[cod_Endereco] [nchar](10) NOT NULL,
	[salario_Funcionario] [money] NOT NULL,
	[cfp] [varchar](14) NOT NULL,
 CONSTRAINT [PK_Funcionario] PRIMARY KEY CLUSTERED 
(
	[cod_Funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Instrutor]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instrutor](
	[cod_Instrutor] [int] IDENTITY(1,1) NOT NULL,
	[codFuncionario] [int] NOT NULL,
	[especializaccao] [int] NULL,
 CONSTRAINT [PK_Instrutor] PRIMARY KEY CLUSTERED 
(
	[cod_Instrutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Material]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Material](
	[cod_Material] [int] IDENTITY(1,1) NOT NULL,
	[nome_Material] [varchar](50) NULL,
	[codCurso] [int] NULL,
	[quantidade_Material] [int] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[cod_Material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nota]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[codNota] [int] IDENTITY(1,1) NOT NULL,
	[matriculaCliente] [int] NULL,
	[codAvaliacao] [int] NULL,
	[notaAvalicao] [decimal](2, 1) NOT NULL,
 CONSTRAINT [PK_Nota] PRIMARY KEY CLUSTERED 
(
	[codNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pessoa](
	[nome] [varchar](50) NULL,
	[nascimento] [date] NULL,
	[cpf] [varchar](14) NOT NULL,
	[email] [varchar](50) NULL,
	[sexo] [char](1) NULL,
	[contato] [nchar](15) NULL,
	[contato2] [nchar](15) NULL,
	[codEndereco] [int] NULL,
	[idPessoa] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Pessoa] PRIMARY KEY CLUSTERED 
(
	[cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[MostrarCursosDosClientes]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[MostrarCursosDosClientes]
	(nome, matricula, nome_Curso, data_Inicio)
AS
	SELECT
	nome, matricula, nome_Curso, data_Inicio
	FROM
	Pessoa p inner join Cliente c 
	on (p.cpf = c.cfp_Cliente)
	inner join CursoCliente cc
	on(c.matricula = cc.matriculaCliente) 	
	inner join Curso cur 
	on (cur.cod_Curso = cc.codCurso)

GO
/****** Object:  View [dbo].[MostrarTodosClientes]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MostrarTodosClientes]
	(nome, cpf, matricula, cidade,estado)
AS
	SELECT
	 nome, cpf, matricula, cidade, estado
	from
	 Cliente c INNER JOIN Pessoa p 
	 on  c.cfp_cliente = p.cpf
	 INNER JOIN Endereco e
	 on p.codEndereco = e.cod_Endereco

GO
ALTER TABLE [dbo].[Admin]  WITH NOCHECK ADD  CONSTRAINT [FK_Admin_Funcionario] FOREIGN KEY([codFuncionario])
REFERENCES [dbo].[Funcionario] ([cod_Funcionario])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Funcionario]
GO
ALTER TABLE [dbo].[Aula]  WITH NOCHECK ADD  CONSTRAINT [FK_Aula_Curso] FOREIGN KEY([codCurso])
REFERENCES [dbo].[Curso] ([cod_Curso])
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [FK_Aula_Curso]
GO
ALTER TABLE [dbo].[Aula]  WITH NOCHECK ADD  CONSTRAINT [FK_Aula_Instrutor] FOREIGN KEY([codInstrutor])
REFERENCES [dbo].[Instrutor] ([cod_Instrutor])
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [FK_Aula_Instrutor]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH NOCHECK ADD  CONSTRAINT [FK_Avaliacao_Cliente] FOREIGN KEY([matriculaCliente])
REFERENCES [dbo].[Cliente] ([matricula])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Cliente]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH NOCHECK ADD  CONSTRAINT [FK_Avaliacao_Curso] FOREIGN KEY([codCurso])
REFERENCES [dbo].[Curso] ([cod_Curso])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Curso]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH NOCHECK ADD  CONSTRAINT [FK_Avaliacao_Instrutor] FOREIGN KEY([codInstrutor])
REFERENCES [dbo].[Instrutor] ([cod_Instrutor])
GO
ALTER TABLE [dbo].[Avaliacao] CHECK CONSTRAINT [FK_Avaliacao_Instrutor]
GO
ALTER TABLE [dbo].[Cliente]  WITH NOCHECK ADD  CONSTRAINT [FK_Cliente_Pessoa] FOREIGN KEY([cfp_Cliente])
REFERENCES [dbo].[Pessoa] ([cpf])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Pessoa]
GO
ALTER TABLE [dbo].[CursoAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_CursoAvaliacao_Avaliacao] FOREIGN KEY([codAvaliacao])
REFERENCES [dbo].[Avaliacao] ([cod_Avaliacao])
GO
ALTER TABLE [dbo].[CursoAvaliacao] CHECK CONSTRAINT [FK_CursoAvaliacao_Avaliacao]
GO
ALTER TABLE [dbo].[CursoAvaliacao]  WITH CHECK ADD  CONSTRAINT [FK_CursoAvaliacao_Curso] FOREIGN KEY([codCurso])
REFERENCES [dbo].[Curso] ([cod_Curso])
GO
ALTER TABLE [dbo].[CursoAvaliacao] CHECK CONSTRAINT [FK_CursoAvaliacao_Curso]
GO
ALTER TABLE [dbo].[CursoCliente]  WITH NOCHECK ADD  CONSTRAINT [FK_CursoCliente_Cliente] FOREIGN KEY([matriculaCliente])
REFERENCES [dbo].[Cliente] ([matricula])
GO
ALTER TABLE [dbo].[CursoCliente] CHECK CONSTRAINT [FK_CursoCliente_Cliente]
GO
ALTER TABLE [dbo].[CursoCliente]  WITH NOCHECK ADD  CONSTRAINT [FK_CursoCliente_Curso] FOREIGN KEY([codCurso])
REFERENCES [dbo].[Curso] ([cod_Curso])
GO
ALTER TABLE [dbo].[CursoCliente] CHECK CONSTRAINT [FK_CursoCliente_Curso]
GO
ALTER TABLE [dbo].[Funcionario]  WITH NOCHECK ADD  CONSTRAINT [FK_Funcionario_Pessoa] FOREIGN KEY([cfp])
REFERENCES [dbo].[Pessoa] ([cpf])
GO
ALTER TABLE [dbo].[Funcionario] CHECK CONSTRAINT [FK_Funcionario_Pessoa]
GO
ALTER TABLE [dbo].[Instrutor]  WITH CHECK ADD  CONSTRAINT [FK_Instrutor_Especializaccao] FOREIGN KEY([especializaccao])
REFERENCES [dbo].[Especializaccao] ([codigo])
GO
ALTER TABLE [dbo].[Instrutor] CHECK CONSTRAINT [FK_Instrutor_Especializaccao]
GO
ALTER TABLE [dbo].[Instrutor]  WITH NOCHECK ADD  CONSTRAINT [FK_Instrutor_Funcionario] FOREIGN KEY([codFuncionario])
REFERENCES [dbo].[Funcionario] ([cod_Funcionario])
GO
ALTER TABLE [dbo].[Instrutor] CHECK CONSTRAINT [FK_Instrutor_Funcionario]
GO
ALTER TABLE [dbo].[Material]  WITH NOCHECK ADD  CONSTRAINT [FK_Material_Curso] FOREIGN KEY([codCurso])
REFERENCES [dbo].[Curso] ([cod_Curso])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Curso]
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD  CONSTRAINT [FK_Nota_Avaliacao] FOREIGN KEY([codAvaliacao])
REFERENCES [dbo].[Avaliacao] ([cod_Avaliacao])
GO
ALTER TABLE [dbo].[Nota] CHECK CONSTRAINT [FK_Nota_Avaliacao]
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD  CONSTRAINT [FK_Nota_Cliente] FOREIGN KEY([matriculaCliente])
REFERENCES [dbo].[Cliente] ([matricula])
GO
ALTER TABLE [dbo].[Nota] CHECK CONSTRAINT [FK_Nota_Cliente]
GO
ALTER TABLE [dbo].[Pessoa]  WITH NOCHECK ADD  CONSTRAINT [FK_Pessoa_Endereco] FOREIGN KEY([codEndereco])
REFERENCES [dbo].[Endereco] ([cod_Endereco])
GO
ALTER TABLE [dbo].[Pessoa] CHECK CONSTRAINT [FK_Pessoa_Endereco]
GO
/****** Object:  StoredProcedure [dbo].[AcoesCliente]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AcoesCliente]
@acao int, --0=Excluir, 1=Inserir, 2=Alterar

--@IdPessoa int = null,
--@nome varchar(50) = null,
--PARAMETROS Do Cliente:
@complementares varchar = null,
@cpfC varchar(14) = null,
@matriculaC varchar(100) = null

AS
BEGIN
	IF (@acao = 0) --EXCLUIR
		BEGIN
			DELETE FROM Cliente
			WHERE matricula = @matriculaC

			SELECT @matriculaC AS Retorno -- vai retornar o campo onde houve a ação
		END
	ELSE IF (@acao = 1) --INSERIR
		BEGIN
			INSERT INTO Cliente(dadosComplementares,cfp_Cliente)
			VALUES(@complementares,@cpfC)

			SELECT @@IDENTITY AS Retorno --vai retornar o campo onde houve a ação
		END

	ELSE IF (@acao = 2)--ALTERAR
		BEGIN
			UPDATE Cliente
			SET dadosComplementares = @complementares, cfp_Cliente = @cpfC
						
			WHERE matricula = @matriculaC

			SELECT @matriculaC AS Retorno --vai retornar o campo onde houve a ação
		END
	ELSE
		BEGIN
			RAISERROR('AÇÃO NÃO IMPLEMENTADA',14,1); --tentar executar alguma ação que não esta implementada
		END
END
GO
/****** Object:  StoredProcedure [dbo].[AcoesPessoa]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AcoesPessoa]
@acao int, --0=Excluir, 1=Inserir, 2=Alterar

@IdPessoa int = null,
--PARAMETROS DA PESSOA:
@nomeP varchar(100) = null,
@nascimentoP date = null,
@cpfP varchar(14) = null,
@emailP varchar = null,
@sexoP char = null,
@contato1P varchar = null,
@contato2P varchar = null,
@codEnderecoP int = null

AS
BEGIN
	IF (@acao = 0) --EXCLUIR
		BEGIN
			DELETE FROM PESSOA
			WHERE idPessoa = @IdPessoa

			SELECT @idPessoa AS Retorno -- vai retornar o campo onde houve a ação
		END
	ELSE IF (@acao = 1) --INSERIR
		BEGIN
			INSERT INTO PESSOA(nome,nascimento,cpf,email,sexo,contato, contato2, codEndereco)
			VALUES(@nomeP,@nascimentoP,@cpfP,@emailP,@sexoP,@contato1P,@contato2P,@codEnderecoP)

			SELECT @@IDENTITY AS Retorno --vai retornar o campo onde houve a ação
		END

	ELSE IF (@acao = 2)--ALTERAR
		BEGIN
			UPDATE Pessoa
			SET nome = @nomeP, nascimento = @nascimentoP, cpf = @cpfP,
				email = @emailP, sexo = @sexoP, contato = @contato1P,
				contato2 = @contato2P, codEndereco = @codEnderecoP
						
			WHERE idPessoa = @idPessoa

			SELECT @idPessoa AS Retorno --vai retornar o campo onde houve a ação
		END
	ELSE
		BEGIN
			RAISERROR('AÇÃO NÃO IMPLEMENTADA',14,1); --tentar executar alguma ação que não esta implementada
		END
END
GO
/****** Object:  StoredProcedure [dbo].[cadastroPessoa]    Script Date: 3/3/2017 6:54:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cadastroPessoa]
@nomeP varchar(100) = null,
@nascimentoP date = null,
@cpfP varchar(14) = null,
@emailP varchar = null,
@sexoP char = null,
@contato1P varchar = null,
@contato2P varchar = null,
@codEnderecoP int = null

  AS 
	BEGIN
		INSERT INTO Pessoa(nome, nascimento, cpf, email, sexo, contato, contato2, codEndereco)
		VALUES (@nomeP, @nascimentoP, @cpfP,@emailP, @sexoP, @contato1P,@contato2P,@codEnderecoP)
	END
GO
USE [master]
GO
ALTER DATABASE [School_Of_Teachers] SET  READ_WRITE 
GO
