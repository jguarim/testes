USE [master]
GO
/****** Object:  Database [Projeto]    Script Date: 10/08/2022 15:04:49 ******/
CREATE DATABASE [Projeto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projeto', FILENAME = N'/var/opt/mssql/data/Projeto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projeto_log', FILENAME = N'/var/opt/mssql/data/Projeto_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Projeto] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projeto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projeto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projeto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projeto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projeto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projeto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projeto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projeto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projeto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projeto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projeto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projeto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projeto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projeto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projeto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projeto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Projeto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projeto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projeto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projeto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projeto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projeto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projeto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projeto] SET RECOVERY FULL 
GO
ALTER DATABASE [Projeto] SET  MULTI_USER 
GO
ALTER DATABASE [Projeto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projeto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projeto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projeto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projeto] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Projeto', N'ON'
GO
ALTER DATABASE [Projeto] SET QUERY_STORE = OFF
GO
USE [Projeto]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/08/2022 15:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cpf] [varchar](11) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
	[Rg] [varchar](10) NOT NULL,
	[DataExpedicao] [datetime] NULL,
	[OrgaoExpedicao] [varchar](10) NULL,
	[Uf] [varchar](2) NULL,
	[DataNascimento] [datetime] NOT NULL,
	[Sexo] [varchar](10) NOT NULL,
	[EstadoCivil] [varchar](20) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnderecoCliente]    Script Date: 10/08/2022 15:04:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnderecoCliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Cep] [varchar](8) NOT NULL,
	[Logradouro] [varchar](100) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Complemento] [varchar](50) NULL,
	[Bairro] [varchar](50) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[Uf] [varchar](2) NOT NULL,
 CONSTRAINT [PK_EnderecoCliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EnderecoCliente]  WITH CHECK ADD  CONSTRAINT [FK_EnderecoCliente_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[EnderecoCliente] CHECK CONSTRAINT [FK_EnderecoCliente_Cliente]
GO
USE [master]
GO
ALTER DATABASE [Projeto] SET  READ_WRITE 
GO
