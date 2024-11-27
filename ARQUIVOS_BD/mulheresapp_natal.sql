-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/11/2024 às 19:31
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mulheresapp_natal`
--

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `abrigamentos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `abrigamentos` (
`Código` int(11)
,`Nome` varchar(45)
,`CPF` varchar(45)
,`RG` varchar(45)
,`Prontuário` varchar(45)
,`Técnico de Referência` varchar(85)
,`Técnico responsável pelo Abrigamento` varchar(85)
,`Telefone 1` varchar(45)
,`Telefone 2` varchar(45)
,`E-mail` varchar(70)
,`Encaminhada de` varchar(400)
,`Religião` varchar(400)
,`Cor` varchar(400)
,`Estado Civil` varchar(400)
,`Data Nascimento` varchar(10)
,`Idade` bigint(21)
,`Endereço` varchar(90)
,`Bairro` varchar(400)
,`Cidade` varchar(400)
,`Faixa Salarial` varchar(400)
,`Quantidade de Dependentes` bigint(21)
,`Total de Abrigados` bigint(22)
,`Início do Abrigamento1` timestamp
,`Fim do Abrigamento1` timestamp
,`Pertences` text
,`Início do Abrigamento` varchar(21)
,`Fim do Abrigamento` varchar(21)
,`Nulo` binary(0)
,`Agora` datetime
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `atendimentos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `atendimentos` (  
`Data1` timestamp
,`Data` varchar(21)
,`Técnico 1` varchar(45)
,`Técnico 2` varchar(45)
,`Técnico Referência` varchar(45)
,`Nome Mulher` varchar(45)
,`Resumo` varchar(90)
,`Código da Mulher` int(11)
,`Tipo do Atendimento` varchar(12)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `mulher_codigo` int(11) DEFAULT NULL,
  `nome_arquivo` varchar(255) DEFAULT NULL,
  `caminho_arquivo` varchar(255) DEFAULT NULL,
  `data_upload` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `documentos`
--

INSERT INTO `documentos` (`id`, `mulher_codigo`, `nome_arquivo`, `caminho_arquivo`, `data_upload`) VALUES
(1, 17, 'MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', 'uploads/MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', '2024-11-18 10:31:06'),
(2, NULL, 'MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', 'uploads/MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', '2024-11-18 10:32:46'),
(3, 17, 'MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', 'uploads/MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', '2024-11-18 10:33:48'),
(4, 17, 'MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', 'uploads/MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', '2024-11-18 10:38:37'),
(5, 17, 'MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', 'uploads/MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', '2024-11-18 10:39:03'),
(6, 17, 'MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', 'uploads/MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', '2024-11-18 10:39:27'),
(7, 17, 'MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', 'uploads/MulheresApp _ Dashboard - Google Chrome 23_08_2024 19_46_18.png', '2024-11-18 10:40:39'),
(8, 17, 'RG Teste.png', 'uploads/RG Teste.png', '2024-11-18 10:50:23'),
(9, 17, 'Documento sem título - Documentos Google - Google Chrome 09_09_2024 11_14_54.png', 'uploads/Documento sem título - Documentos Google - Google Chrome 09_09_2024 11_14_54.png', '2024-11-18 10:50:33'),
(10, 17, 'MulheresApp _ Você não tem permissão para acessar essa página. - Google Chrome 30_10_2024 22_31_44.png', 'uploads/MulheresApp _ Você não tem permissão para acessar essa página. - Google Chrome 30_10_2024 22_31_44.png', '2024-11-24 17:13:53'),
(11, 17, 'MulheresApp _ Você não tem permissão para acessar essa página. - Google Chrome 30_10_2024 22_31_44.png', 'uploads/MulheresApp _ Você não tem permissão para acessar essa página. - Google Chrome 30_10_2024 22_31_44.png', '2024-11-24 17:15:55');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `mulheres`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `mulheres` (
`Nome` varchar(45)
,`CPF` varchar(45)
,`RG` varchar(45)
,`Prontuário` varchar(45)
,`Técnico de Referência` varchar(85)
,`Telefone 1` varchar(45)
,`Telefone 2` varchar(45)
,`E-mail` varchar(70)
,`Encaminhada de` varchar(400)
,`Religião` varchar(400)
,`Cor` varchar(400)
,`Estado Civil` varchar(400)
,`Data Nascimento` varchar(10)
,`Idade` bigint(21)
,`Endereço` varchar(90)
,`Bairro` varchar(400)
,`Cidade` varchar(400)
,`Faixa Salarial` varchar(400)
,`Já foi abrigada` varchar(3)
,`Usa Psicotrópicos` varchar(3)
,`Atendimento Psiquiátrico` varchar(3)
,`Atendimento Psicológico` varchar(3)
,`Substâncias psicoativas` varchar(3)
,`Último atendimento` varchar(10)
,`Início das Agressões` varchar(10)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `relatorios`
--

CREATE TABLE `relatorios` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tblreports`
--

CREATE TABLE `tblreports` (
  `id` int(11) NOT NULL,
  `appliedConditions` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `txtReportName` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lstSortName` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lstSortOrder` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `txtRecPerPage` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `selectedFields` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `selectedTables` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tblreports`
--

INSERT INTO `tblreports` (`id`, `appliedConditions`, `txtReportName`, `lstSortName`, `lstSortOrder`, `txtRecPerPage`, `selectedFields`, `selectedTables`, `status`) VALUES
(6, NULL, 'Todas as Mulheres', '`Mulheres`.`Nome`', 'ASC', '2000', '`Mulheres`.`Nome`~`Mulheres`.`CPF`~`Mulheres`.`RG`~`Mulheres`.`Prontuário`~`Mulheres`.`Técnico de Referência`~`Mulheres`.`Encaminhada de`~`Mulheres`.`Religião`~`Mulheres`.`Cor`~`Mulheres`.`Estado Civil`~`Mulheres`.`Data Nascimento`~`Mulheres`.`Idade`~`Mulheres`.`Endereço`~`Mulheres`.`Bairro`~`Mulheres`.`Cidade`~`Mulheres`.`Usa Psicotrópicos`~`Mulheres`.`Faixa Salarial`~`Mulheres`.`Já foi abrigada`~', '`Mulheres`~', 0),
(8, '`Abrigamentos`.`Fim do Abrigamento` is null ~OR `Abrigamentos`.`Fim do Abrigamento` >= now() ~', 'Abrigadas atualmente', '`Abrigamentos`.`Nome`', 'ASC', NULL, '`Abrigamentos`.`Nome`~`Abrigamentos`.`Início do Abrigamento`~`Abrigamentos`.`Fim do Abrigamento`~`Abrigamentos`.`CPF`~`Abrigamentos`.`Idade`~`Abrigamentos`.`Bairro`~`Abrigamentos`.`Cidade`~`Abrigamentos`.`Quantidade de Dependentes`~', '`Abrigamentos`~', 0),
(11, '`Mulheres`.`Bairro` <> \'\'    ~', 'Mulheres Por Bairro', '`Mulheres`.`Bairro`', 'ASC', NULL, '`Mulheres`.`Bairro`~`Mulheres`.`Nome`~`Mulheres`.`Idade`~`Mulheres`.`Último atendimento`~', '`Mulheres`~', 0),
(12, NULL, 'Atendimentos', '`Atendimentos`.`Data1`', 'DESC', NULL, '`Atendimentos`.`Tipo do Atendimento`~`Atendimentos`.`Data`~`Atendimentos`.`Técnico 1`~`Atendimentos`.`Técnico 2`~`Atendimentos`.`Nome Mulher`~`Atendimentos`.`Resumo`~', '`Atendimentos`~', 0),
(13, NULL, 'Todas as Abrigadas', NULL, NULL, NULL, '`Abrigamentos`.`Nome`~`Abrigamentos`.`CPF`~`Abrigamentos`.`Técnico responsável pelo Abrigamento`~`Abrigamentos`.`Telefone 1`~`Abrigamentos`.`Idade`~`Abrigamentos`.`Bairro`~`Abrigamentos`.`Faixa Salarial`~`Abrigamentos`.`Quantidade de Dependentes`~`Abrigamentos`.`Início do Abrigamento`~`Abrigamentos`.`Fim do Abrigamento`~', '`Abrigamentos`~', 0),
(14, NULL, 'RELATÓRIO MENSAL DE ABRIGAMENTO', '`Abrigamentos`.`Início do Abrigamento1`', 'ASC', NULL, '`Abrigamentos`.`Nome`~`Abrigamentos`.`CPF`~`Abrigamentos`.`Início do Abrigamento1`~`Abrigamentos`.`Fim do Abrigamento1`~', '`Abrigamentos`~', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_abrigamentos`
--

CREATE TABLE `tb_abrigamentos` (
  `abr_codigo` int(11) NOT NULL,
  `abr_data_inicio` timestamp NULL DEFAULT NULL,
  `abr_data_fim` timestamp NULL DEFAULT NULL,
  `abr_mul_codigo` int(11) NOT NULL,
  `abr_tec_codigo` int(11) NOT NULL,
  `abr_roldepertences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_abrigamentos`
--

INSERT INTO `tb_abrigamentos` (`abr_codigo`, `abr_data_inicio`, `abr_data_fim`, `abr_mul_codigo`, `abr_tec_codigo`, `abr_roldepertences`) VALUES
(13, '2022-03-16 13:33:00', '2022-03-16 14:00:00', 17, 56, ''),
(14, '2022-03-03 13:57:00', '2022-03-15 14:00:00', 18, 43, 'Bolsa vermelha\r\ndsd\r\n\r\nd\r\nfg\r\nf'),
(15, '2022-03-16 13:58:00', NULL, 19, 54, 'Mala com roupas\r\nCelular\r\nMedicamentos'),
(16, '2022-03-16 14:31:00', NULL, 17, 45, 'bolsa'),
(17, '2022-03-16 18:24:00', NULL, 20, 56, ''),
(18, '2022-03-14 18:41:00', '2022-03-16 18:00:00', 23, 39, 'Pasta amarela\r\nRelógio\r\nCorrente de ouro\r\n1000 reais'),
(19, '2022-03-16 18:46:00', NULL, 23, 39, ''),
(20, '2022-03-16 19:37:00', NULL, 23, 40, ''),
(0, '2024-10-31 01:24:00', NULL, 55, 2, 'dsfsdf');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acompanhamento_abrigamentos`
--

CREATE TABLE `tb_acompanhamento_abrigamentos` (
  `aco_codigo` int(11) NOT NULL,
  `aco_data` timestamp NULL DEFAULT current_timestamp(),
  `aco_relatorio` text DEFAULT NULL,
  `aco_abr_codigo` int(11) NOT NULL,
  `aco_tec_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_acompanhamento_abrigamentos`
--

INSERT INTO `tb_acompanhamento_abrigamentos` (`aco_codigo`, `aco_data`, `aco_relatorio`, `aco_abr_codigo`, `aco_tec_codigo`) VALUES
(5, '2022-03-16 13:34:00', '<p>Breve relato</p>', 13, 56),
(6, '2022-03-14 13:57:00', '<p>Hoje foi retirar os documentos</p>', 14, 43),
(7, '2022-03-15 18:43:00', '<p>Fez BO na delegacia. Seguiu para MP.</p>', 18, 39),
(8, '2022-03-16 18:44:00', '<p>Foi fazer os novos documentos</p>', 18, 39),
(0, '2024-10-02 13:55:00', '<p>Esta indo bem</p>', 20, 2),
(0, '2024-10-31 01:16:00', '<p>asdad</p>', 20, 2),
(0, '2024-10-31 01:18:00', '<p>asdas</p>', 20, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_agressores`
--

CREATE TABLE `tb_agressores` (
  `agr_codigo` int(11) NOT NULL,
  `agr_nome` varchar(45) DEFAULT NULL,
  `agr_apelido` varchar(45) DEFAULT NULL,
  `agr_data_nasc` date DEFAULT NULL,
  `agr_idade` int(11) DEFAULT NULL,
  `agr_sexo` int(11) DEFAULT NULL,
  `agr_naturalidade` varchar(45) DEFAULT NULL,
  `agr_cor` int(11) DEFAULT NULL,
  `agr_endereco` varchar(45) DEFAULT NULL,
  `agr_bairro` varchar(45) DEFAULT NULL,
  `agr_referencia` varchar(45) DEFAULT NULL,
  `agr_cidade` varchar(45) DEFAULT NULL,
  `agr_estado` varchar(45) DEFAULT NULL,
  `agr_telefone1` varchar(45) DEFAULT NULL,
  `agr_telefone2` varchar(45) DEFAULT NULL,
  `agr_telefone3` varchar(45) DEFAULT NULL,
  `agr_grau_instrucao` int(11) DEFAULT NULL,
  `agr_historico_de_agressoes` int(11) DEFAULT NULL,
  `agr_sob_medida_protetiva` int(11) DEFAULT NULL,
  `agr_sob_medida_protetiva_usuaria` int(11) DEFAULT NULL,
  `agr_drogas` int(11) DEFAULT NULL,
  `agr_drogas_quais` varchar(45) DEFAULT NULL,
  `agr_ocupacao` int(11) DEFAULT NULL,
  `agr_ocupacao_empresa` varchar(45) DEFAULT NULL,
  `agr_ocupacao_funcao` varchar(45) DEFAULT NULL,
  `agr_ocupacao_telefone` varchar(45) DEFAULT NULL,
  `agr_faixa_salarial` int(11) DEFAULT NULL,
  `agr_tipo_agressao` int(11) DEFAULT NULL,
  `agr_local_agressao` int(11) DEFAULT NULL,
  `agr_data_inicio_agressoes` date DEFAULT NULL,
  `agr_frequencia` int(11) DEFAULT NULL,
  `agr_relacao` int(11) DEFAULT NULL,
  `agr_fez_bo` int(11) DEFAULT NULL,
  `agr_numero_bo` varchar(45) DEFAULT NULL,
  `agr_data_bo` date DEFAULT NULL,
  `agr_local_bo` varchar(45) DEFAULT NULL,
  `agr_motivo_sem_bo` varchar(200) DEFAULT NULL,
  `agr_oitiva` int(11) DEFAULT NULL,
  `agr_oitiva_data` timestamp NULL DEFAULT NULL,
  `agr_oitiva_local` varchar(45) DEFAULT NULL,
  `agr_motivo_sem_oitiva` varchar(150) DEFAULT NULL,
  `agr_corpo_delito` int(11) DEFAULT NULL,
  `agr_exame_itep` int(11) DEFAULT NULL,
  `agr_exame_itep_motivo` varchar(150) DEFAULT NULL,
  `agr_profilaxia` int(11) DEFAULT NULL,
  `agr_profilaxia_data` date DEFAULT NULL,
  `agr_profilaxia_local` varchar(45) DEFAULT NULL,
  `agr_itep_natureza` int(11) DEFAULT NULL,
  `agr_itep_arma` int(11) DEFAULT NULL,
  `agr_medida_protetiva` int(11) DEFAULT NULL,
  `agr_numero_medida` varchar(45) DEFAULT NULL,
  `agr_data_medida` date DEFAULT NULL,
  `agr_ciencia_ofendida` int(11) DEFAULT NULL,
  `agr_ciencia_ofendida_data` date DEFAULT NULL,
  `agr_ciencia_agressor` int(11) DEFAULT NULL,
  `agr_ciencia_agressor_data` date DEFAULT NULL,
  `agr_data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  `agr_pes_codigo` int(11) DEFAULT NULL,
  `agr_mul_codigo` int(11) DEFAULT NULL,
  `agr_justificativa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_agressores`
--

INSERT INTO `tb_agressores` (`agr_codigo`, `agr_nome`, `agr_apelido`, `agr_data_nasc`, `agr_idade`, `agr_sexo`, `agr_naturalidade`, `agr_cor`, `agr_endereco`, `agr_bairro`, `agr_referencia`, `agr_cidade`, `agr_estado`, `agr_telefone1`, `agr_telefone2`, `agr_telefone3`, `agr_grau_instrucao`, `agr_historico_de_agressoes`, `agr_sob_medida_protetiva`, `agr_sob_medida_protetiva_usuaria`, `agr_drogas`, `agr_drogas_quais`, `agr_ocupacao`, `agr_ocupacao_empresa`, `agr_ocupacao_funcao`, `agr_ocupacao_telefone`, `agr_faixa_salarial`, `agr_tipo_agressao`, `agr_local_agressao`, `agr_data_inicio_agressoes`, `agr_frequencia`, `agr_relacao`, `agr_fez_bo`, `agr_numero_bo`, `agr_data_bo`, `agr_local_bo`, `agr_motivo_sem_bo`, `agr_oitiva`, `agr_oitiva_data`, `agr_oitiva_local`, `agr_motivo_sem_oitiva`, `agr_corpo_delito`, `agr_exame_itep`, `agr_exame_itep_motivo`, `agr_profilaxia`, `agr_profilaxia_data`, `agr_profilaxia_local`, `agr_itep_natureza`, `agr_itep_arma`, `agr_medida_protetiva`, `agr_numero_medida`, `agr_data_medida`, `agr_ciencia_ofendida`, `agr_ciencia_ofendida_data`, `agr_ciencia_agressor`, `agr_ciencia_agressor_data`, `agr_data_cadastro`, `agr_pes_codigo`, `agr_mul_codigo`, `agr_justificativa`) VALUES
(17, 'João Algusto', 'João', '2022-03-17', NULL, 89, 'Natal/RN', 73, 'Rua dos Guaiatis, 138', 'Candelária', 'Atrás da Academia Hi-Fit', 'Natal', 'RN', NULL, NULL, NULL, NULL, 1, 0, 1, 1, NULL, 213, NULL, NULL, NULL, 143, NULL, NULL, '2022-01-16', 231, 249, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32454', '2022-03-01', 1, NULL, 1, NULL, '2022-03-16 04:51:02', NULL, 17, NULL),
(18, 'Claudio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, '2022-03-16 13:46:55', NULL, 18, NULL),
(19, 'Mario Silva', 'Silva', '1974-02-11', NULL, 89, 'Parnamirim', 73, 'Rua da Saudade', 'Nossa Senhora da Apresentação', NULL, 'Natal', 'RN', NULL, NULL, NULL, 117, 1, 0, 1, 0, NULL, 212, NULL, NULL, NULL, 143, NULL, NULL, '2019-03-16', 237, 255, 1, '12345', '2022-02-01', 'DEAM NORTE', NULL, NULL, NULL, NULL, 'SIM', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12345678', '2022-02-03', NULL, NULL, 0, NULL, '2022-03-16 13:48:23', NULL, 19, NULL),
(20, 'Francisco Dias', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 13:48:34', NULL, 20, NULL),
(21, 'Zé', 'Zé', NULL, NULL, NULL, 'Natal/RN', NULL, 'Rua Coronel Luciano Saldanha, 2323', 'Candelária', 'Atrás da Academia Hi-Fit', 'Natal', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 'Crack', NULL, NULL, NULL, NULL, 143, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 18:36:33', NULL, 23, NULL),
(22, 'Silvestre Stalonne', NULL, '2022-01-01', NULL, 89, 'Na', 73, 'Rua Miramar', 'Santos Reis', 'Escola', 'Natal', 'RN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Álcool ', 214, NULL, NULL, NULL, 140, NULL, NULL, NULL, 238, 241, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-30 19:30:11', NULL, 22, NULL),
(23, 'José Guedes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-31 16:27:47', NULL, 26, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_alternativas`
--

CREATE TABLE `tb_alternativas` (
  `alt_codigo` int(11) NOT NULL,
  `alt_alternativa` varchar(400) DEFAULT NULL,
  `alt_per_codigo` int(11) NOT NULL,
  `alt_ativa` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_alternativas`
--

INSERT INTO `tb_alternativas` (`alt_codigo`, `alt_alternativa`, `alt_per_codigo`, `alt_ativa`) VALUES
(1, 'Lagoa Azul', 7, NULL),
(2, 'Nossa Senhora da Apresentação', 7, NULL),
(3, 'Igapó', 7, NULL),
(4, 'Potengi', 7, NULL),
(5, 'Pajuçara', 7, NULL),
(6, 'Redinha', 7, NULL),
(7, 'Salinas', 7, NULL),
(8, 'Santos Reis', 7, NULL),
(9, 'Rocas', 7, NULL),
(10, 'Praia do Meio', 7, NULL),
(11, 'Petrópolis', 7, NULL),
(12, 'Mãe Luíza', 7, NULL),
(13, 'Areia Preta', 7, NULL),
(14, 'Tirol', 7, NULL),
(15, 'Cidade Alta', 7, NULL),
(16, 'Barro Vermelho', 7, NULL),
(17, 'Alecrim', 7, NULL),
(18, 'Lagoa Seca', 7, NULL),
(19, 'Nova Descoberta', 7, NULL),
(20, 'Lagoa Nova', 7, NULL),
(21, 'Dix-Sept Rosado', 7, NULL),
(22, 'Quintas', 7, NULL),
(23, 'Nordeste', 7, NULL),
(24, 'Bom Pastor', 7, NULL),
(25, 'Felipe Camarão', 7, NULL),
(26, 'Guarapes', 7, NULL),
(27, 'Planalto', 7, NULL),
(28, 'Pitimbú', 7, NULL),
(29, 'Cidade Nova', 7, NULL),
(30, 'Cidade da Esperança', 7, NULL),
(31, 'Nossa Senhora de Nazaré', 7, NULL),
(32, 'Candelária', 7, NULL),
(33, 'Capim Macio', 7, NULL),
(34, 'Neópolis', 7, NULL),
(35, 'Ponta Negra', 7, NULL),
(36, 'Ribeira', 7, NULL),
(37, 'Outro', 7, NULL),
(38, 'Espontâneo', 1, NULL),
(39, 'CRAS África', 1, NULL),
(40, 'CRAS Guarapes', 1, NULL),
(41, 'CRAS Lagoa Azul', 1, NULL),
(42, 'CRAS Mãe Luiza', 1, NULL),
(43, 'CRAS Nossa Senhora', 1, NULL),
(44, 'CRAS Pajuçara', 1, NULL),
(45, 'CRAS Passo da Pátria', 1, NULL),
(46, 'CRAS Planalto', 1, NULL),
(47, 'CRAS Ponta Negra', 1, NULL),
(48, 'CRAS Salinas', 1, NULL),
(49, 'CREAS Leste', 1, NULL),
(50, 'CREAS Norte', 1, NULL),
(51, 'CREAS Oeste', 1, NULL),
(52, 'CREAS Sul', 1, NULL),
(53, 'DEAM Parnamirim', 1, NULL),
(54, 'DEAM Z.N', 1, NULL),
(55, 'DEAM Z.S', 1, NULL),
(56, 'Defensoria Pública', 1, NULL),
(57, 'Juizado de VDF', 1, NULL),
(58, 'Ministério Público', 1, NULL),
(59, 'NUDEM', 1, NULL),
(60, 'Tribunal de Justiça', 1, NULL),
(61, 'Outro', 1, NULL),
(62, 'Catolicismo', 2, NULL),
(63, 'Protestantismo', 2, NULL),
(64, 'Adventismo', 2, NULL),
(65, 'Anglicanismo', 2, NULL),
(66, 'Mormonismo', 2, NULL),
(67, 'Igreja Ortodoxa', 2, NULL),
(68, 'Testemunhas de Jeová', 2, NULL),
(69, 'Espiritismo', 2, NULL),
(70, 'Ateísmo', 2, NULL),
(71, 'Não tem', 2, NULL),
(72, 'Não informou', 2, NULL),
(73, 'Branca', 3, NULL),
(74, 'Parda', 3, NULL),
(75, 'Negro', 3, NULL),
(76, 'Indígena', 3, NULL),
(77, 'Amarelo', 3, NULL),
(78, 'Não informou', 3, NULL),
(79, 'Solteira', 4, NULL),
(80, 'Casada no civil', 4, NULL),
(81, 'Divorciada', 4, NULL),
(82, 'Separada Judicialmente', 4, NULL),
(83, 'Separada de Corpos', 4, NULL),
(84, 'União Estável', 4, NULL),
(85, 'Viúva', 4, NULL),
(86, 'Não informou', 4, NULL),
(87, 'Transexual', 5, NULL),
(88, 'Travesti', 5, NULL),
(89, 'Masculino', 5, NULL),
(90, 'Feminino', 5, NULL),
(91, 'Outros', 5, NULL),
(92, 'Heterossexual', 6, NULL),
(93, 'LGBTQIA+', 6, NULL),
(94, 'Natal', 8, NULL),
(95, 'Parnamirim', 8, NULL),
(96, 'São Gonçalo do Amarante', 8, NULL),
(97, 'Macaíba', 8, NULL),
(98, 'Extremoz', 8, NULL),
(99, 'Outra', 8, NULL),
(100, 'Própria', 9, NULL),
(101, 'Alugada', 9, NULL),
(102, 'Família', 9, NULL),
(103, 'Cedida', 9, NULL),
(104, 'Não informou', 9, NULL),
(105, 'Outros', 9, NULL),
(106, 'Situação de rua', 9, NULL),
(107, 'Alvenaria', 10, NULL),
(108, 'Taipa revestida', 10, NULL),
(109, 'Madeira', 10, NULL),
(110, 'Outros', 10, NULL),
(111, 'Analfabeta', 11, NULL),
(112, 'Alfabetizada', 11, NULL),
(113, 'Fundamental Incompleto', 11, NULL),
(114, 'Fundamental Completo', 11, NULL),
(115, 'Médio Incompleto', 11, NULL),
(116, 'Médio Completo', 11, NULL),
(117, 'Superior Incompleto', 11, NULL),
(118, 'Pós-graduação', 11, NULL),
(119, 'Mestrado', 11, NULL),
(120, 'Douturado', 11, NULL),
(121, 'Serviços', 12, NULL),
(122, 'Beleza', 12, NULL),
(123, 'Artesanato', 12, NULL),
(124, 'Alimentos', 12, NULL),
(125, 'Informática', 12, NULL),
(126, 'Serviços', 13, NULL),
(127, 'Beleza', 13, NULL),
(128, 'Artesanato', 13, NULL),
(129, 'Alimentos', 13, NULL),
(130, 'Informática', 13, NULL),
(131, 'Empregada', 14, NULL),
(132, 'Desempregada', 14, NULL),
(133, 'Nunca teve emprego registrado', 14, NULL),
(134, 'Trabalha sem registro', 14, NULL),
(135, 'Autônoma', 14, NULL),
(136, 'Do lar', 14, NULL),
(137, 'Dependente', 14, NULL),
(138, 'Aposentada', 14, NULL),
(139, 'Não informou', 14, NULL),
(140, 'Não tem renda', 16, NULL),
(141, 'Até 1 salário mínimo', 16, NULL),
(142, 'De 1 a 2 salários', 16, NULL),
(143, 'De 2 a 3 salários', 16, NULL),
(144, 'De 3 a 4 salários', 16, NULL),
(145, 'De 4 a 5 salários', 16, NULL),
(146, 'Acima de 5 salários', 16, NULL),
(147, 'Auxílio doença', 17, NULL),
(148, 'BPC', 17, NULL),
(149, 'Bolsa família', 17, NULL),
(150, 'Seguro-desemprego', 17, NULL),
(151, 'Aposentadoria', 17, NULL),
(152, 'Pensão', 17, NULL),
(153, 'Sim, no relacionamento anterior', 21, NULL),
(154, 'Sim, no relacionamento atual', 21, NULL),
(155, 'Em todos os relacionamentos', 21, NULL),
(156, 'Relação familiar', 21, NULL),
(157, 'Física', 22, NULL),
(158, 'Psicológica', 22, NULL),
(159, 'Sexual', 22, NULL),
(160, 'Moral', 22, NULL),
(161, 'Patrimonial', 22, NULL),
(162, 'Residência de ambos', 23, NULL),
(163, 'Residência da mulher', 23, NULL),
(164, 'Residência do outro', 23, NULL),
(165, 'Local de trabalho', 23, NULL),
(166, 'Escola', 23, NULL),
(167, 'Via Pública', 23, NULL),
(168, 'Outro', 23, NULL),
(169, 'Normal', 25, NULL),
(170, 'Não informado', 25, NULL),
(171, 'Deficiência Física', 25, NULL),
(172, 'Deficiência Intelectual', 25, NULL),
(173, 'Deficiência Visual', 25, NULL),
(174, 'Deficiência Auditiva', 25, NULL),
(175, 'HIV/AIDS', 26, NULL),
(176, 'DSTs', 26, NULL),
(177, 'Tuberculose', 26, NULL),
(178, 'Outras', 26, NULL),
(179, 'Pai', 27, NULL),
(180, 'Mãe', 27, NULL),
(181, 'Avô', 27, NULL),
(182, 'Avó', 27, NULL),
(183, 'Bisavô', 27, NULL),
(184, 'Bisavó', 27, NULL),
(185, 'Filho', 27, NULL),
(186, 'Filha', 27, NULL),
(187, 'Neto', 27, NULL),
(188, 'Neta', 27, NULL),
(189, 'Bisneto', 27, NULL),
(190, 'Bisneta', 27, NULL),
(191, 'Irmão', 27, NULL),
(192, 'Irmã', 27, NULL),
(193, 'Tio', 27, NULL),
(194, 'Tia', 27, NULL),
(195, 'Sobrinho', 27, NULL),
(196, 'Sobrinha', 27, NULL),
(197, 'Cônjuge', 27, NULL),
(198, 'Cunhado', 27, NULL),
(199, 'Cunhada', 27, NULL),
(200, 'Primo', 27, NULL),
(201, 'Prima', 27, NULL),
(202, 'Sogro', 27, NULL),
(203, 'Sogra', 27, NULL),
(204, 'Genro', 27, NULL),
(205, 'Nora', 27, NULL),
(206, 'Enteado', 27, NULL),
(207, 'Enteada', 27, NULL),
(208, 'Afilhado', 27, NULL),
(209, 'Afilhada', 27, NULL),
(210, 'Outro parente', 27, NULL),
(211, 'Não parente', 27, NULL),
(212, 'Empregado', 28, NULL),
(213, 'Aposentadoria', 28, NULL),
(214, 'Desempregado', 28, NULL),
(215, 'Autônomo', 28, NULL),
(216, 'Dependente', 28, NULL),
(217, 'Outros', 28, NULL),
(218, 'Não informou', 28, NULL),
(219, 'Ciúme', 29, NULL),
(220, 'Porque não fez ou não gostou de alguma coisa em casa', 29, NULL),
(221, 'Não deseja mais conviver com a agredida', 29, NULL),
(222, 'Abusou de álcool', 30, NULL),
(223, 'Abusou de outras drogas', 30, NULL),
(224, 'Apresentou distúrbio de comportamento', 30, NULL),
(225, 'Leve', 31, NULL),
(226, 'Grave', 31, NULL),
(227, 'Gravíssima', 31, NULL),
(228, 'Não', 32, NULL),
(229, 'Arma de fogo', 32, NULL),
(230, 'Arma branca', 32, NULL),
(231, 'Apenas uma vez', 36, NULL),
(232, 'Mensalmente', 36, NULL),
(233, 'Semanalmente', 36, NULL),
(234, 'Nos fins de semana', 36, NULL),
(235, '01 a 02 vezes por semana', 36, NULL),
(236, '3 vezes por semana ou mais', 36, NULL),
(237, 'Diariamente', 36, NULL),
(238, 'Não soube informar', 36, NULL),
(239, 'Pai', 37, NULL),
(240, 'Mãe', 37, NULL),
(241, 'Marido', 37, NULL),
(242, 'Esposa', 37, NULL),
(243, 'Irmão', 37, NULL),
(244, 'Irmã', 37, NULL),
(245, 'Padrasto', 37, NULL),
(246, 'Madrasta', 37, NULL),
(247, 'Ex-marido', 37, NULL),
(248, 'Ex-esposa', 37, NULL),
(249, 'Namorado', 37, NULL),
(250, 'Ex-namorado', 37, NULL),
(251, 'Namorada', 37, NULL),
(252, 'Ex-namorada', 37, NULL),
(253, 'Companheiro', 37, NULL),
(254, 'Companheira', 37, NULL),
(255, 'Ex-companheiro', 37, NULL),
(256, 'Ex-companheira', 37, NULL),
(257, 'Vizinho', 37, NULL),
(258, 'Amigo', 37, NULL),
(259, 'Outro parente', 37, NULL),
(260, 'Avô', 37, NULL),
(261, 'Avó', 37, NULL),
(262, 'Suspensão da posse ou restrição do porte de armas, com comunicação ao órgão competente, nos termos da Lei no 10.826, de 22 de dezembro de 2003, ', 33, NULL),
(263, 'Afastamento do lar, domicílio ou local de convivência com a ofendida,', 33, NULL),
(264, 'Proibição de determinadas condutas, entre as quais: ', 33, NULL),
(265, '- aproximação da ofendida, de seus familiares e das testemunhas, fixando o limite mínimo de distância entre estes e o agressor,', 33, NULL),
(266, '- contato com a ofendida, seus familiares e testemunhas por qualquer meio de comunicação,', 33, NULL),
(267, '- frequentação de determinados lugares a fim de preservar a integridade física e psicológica da ofendida,', 33, NULL),
(268, 'Restrição ou suspensão de visitas aos dependentes menores, ouvida a equipe de atendimento multidisciplinar ou serviço similar, ', 33, NULL),
(269, 'Prestação de alimentos provisionais ou provisórios. ', 33, NULL),
(270, 'Comparecimento do agressor a programas de recuperação e reeducação,', 33, NULL),
(271, 'Acompanhamento psicossocial do agressor, por meio de atendimento individual e/ou em grupo de apoio.', 33, NULL),
(272, 'Encaminhar a ofendida e seus dependentes a programa oficial ou comunitário de proteção ou de atendimento,', 34, NULL),
(273, 'Determinar a recondução da ofendida e a de seus dependentes ao respectivo domicílio, após afastamento do agressor,', 34, NULL),
(274, 'Ideterminar o afastamento da ofendida do lar, sem prejuízo dos direitos relativos a bens, guarda dos filhos e alimentos,', 34, NULL),
(275, 'Determinar a separação de corpos.', 34, NULL),
(276, 'Determinar a matrícula dos dependentes da ofendida em instituição de educação básica mais próxima do seu domicílio, ou a transferência deles para essa instituição, independentemente da existência de vaga.', 34, NULL),
(277, 'Restituição de bens indevidamente subtraídos pelo agressor à ofendida,', 34, NULL),
(278, 'Proibição temporária para a celebração de atos e contratos de compra, venda e locação de propriedade em comum, salvo expressa autorização judicial,', 34, NULL),
(279, 'Suspensão das procurações conferidas pela ofendida ao agressor,', 34, NULL),
(280, 'prestação de caução provisória, mediante depósito judicial, por perdas e danos materiais decorrentes da prática de violência doméstica e familiar contra a ofendida.', 34, NULL),
(281, 'PAIF - Proteção e Atendimento Integral à Família', 19, NULL),
(282, 'SCFV - Serviço de Convivência e Fortalecimento de Vínculos', 19, NULL),
(283, 'Proteção Social Básica no Domicílio para Pessoas com Deficiência e Idosas', 19, NULL),
(284, 'PSC e LA - Serviço de Proteção Social a Adolescentes em Cumprimento de Medida Sócioeducativa de Prestação de Serviço à Comunidade (PSC) e Liberdade Assistida (LA)', 20, NULL),
(285, 'Serviço de Proteção Social Especial para Pessoas com Deficiência, Idosos (as) e suas Famílias,', 20, NULL),
(286, 'Serviço Especializado para Pessoas em Situação de Rua.', 20, NULL),
(287, 'PAEFI - Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos', 20, NULL),
(288, 'Serviço Especializado em Abordagem Social ', 20, NULL),
(289, 'Outra', 6, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_atendimentos`
--

CREATE TABLE `tb_atendimentos` (
  `ate_codigo` int(11) NOT NULL,
  `ate_mul_codigo` int(11) NOT NULL,
  `ate_tec_codigo1` int(11) NOT NULL,
  `ate_tec_codigo2` int(11) DEFAULT NULL,
  `ate_relatorio` text DEFAULT NULL,
  `ate_data` timestamp NULL DEFAULT current_timestamp(),
  `ate_resumo` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_atendimentos`
--

INSERT INTO `tb_atendimentos` (`ate_codigo`, `ate_mul_codigo`, `ate_tec_codigo1`, `ate_tec_codigo2`, `ate_relatorio`, `ate_data`, `ate_resumo`) VALUES
(32, 17, 2, NULL, '', '2022-03-16 04:53:03', 'Necessidade de abrigamento'),
(33, 17, 45, NULL, '', '2022-03-16 13:49:32', ''),
(34, 17, 45, 37, '', '2022-03-16 13:50:01', ''),
(35, 18, 54, NULL, '<p>A usu&aacute;ria visitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o para...........</p>\n<p>ssdsditou o servi&ccedil;o paitou o servi&ccedil;o paito<em>u o servi&ccedil;o </em>paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou <strong>o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o ser</strong>vi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o paitou o servi&ccedil;o pa</p>', '2022-03-16 13:50:19', 'Relatar nova agressão'),
(36, 19, 50, 53, '<p>Teste</p>', '2022-03-16 13:50:22', 'Nova agressão '),
(37, 17, 45, NULL, NULL, '2022-03-16 13:51:32', ''),
(38, 17, 37, 36, '<p>teste</p>', '2022-03-16 13:51:45', 'teste'),
(39, 17, 45, 43, '<p>teste 2</p>', '2022-03-16 13:53:01', 'teste 2'),
(40, 18, 57, NULL, NULL, '2022-03-16 13:54:44', ''),
(41, 18, 57, NULL, NULL, '2022-03-16 13:54:44', ''),
(42, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(43, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(44, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(45, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(46, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(47, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(48, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(49, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(50, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(51, 18, 57, NULL, NULL, '2022-03-16 13:54:45', ''),
(52, 17, 42, 39, '<p>veio pedir cesta basica</p>', '2022-03-16 14:30:29', 'cesta basica'),
(53, 25, 51, NULL, '<p>Roda de conversa sobre Viol&ecirc;ncia dom&eacute;stica e Lei Maria da Penha</p>', '2022-03-16 18:33:59', ''),
(54, 22, 58, 50, '<p>Entrevista e acolhimento &aacute; abrigada</p>', '2022-03-16 18:35:22', 'Atendimento psicossocial '),
(55, 23, 39, 58, '<p>No dia de hoje, a usu&aacute;ria procuro<strong>u o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, </strong>a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi c</p>\n<p>&nbsp;</p>\n<p>dia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi cdia de hoje, a usu&aacute;ria procurou o servi&ccedil;o ap&oacute;s ter sido....... foi c</p>', '2022-03-16 18:38:00', 'Nova agressão'),
(56, 19, 45, 38, '<p>veio solicitar uma ucesta basica</p>', '2022-03-29 15:35:38', 'cesta basica'),
(57, 17, 45, 38, '<p>teste 10</p>', '2022-03-29 16:22:00', 'teste 10'),
(58, 17, 45, 37, '<p>teste 20</p>', '2022-03-29 16:23:40', 'teste 20'),
(59, 17, 40, NULL, NULL, '2022-03-30 18:16:19', ''),
(60, 17, 40, NULL, '<p>A usuaria&nbsp; relatou que estava desempregada h&aacute; cerca de um ano e que tinha interesse em ser inserida novamente no mercado de trabalho.</p>\n<p>Diante do contexto a referida foi encaminhada para o Centro Municipal de Trabalho e Empreendedorismo localizado no bairro do Alecrim.</p>', '2022-03-30 18:19:00', 'Situação de vulnerabilidade econômica em decorrência do desemprego'),
(61, 18, 45, 43, '<p>Atendida e encaminhada para...</p>', '2022-04-06 15:08:09', 'Teste de sistema'),
(0, 17, 40, NULL, '', '2022-11-09 11:10:00', 'Teste'),
(0, 19, 40, NULL, '', '2022-11-09 11:10:00', ''),
(0, 19, 40, NULL, '', '2022-11-09 11:10:00', ''),
(0, 0, 2, NULL, NULL, '2024-10-27 13:13:20', NULL),
(0, 0, 2, NULL, NULL, '2024-10-27 13:16:03', NULL),
(0, 51, 2, NULL, NULL, '2024-10-27 13:30:03', NULL),
(0, 52, 2, NULL, NULL, '2024-10-27 13:32:18', NULL),
(0, 53, 2, NULL, NULL, '2024-10-27 13:34:23', NULL),
(0, 54, 2, NULL, NULL, '2024-10-27 13:36:20', NULL),
(0, 55, 2, NULL, NULL, '2024-10-31 01:23:04', NULL),
(0, 55, 2, NULL, NULL, '2024-10-31 01:24:11', ''),
(0, 55, 2, NULL, NULL, '2024-10-31 01:24:28', NULL),
(0, 55, 2, NULL, NULL, '2024-10-31 01:24:35', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cargos`
--

CREATE TABLE `tb_cargos` (
  `car_codigo` int(11) NOT NULL,
  `car_cargo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_cargos`
--

INSERT INTO `tb_cargos` (`car_codigo`, `car_cargo`) VALUES
(1, 'Administrativo'),
(2, 'Assistente Social'),
(3, 'Psicólogo'),
(4, 'Advogado'),
(5, 'Pedagogo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_chamados`
--

CREATE TABLE `tb_chamados` (
  `cha_codigo` int(11) NOT NULL,
  `cha_data_pedido` timestamp NULL DEFAULT current_timestamp(),
  `cha_data_resposta` timestamp NULL DEFAULT NULL,
  `cha_pedido` text DEFAULT NULL,
  `cha_resposta` text DEFAULT NULL,
  `cha_tec_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_chamados`
--

INSERT INTO `tb_chamados` (`cha_codigo`, `cha_data_pedido`, `cha_data_resposta`, `cha_pedido`, `cha_resposta`, `cha_tec_codigo`) VALUES
(6, '2022-03-16 14:07:58', NULL, '<p>Ao logar, digitei o e-mail, mas o @ ficou no lugar errado, e n&atilde;o deu certo. Meu email &eacute; asdasd@sdasd.com</p>', NULL, 2),
(7, '2022-03-16 18:56:58', NULL, '<p>O sistema travou quando eu estava fazendo relat&oacute;rios, na tela X https://www.mulheres.app.br/suporte.php&nbsp;</p>', NULL, 39),
(0, '2024-10-02 14:48:41', NULL, '<p>teste</p>', NULL, 2),
(0, '2024-10-02 14:56:20', NULL, '<p><strong>teste 2</strong></p>\r\n<p>&nbsp;</p>', NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_check_agr`
--

CREATE TABLE `tb_check_agr` (
  `cha_alt_codigo` int(11) NOT NULL,
  `cha_agr_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_check_agr`
--

INSERT INTO `tb_check_agr` (`cha_alt_codigo`, `cha_agr_codigo`) VALUES
(157, 17),
(163, 17),
(219, 17),
(224, 17),
(262, 17),
(263, 17),
(265, 17),
(268, 17),
(157, 19),
(158, 19),
(160, 19),
(162, 19),
(167, 19),
(219, 19),
(220, 19),
(222, 19),
(224, 19),
(263, 19),
(264, 19),
(265, 19),
(266, 19),
(267, 19),
(157, 22),
(158, 22),
(159, 22),
(160, 22),
(161, 22),
(162, 22),
(219, 22),
(220, 22),
(222, 22),
(164, 18),
(162, 18);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_check_mul`
--

CREATE TABLE `tb_check_mul` (
  `chm_mul_codigo` int(11) NOT NULL,
  `chm_alt_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_check_mul`
--

INSERT INTO `tb_check_mul` (`chm_mul_codigo`, `chm_alt_codigo`) VALUES
(17, 125),
(17, 150),
(17, 153),
(17, 154),
(17, 157),
(17, 158),
(17, 161),
(17, 164),
(17, 166),
(17, 169),
(17, 175),
(17, 281),
(17, 282),
(17, 286),
(18, 154),
(18, 161),
(18, 169),
(18, 175),
(18, 281),
(19, 121),
(19, 122),
(19, 123),
(19, 124),
(19, 125),
(19, 127),
(19, 149),
(19, 153),
(19, 154),
(19, 157),
(19, 158),
(19, 160),
(19, 162),
(19, 169),
(20, 122),
(20, 123),
(20, 127),
(20, 128),
(20, 147),
(20, 154),
(20, 157),
(20, 162),
(20, 171),
(20, 281),
(20, 283),
(22, 121),
(22, 122),
(22, 125),
(22, 127),
(22, 130),
(22, 153),
(22, 157),
(22, 158),
(22, 159),
(22, 160),
(22, 161),
(22, 162),
(22, 169),
(22, 281),
(23, 125),
(23, 126),
(23, 129),
(23, 155),
(23, 157),
(23, 158),
(23, 159),
(23, 160),
(23, 161),
(23, 162),
(23, 167),
(23, 169),
(23, 284),
(23, 286),
(24, 124),
(24, 129),
(24, 154),
(24, 158),
(24, 163),
(24, 169),
(26, 124),
(26, 126),
(26, 157),
(26, 158),
(26, 160),
(26, 161),
(26, 162),
(26, 165),
(55, 128);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_check_pes`
--

CREATE TABLE `tb_check_pes` (
  `chp_alt_codigo` int(11) NOT NULL,
  `chp_pes_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_componentes_abrigamento`
--

CREATE TABLE `tb_componentes_abrigamento` (
  `cab_abr_codigo` int(11) NOT NULL,
  `cab_pes_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_componentes_abrigamento`
--

INSERT INTO `tb_componentes_abrigamento` (`cab_abr_codigo`, `cab_pes_codigo`) VALUES
(13, 21),
(14, 23),
(15, 24),
(15, 25),
(15, 28),
(18, 31);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_encaminhamentos`
--

CREATE TABLE `tb_encaminhamentos` (
  `enc_codigo` int(11) NOT NULL,
  `enc_ate_codigo` int(11) NOT NULL,
  `enc_alt_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_logs`
--

CREATE TABLE `tb_logs` (
  `log_codigo` int(11) NOT NULL,
  `log_tec_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_lotacoes`
--

CREATE TABLE `tb_lotacoes` (
  `lot_codigo` int(11) NOT NULL,
  `lot_lotacao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_lotacoes`
--

INSERT INTO `tb_lotacoes` (`lot_codigo`, `lot_lotacao`) VALUES
(1, 'SEMUL'),
(2, 'Abrigo'),
(3, 'CREN');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_mensagens`
--

CREATE TABLE `tb_mensagens` (
  `men_codigo` int(11) NOT NULL,
  `men_lida` int(11) NOT NULL DEFAULT 0,
  `men_titulo` text DEFAULT NULL,
  `men_texto` text CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `men_tec_remetente` int(11) NOT NULL,
  `men_tec_destinatario` int(11) NOT NULL,
  `men_data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_mensagens`
--

INSERT INTO `tb_mensagens` (`men_codigo`, `men_lida`, `men_titulo`, `men_texto`, `men_tec_remetente`, `men_tec_destinatario`, `men_data`) VALUES
(20, 1, 'teste', '<p>teste</p>', 45, 43, '2022-03-16 13:55:21'),
(21, 1, 'Oi', '<p>Oi Senhora&nbsp;</p>', 56, 43, '2022-03-16 13:55:24'),
(22, 1, 'Acompanhamento de Cleide', '<p>Wendell, hoje atendi Cleide, que &eacute; usu&aacute;ria sua. Favor verificar se est&aacute; tudo certo, e minhas observa&ccedil;&otilde;es no atendimento.</p>\r\n<p>&nbsp;</p>\r\n<p>Obrigado</p>', 43, 45, '2022-03-16 13:55:30'),
(23, 1, 'Obrigado', '<p>.</p>', 43, 56, '2022-03-16 13:56:13'),
(24, 1, 'estagiaria', '<p>fala estagiaria</p>', 45, 37, '2022-03-16 13:56:25'),
(25, 1, 'Oi', '<p>Estou mandando para Mayara n&atilde;o &eacute; para Ary. Confirme ai Mayara</p>', 56, 43, '2022-03-16 13:56:30'),
(26, 1, '', '<p>Bom dia!</p>', 54, 2, '2022-03-16 13:58:55'),
(27, 1, '', '<p>Oiii</p>', 54, 56, '2022-03-16 13:59:10'),
(28, 1, '', '<p>Xiuuu</p>', 53, 50, '2022-03-16 14:00:46'),
(29, 0, 'Oi', '<p>Oi</p>', 50, 57, '2022-03-16 14:01:19'),
(30, 1, 'RE: ', '<p>S2</p>', 2, 54, '2022-03-16 14:02:17'),
(31, 1, 'teste', '<p>veja o pronturario</p>', 45, 40, '2022-03-16 14:51:29'),
(32, 1, 'Oi', '<p>Oiiiiii</p>', 56, 51, '2022-03-16 18:12:30'),
(33, 1, 'Oi ', '<p>Oi Flavia</p>', 56, 48, '2022-03-16 18:13:15'),
(34, 1, 'RE: Oi', '<p>Teste</p>', 51, 56, '2022-03-16 18:14:15'),
(35, 1, 'RE: Oi ', '<p>Oiii! J&aacute; me achasse aqui</p>', 48, 56, '2022-03-16 18:15:12'),
(36, 1, 'RE: RE: Oi ', '<p>achei</p>', 56, 48, '2022-03-16 18:25:11'),
(37, 0, 'Usuária Clécia', '<p>Fiz um atendimento com Cl&eacute;cia, preciso que voc&ecirc; continue o contato, pois estou entrando de f&eacute;rias</p>', 39, 56, '2022-03-16 18:51:04'),
(38, 0, 'atendimento maria lucimar', '<p>athayde, ligue para maria lucimar que ela quer uma cesta basica</p>', 45, 38, '2022-03-29 16:43:56'),
(39, 0, '', '<p>Oi amiga de Luta.&nbsp;</p>', 37, 38, '2022-03-30 16:27:06'),
(0, 0, 'Sei la ', '<p>Boraaaaa</p>', 2, 37, '2024-10-02 14:43:38'),
(0, 0, 'Teste', '<p>teste</p>', 2, 37, '2024-10-31 01:16:12'),
(0, 0, 'Teste', '<p>sadas</p>', 2, 36, '2024-10-31 01:18:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_mulheres`
--

CREATE TABLE `tb_mulheres` (
  `mul_codigo` int(11) NOT NULL,
  `mul_nome` varchar(45) DEFAULT NULL,
  `mul_cpf` varchar(45) DEFAULT NULL,
  `mul_prontuario` varchar(45) DEFAULT NULL,
  `mul_encaminhada` int(11) DEFAULT NULL,
  `mul_encaminhada_outros` varchar(45) DEFAULT NULL,
  `mul_tec_codigo` int(11) DEFAULT NULL,
  `mul_data_nasc` varchar(45) DEFAULT NULL,
  `mul_naturalidade` varchar(45) DEFAULT NULL,
  `mul_rg` varchar(45) DEFAULT NULL,
  `mul_religiao` int(11) DEFAULT NULL,
  `mul_cor` int(11) DEFAULT NULL,
  `mul_estado_civil` int(11) DEFAULT NULL,
  `mul_estado_civil_data` date DEFAULT NULL,
  `mul_identidade_genero` int(11) DEFAULT NULL,
  `mul_identidade_genero_outros` varchar(45) DEFAULT NULL,
  `mul_orientacao_sexual` int(11) DEFAULT NULL,
  `mul_orientacao_sexual_outros` varchar(45) DEFAULT NULL,
  `mul_endereco` varchar(90) DEFAULT NULL,
  `mul_bairro` int(11) DEFAULT NULL,
  `mul_cidade` int(11) DEFAULT NULL,
  `mul_referencia` varchar(45) DEFAULT NULL,
  `mul_telefone1` varchar(45) DEFAULT NULL,
  `mul_telefone2` varchar(45) DEFAULT NULL,
  `mul_residencia` int(11) DEFAULT NULL,
  `mul_tipo_residencia` int(11) DEFAULT NULL,
  `mul_grau_instrucao` int(11) DEFAULT NULL,
  `mul_estudando` int(11) DEFAULT NULL,
  `mul_curso_atual` varchar(45) DEFAULT NULL,
  `mul_ate_que_serie` varchar(45) DEFAULT NULL,
  `mul_motivo_evasao` varchar(45) DEFAULT NULL,
  `mul_cursos_interesse_outros` varchar(45) DEFAULT NULL,
  `mul_cursos_realizados_outros` varchar(45) DEFAULT NULL,
  `mul_profissao` varchar(45) DEFAULT NULL,
  `mul_experiencia_profissional` varchar(45) DEFAULT NULL,
  `mul_ocupacao` int(11) DEFAULT NULL,
  `mul_empresa` varchar(45) DEFAULT NULL,
  `mul_telefone_empresa` varchar(45) DEFAULT NULL,
  `mul_data_desempregada` date DEFAULT NULL,
  `mul_aviso_empresa_por_abrigamento` int(11) DEFAULT NULL,
  `mul_aviso_empresa_motivo` varchar(90) DEFAULT NULL,
  `mul_faixa_salarial` int(11) DEFAULT NULL,
  `mul_nis` varchar(45) DEFAULT NULL,
  `mul_total_beneficios` float DEFAULT NULL,
  `mul_outras_doencas` varchar(90) DEFAULT NULL,
  `mul_medicamento_psico` int(11) DEFAULT NULL,
  `mul_medicamento_psico_qual` varchar(45) DEFAULT NULL,
  `mul_medicamento_psico_data` date DEFAULT NULL,
  `mul_atualmente_em_uso` int(11) DEFAULT NULL,
  `mul_psiquiatra` int(11) DEFAULT NULL,
  `mul_psiquiatra_data` date DEFAULT NULL,
  `mul_psiquiatra_internacao` int(11) DEFAULT NULL,
  `mul_psiquiatra_dias` int(11) DEFAULT NULL,
  `mul_psiquiatra_local` varchar(45) DEFAULT NULL,
  `mul_psicologo` int(11) DEFAULT NULL,
  `mul_psicologo_data` date DEFAULT NULL,
  `mul_psicologo_local` varchar(45) DEFAULT NULL,
  `mul_psicologo_motivo` varchar(90) DEFAULT NULL,
  `mul_drogas` int(11) DEFAULT NULL,
  `mul_droga_data` date DEFAULT NULL,
  `mul_droga_qual` varchar(45) DEFAULT NULL,
  `mul_doenca` int(11) DEFAULT NULL,
  `mul_doenca_qual` varchar(45) DEFAULT NULL,
  `mul_dificuldade_tratamento` int(11) DEFAULT NULL,
  `mul_dificuldade_tratamento_qual` varchar(90) DEFAULT NULL,
  `mul_acompanha_saude` int(11) DEFAULT NULL,
  `mul_acompanhamento_saude_local` varchar(45) DEFAULT NULL,
  `mul_alergias` varchar(45) DEFAULT NULL,
  `mul_ja_abrigada` int(11) DEFAULT NULL,
  `mul_abrigada_vezes` int(11) DEFAULT NULL,
  `mul_local_seguro` varchar(150) DEFAULT NULL,
  `mul_foto` int(11) DEFAULT 0,
  `mul_data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  `mul_email` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_mulheres`
--

INSERT INTO `tb_mulheres` (`mul_codigo`, `mul_nome`, `mul_cpf`, `mul_prontuario`, `mul_encaminhada`, `mul_encaminhada_outros`, `mul_tec_codigo`, `mul_data_nasc`, `mul_naturalidade`, `mul_rg`, `mul_religiao`, `mul_cor`, `mul_estado_civil`, `mul_estado_civil_data`, `mul_identidade_genero`, `mul_identidade_genero_outros`, `mul_orientacao_sexual`, `mul_orientacao_sexual_outros`, `mul_endereco`, `mul_bairro`, `mul_cidade`, `mul_referencia`, `mul_telefone1`, `mul_telefone2`, `mul_residencia`, `mul_tipo_residencia`, `mul_grau_instrucao`, `mul_estudando`, `mul_curso_atual`, `mul_ate_que_serie`, `mul_motivo_evasao`, `mul_cursos_interesse_outros`, `mul_cursos_realizados_outros`, `mul_profissao`, `mul_experiencia_profissional`, `mul_ocupacao`, `mul_empresa`, `mul_telefone_empresa`, `mul_data_desempregada`, `mul_aviso_empresa_por_abrigamento`, `mul_aviso_empresa_motivo`, `mul_faixa_salarial`, `mul_nis`, `mul_total_beneficios`, `mul_outras_doencas`, `mul_medicamento_psico`, `mul_medicamento_psico_qual`, `mul_medicamento_psico_data`, `mul_atualmente_em_uso`, `mul_psiquiatra`, `mul_psiquiatra_data`, `mul_psiquiatra_internacao`, `mul_psiquiatra_dias`, `mul_psiquiatra_local`, `mul_psicologo`, `mul_psicologo_data`, `mul_psicologo_local`, `mul_psicologo_motivo`, `mul_drogas`, `mul_droga_data`, `mul_droga_qual`, `mul_doenca`, `mul_doenca_qual`, `mul_dificuldade_tratamento`, `mul_dificuldade_tratamento_qual`, `mul_acompanha_saude`, `mul_acompanhamento_saude_local`, `mul_alergias`, `mul_ja_abrigada`, `mul_abrigada_vezes`, `mul_local_seguro`, `mul_foto`, `mul_data_cadastro`, `mul_email`) VALUES
(17, 'Maria Joaquina da Silva', '382.330.600-62', '12345', 49, NULL, 2, '1985-03-09', 'Natal/RN', '12354545/SSP-RN', 66, 73, 80, '2018-03-09', 90, NULL, 92, NULL, 'Rua dos Guaiatis, 138', 32, 94, 'Atrás da Academia Hi-Fit', '8488889585', NULL, 100, 107, 117, 0, 'Pedagogia 3º ano', NULL, 'veveve', NULL, NULL, 'Professora', '3 anos na escola X', 132, NULL, NULL, '2021-03-09', 1, NULL, 140, '125182828', 500, NULL, NULL, NULL, NULL, NULL, 1, '2021-11-10', 1, 2, 'Walfredo', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, 1, NULL, 1, NULL, 'AAS', 1, 1, 'João 99334-3343', 17, '2022-03-16 04:36:53', 'ana@gmail.com'),
(18, 'Carla Francisca Pereira Gomes', '633.244.120-80', '1235', 39, NULL, 56, '1980-03-15', 'Natal/RN', '12354545/SSP-RN', 64, 74, 80, '2019-07-09', 90, NULL, 92, NULL, 'Rua das Laranjeiras, 30', 23, 94, NULL, NULL, NULL, 102, 108, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-12-15', 'Maconha', 1, 'Diabetes', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 18, '2022-03-16 13:30:47', NULL),
(19, 'Fátima da Silva', '053.126.814-40', '1234', 53, NULL, 54, '1977-03-16', 'Natal', '12345678', 62, 73, 82, NULL, 90, NULL, 92, NULL, 'Rua da Saudade', 2, 94, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL, NULL, NULL, NULL, NULL, 'Vendedora', NULL, 135, NULL, NULL, NULL, NULL, NULL, 141, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 'Não', 19, '2022-03-16 13:35:44', NULL),
(20, 'Maria Lúcia Ferreira', '009.816.244-64', '10', 54, NULL, 56, '1979-03-14', 'São Paulo ', '1877145', 64, 76, 83, '2022-03-16', 90, NULL, 92, NULL, 'Rua Cel Pedro silva 4567', 14, 94, NULL, NULL, NULL, 102, 108, 111, NULL, NULL, NULL, NULL, NULL, NULL, 'Do lar', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dipirona,e lactose', 1, 5, 'Nao', 20, '2022-03-16 13:39:31', 'valeris.oliveira10@gmail.com'),
(21, 'Estéfanny Eugênia', '937.469.624-04', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-16 14:33:33', NULL),
(22, 'Maria Frida Nascimento ', '072.843.014-22', '3', 38, NULL, 50, '2022-03-16', 'Lajes', '123567', 63, 73, 83, '2022-02-01', 90, NULL, 92, NULL, 'Rua Miramar', 8, 94, 'Escola', '123456789', NULL, 103, 107, 114, NULL, NULL, NULL, NULL, NULL, NULL, 'Vendedor ', 'Vendas', 134, NULL, NULL, NULL, NULL, NULL, 141, NULL, NULL, NULL, 1, 'Diazepan', '2022-03-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 'Area Branca', 0, 'UBS ', NULL, NULL, NULL, NULL, 0, '2022-03-16 18:20:16', 'teste@gmail.com'),
(23, 'Clécia Maria do Nascimento', '279.911.270-60', '3214', 54, NULL, 54, '2001-08-01', 'Natal/RN', '12354545/SSP-RN', 65, 74, 80, '2019-02-21', 90, NULL, 92, NULL, 'Rua Coronel Luciano Saldanha, 2323', 32, 94, 'Atrás da Academia Hi-Fit', NULL, NULL, 101, 109, 118, NULL, NULL, NULL, NULL, NULL, NULL, 'Professora', NULL, 132, NULL, NULL, '2021-02-01', NULL, NULL, 143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-08-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-05-12', 'Maconha', 1, 'Diabetes', NULL, NULL, NULL, NULL, 'AAS', 1, 2, NULL, 23, '2022-03-16 18:20:22', 'aribarreto@gmail.com'),
(24, 'Maria Helena ', '043.811.814-68', '020', 42, NULL, 48, '2021-08-16', 'Natal', '001304002', 62, 74, 79, '2022-03-16', 90, NULL, 92, NULL, 'Rua Oeste', 8, 94, NULL, '32217854', NULL, 103, 107, 112, NULL, NULL, '5 ano', NULL, NULL, NULL, 'Professora', NULL, 135, NULL, NULL, NULL, NULL, NULL, 146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-03-01', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Não ', 0, '2022-03-16 18:22:44', NULL),
(25, 'Janis Joplin', '050.044.764-03', NULL, NULL, NULL, 51, '1943-01-19', NULL, NULL, 71, 73, 79, NULL, 90, NULL, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-03-16 18:23:07', NULL),
(26, 'janaina Maria de Brado', '860.378.896-00', '03/2022', 53, NULL, 49, '', NULL, NULL, 68, 75, 79, NULL, 90, NULL, 92, NULL, 'Rua das rosas roxas', 3, 95, 'Casa do bolo ', '987654342', NULL, NULL, 107, 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, '2022-03-29 16:36:01', NULL),
(27, NULL, '049.717.284-49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-10-07 14:30:01', NULL),
(28, NULL, '134.260.844-57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2022-12-23 14:04:05', NULL),
(29, NULL, '614.168.210-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-08-22 01:33:07', NULL),
(30, NULL, '767.316.300-47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-08-22 01:33:40', NULL),
(31, NULL, '055.861.000-53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-26 19:43:29', NULL),
(32, NULL, '159.106.630-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-26 19:52:54', NULL),
(33, NULL, '857.910.540-41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-26 19:53:04', NULL),
(34, NULL, '762.354.680-59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-26 19:54:31', NULL),
(35, NULL, '921.860.470-80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-26 19:56:05', NULL),
(36, NULL, '036.438.380-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-26 19:56:59', NULL),
(37, NULL, '770.981.750-56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-26 19:57:54', NULL),
(38, NULL, '024.485.770-99', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-27 13:03:07', NULL),
(39, NULL, '009.581.760-35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-27 13:13:20', NULL),
(40, NULL, '890.065.670-86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-27 13:16:03', NULL),
(51, NULL, '008.951.290-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-27 13:30:03', NULL),
(52, NULL, '390.687.340-40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-27 13:32:18', NULL),
(53, NULL, '034.295.870-42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-27 13:34:23', NULL),
(54, 'Sei la', '769.343.110-19', '45234', 38, NULL, 2, '2000-10-01', 'RN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-27 13:36:20', NULL),
(55, 'Teste', '991.910.330-63', '2132432', 38, NULL, 2, '2000-01-01', 'Rn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-10-31 01:23:04', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_ocorrencias`
--

CREATE TABLE `tb_ocorrencias` (
  `oco_codigo` int(11) NOT NULL,
  `oco_usu_codigo` int(11) NOT NULL,
  `oco_relato` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_perguntas`
--

CREATE TABLE `tb_perguntas` (
  `per_codigo` int(11) NOT NULL,
  `per_pergunta` varchar(90) DEFAULT NULL,
  `per_nome_coluna` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_perguntas`
--

INSERT INTO `tb_perguntas` (`per_codigo`, `per_pergunta`, `per_nome_coluna`) VALUES
(1, 'A mulher veio encaminhada de', 'mul_encaminhada'),
(2, 'Religião', 'mul_religiao'),
(3, 'Cor da pele', 'mul_cor'),
(4, 'Estado Civil', 'mul_estado_civil'),
(5, 'Idadentidades de Gênero', 'mul_identidade_genero'),
(6, 'Orientação Sexual', 'mul_orientacao_sexual'),
(7, 'Bairros da grande Natal', 'mul_bairro'),
(8, 'Cidades', 'mul_cidade'),
(9, 'Posse da Residência', 'mul_residencia'),
(10, 'Tipo da Residência', 'mul_tipo_residencia'),
(11, 'Grau de Instrução', 'mul_grau_instrucao'),
(12, 'Cursos de Interesse', NULL),
(13, 'Cursos Realizados', NULL),
(14, 'Status Ocupação', 'mul_ocupacao'),
(15, 'Tempo desempregada', 'mul_tempo_desempregada'),
(16, 'Faixa Salarial', 'mul_faixa_salarial'),
(17, 'Benefícios que Recebe', NULL),
(18, 'Rede socioassistencial', NULL),
(19, 'Proteção Social Básica', NULL),
(20, 'Proteção Social Especial de Média Complexidade', NULL),
(21, 'Já sofreu ou sofre algum tipo de violência?', NULL),
(22, 'Que tipo de violência sofre atualmente?', NULL),
(23, 'Em que local ocorreu à violência?', NULL),
(24, 'Condição de Saúde', 'mul_condicao_saude'),
(25, 'Deficiências', ''),
(26, 'Doenças Infecciosas', NULL),
(27, 'Grau de Parentesco', 'pes_grau_parentesco'),
(28, 'Ocupação Agressor', 'agr_ocupacao'),
(29, 'Justificativa por parte do agressor para Violência', 'agr_justificativa'),
(30, 'Quais eram as condições físicas e emocionais do agressor quando praticou a violência?', NULL),
(31, ' Natureza da Lesão', 'agr_itep_natureza_lesao'),
(32, 'A lesão foi causada por algum tipo de arma?', 'agr_itep_arma'),
(33, 'Medidas Protetivas para o Agressor', NULL),
(34, 'Medidas Protetivas para a Ofendida', NULL),
(35, 'Sexo', NULL),
(36, 'Frequência das Agressões', 'agr_frequencia'),
(37, 'Relação do Agressor com a Usuária', 'agr_relacao');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pessoas`
--

CREATE TABLE `tb_pessoas` (
  `pes_codigo` int(11) NOT NULL,
  `pes_nome` varchar(90) DEFAULT NULL,
  `pes_mul_codigo` int(11) DEFAULT NULL,
  `pes_data_nasc` date DEFAULT NULL,
  `pes_grau_parentesco` int(11) DEFAULT NULL,
  `pes_telefone` varchar(45) DEFAULT NULL,
  `pes_mesma_casa` int(11) DEFAULT NULL,
  `pes_privacao_liberdade` int(11) DEFAULT NULL,
  `pes_privacao_liberdade_situacao` varchar(90) DEFAULT NULL,
  `pes_medida_socioeducativa` int(11) DEFAULT NULL,
  `pes_medida_socioeducativa_situacao` varchar(90) DEFAULT NULL,
  `pes_acolhimento` int(11) DEFAULT NULL,
  `pes_acolhimento_situacao` varchar(90) DEFAULT NULL,
  `pes_internado` int(11) DEFAULT NULL,
  `pes_internado_situacao` varchar(90) DEFAULT NULL,
  `pes_doenca` int(11) DEFAULT NULL,
  `pes_doenca_detalhes` varchar(190) DEFAULT NULL,
  `pes_deficiencia` int(11) DEFAULT NULL,
  `pes_deficiencia_tipo` int(11) DEFAULT NULL,
  `pes_deficiencia_detalhes` varchar(90) DEFAULT NULL,
  `pes_gestante` int(11) DEFAULT NULL,
  `pes_gestante_detalhes` varchar(90) DEFAULT NULL,
  `pes_drogas` int(11) DEFAULT NULL,
  `pes_drogas_detalhes` varchar(90) DEFAULT NULL,
  `pes_cuidador` int(11) DEFAULT NULL,
  `pes_cuidador_detalhes` varchar(90) DEFAULT NULL,
  `pes_estudante` int(11) DEFAULT NULL,
  `pes_estudante_escola` varchar(45) DEFAULT NULL,
  `pes_estudante_serie` varchar(45) DEFAULT NULL,
  `pes_estudante_turno` varchar(45) DEFAULT NULL,
  `pes_ativo` int(11) DEFAULT NULL,
  `pes_data_cadastro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_pessoas`
--

INSERT INTO `tb_pessoas` (`pes_codigo`, `pes_nome`, `pes_mul_codigo`, `pes_data_nasc`, `pes_grau_parentesco`, `pes_telefone`, `pes_mesma_casa`, `pes_privacao_liberdade`, `pes_privacao_liberdade_situacao`, `pes_medida_socioeducativa`, `pes_medida_socioeducativa_situacao`, `pes_acolhimento`, `pes_acolhimento_situacao`, `pes_internado`, `pes_internado_situacao`, `pes_doenca`, `pes_doenca_detalhes`, `pes_deficiencia`, `pes_deficiencia_tipo`, `pes_deficiencia_detalhes`, `pes_gestante`, `pes_gestante_detalhes`, `pes_drogas`, `pes_drogas_detalhes`, `pes_cuidador`, `pes_cuidador_detalhes`, `pes_estudante`, `pes_estudante_escola`, `pes_estudante_serie`, `pes_estudante_turno`, `pes_ativo`, `pes_data_cadastro`) VALUES
(20, 'Ana', 17, '2020-11-04', 186, '(84) 9 8892-2060', 1, 1, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, 'Dengue', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 'CMEI Parque Central', 'P2', 'Manhã', NULL, '2022-03-16 04:48:38'),
(21, 'João', 17, NULL, 187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 04:50:23'),
(22, 'Renata', 17, NULL, NULL, NULL, 1, 1, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2022-03-16 13:43:53'),
(23, 'Maria', 18, '2021-12-16', 186, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Diabetes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'CMEI Maria José', 'P1', 'Manhã', NULL, '2022-03-16 13:43:57'),
(24, 'Mariana Silva', 19, '2016-07-13', 186, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'CEMEI NSA', 'Nível 5', 'MANHÃ', NULL, '2022-03-16 13:43:58'),
(25, 'João Carlos Silva', 19, '2020-06-25', 185, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 13:44:45'),
(26, 'Francisca Silva', 19, '1952-10-21', 180, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Cardiopata', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 13:45:35'),
(27, 'Claudio', 18, NULL, 179, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 13:45:48'),
(28, 'Joana', 19, '2021-01-12', 186, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Fisica', NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, '2022-03-16 13:46:27'),
(29, 'renato', 17, NULL, 185, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 14:29:30'),
(30, 'Brad Pitt da Silva', 22, '2021-03-01', 185, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2022-03-16 18:33:00'),
(31, 'Chica', 23, '2022-03-01', 186, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Diabetes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'CMEI Maria José', 'P2', 'Manhã', NULL, '2022-03-16 18:33:57'),
(32, 'Zé', 23, '1982-01-01', 193, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Alcool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-16 18:35:17'),
(33, 'fernando', 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-29 16:09:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tecnicos`
--

CREATE TABLE `tb_tecnicos` (
  `tec_codigo` int(11) NOT NULL,
  `tec_nome` varchar(85) NOT NULL,
  `tec_apelido` varchar(45) NOT NULL,
  `tec_matricula` varchar(45) NOT NULL,
  `tec_senha` varchar(255) NOT NULL,
  `tec_email` varchar(45) DEFAULT NULL,
  `tec_lot_codigo` int(11) NOT NULL,
  `tec_admin` int(11) NOT NULL DEFAULT 0,
  `tec_car_codigo` int(11) NOT NULL,
  `tec_ativo` int(11) DEFAULT 1,
  `tec_telefone` varchar(45) DEFAULT NULL,
  `tec_atende` int(11) DEFAULT 0,
  `tec_token` varchar(55) DEFAULT NULL,
  `tec_token_data` timestamp NULL DEFAULT NULL,
  `tec_token_usado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tb_tecnicos`
--

INSERT INTO `tb_tecnicos` (`tec_codigo`, `tec_nome`, `tec_apelido`, `tec_matricula`, `tec_senha`, `tec_email`, `tec_lot_codigo`, `tec_admin`, `tec_car_codigo`, `tec_ativo`, `tec_telefone`, `tec_atende`, `tec_token`, `tec_token_data`, `tec_token_usado`) VALUES
(2, 'Ari Barreto de Oliveira', 'Ari Barreto', '22.222-2', '25d55ad283aa400af464c76d713c07ad', 'aribarreto2@gmail.com', 2, 1, 1, 1, '(84) 9 8892-2062', 1, NULL, NULL, 0),
(36, 'ABRAHÃO LINCOLN DANTAS BARRETO JÚNIOR', 'Abrahão', '08.142-6', '25d55ad283aa400af464c76d713c07ad', 'abhahaodbarretto@gmail.com', 1, 1, 4, 1, '', 1, NULL, NULL, 0),
(37, 'ANTONIMÁRIA BANDEIRA DE FREITAS OLIVEIRA', 'Antonimária', '72.657-2', '25d55ad283aa400af464c76d713c07ad', 'antonimariafreitas@yahoo.com.br', 3, 1, 3, 1, '', 1, NULL, NULL, 0),
(38, 'ATHAYDE CRISTINA DE OLIVEIRA F. COELHO', 'Athayde', '72.325-0', '25d55ad283aa400af464c76d713c07ad', 'athaydecris38@gmail.com', 1, 1, 2, 1, '', 1, NULL, NULL, 0),
(39, 'HERIKA KAISON CARDOSO LISBOA', 'Herika', '72.306-8', '25d55ad283aa400af464c76d713c07ad', 'erilis98@hotmail.com', 1, 1, 2, 1, '(84) 9 8999-9999', 1, NULL, NULL, 0),
(40, 'ISABEL ELAINE BATISTA DA SILVA', 'Isabel', '72.289-0', '25d55ad283aa400af464c76d713c07ad', 'isabelaine@yahoo.com.br', 1, 1, 2, 1, '', 1, NULL, NULL, 0),
(41, 'JANE CLEIDE DE ASSIS BERTULEZA ANDRADE', 'Jane', '72.622-1', '25d55ad283aa400af464c76d713c07ad', 'jcbertuleza@gmail.com', 1, 1, 1, 1, '', 1, NULL, NULL, 0),
(42, 'MARIA JOSÉ BELÉM CORDEIRO', 'Maria José', '72.366-7', '25d55ad283aa400af464c76d713c07ad', 'beljoca60@gmail.com', 1, 1, 3, 1, '', 1, NULL, NULL, 0),
(43, 'MAYARA MIRANDA DOS SANTOS TAVARES', 'Mayara', '72.622-6', '25d55ad283aa400af464c76d713c07ad', 'mayaramsantos@yahoo.com.br', 1, 1, 1, 1, '', 1, NULL, NULL, 0),
(44, 'STEPHANIE LARA MELO DA NÓBREGA MORAIS', 'Stephanie', '72.318-6', '25d55ad283aa400af464c76d713c07ad', 'snobrega.psi@gmail.com', 1, 1, 3, 1, '', 1, NULL, NULL, 0),
(45, 'WENDELL DE BARROS DANTAS', 'Wendell', '72.321-3', '25d55ad283aa400af464c76d713c07ad', 'wendellass2000@yahoo.com.br', 3, 1, 2, 1, '', 1, NULL, NULL, 0),
(46, 'Patrícia da Silva Moreira', 'Patrícia', '', '25d55ad283aa400af464c76d713c07ad', 'patricia.tytyer@gmail.com', 1, 1, 1, 1, '', 1, NULL, NULL, 0),
(47, 'Vitor Daniel Lócio Medeiros', 'Vitor Daniel', '33.333-3', '113d229198c68e1769ca3322063aa27c', 'vitordaniel602@gmail.com', 2, 1, 1, 1, '(84) 9 9614-1306', 1, 'c2fff981c865eedb6946efe99c6e31832351144c', '2022-03-16 15:26:47', 1),
(48, 'Flávia Silva de Azevedo', 'Flávia', '', '25d55ad283aa400af464c76d713c07ad', 'flaviasilvadeazevedo@hotmail.com', 1, 1, 1, 1, '', 1, NULL, NULL, 0),
(49, 'Elielsa Marques Oliveira', 'Elielsa', '72.393-3', '25d55ad283aa400af464c76d713c07ad', 'elielsamarquesoliveira@gmail.com', 1, 1, 1, 1, '', 1, NULL, NULL, 0),
(50, 'Ana Amélia', 'Ana Amélia', '72.289-3', '25d55ad283aa400af464c76d713c07ad', 'ana_filemon@yahoo.com.br', 2, 1, 2, 1, '', 1, NULL, NULL, 0),
(51, 'Nicarla Santana', 'Nicarla', '', '25d55ad283aa400af464c76d713c07ad', 'nicarlasantana@gmail.com', 2, 1, 1, 1, '', 1, NULL, NULL, 0),
(52, 'Elizete', 'Elizete', '', '25d55ad283aa400af464c76d713c07ad', 'elizeteasocial@hotmail.com', 1, 1, 2, 1, '', 1, NULL, NULL, 0),
(53, 'Manu', 'Manu', '', '25d55ad283aa400af464c76d713c07ad', 'manuzinha10@hotmail.com', 1, 1, 1, 1, '', 1, NULL, NULL, 0),
(54, 'Mikaely Lisiane Dias de Aquino Oliveira', 'Mikaely', '72.364-9', '25d55ad283aa400af464c76d713c07ad', 'mikaelydias@gmail.com', 1, 1, 2, 1, '(84) 9 8813-1136', 1, NULL, NULL, 0),
(56, 'Valéria de Oliveira Ferreira', 'Valéria', '', 'd4709b1128c899d457522f6962921939', 'valeris.oliveira10@gmail.com', 1, 1, 1, 1, '', 1, NULL, NULL, 0),
(57, 'Irene Ferreira da Silva', 'Irene', '', '25d55ad283aa400af464c76d713c07ad', 'irene.psicologia30@gmail.com', 1, 1, 1, 1, '', 1, NULL, NULL, 0),
(58, 'Janaine Mary de Moura', 'Janaine', '50.812-8', '25d55ad283aa400af464c76d713c07ad', 'janaine18@gmail.com', 1, 1, 3, 1, '', 1, NULL, NULL, 0),
(61, 'Isadora Beatriz Lucena de Medeiros', 'Isa', '', '$2y$10$3/uVy7/jsxDOTF4bk4AgyuH7N3Aak8M6iCeBNRfMFl6qSW9UYd70a', 'isadorabeatriz595@gmail.com', 1, 1, 1, 1, NULL, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_atendimentos_semanais`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_atendimentos_semanais` (
`atendimentos` bigint(21)
,`tipo` varchar(12)
,`dia` varchar(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_timeline_mulher`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_timeline_mulher` (
`mulher` int(11)
,`data` varchar(45)
,`descricao` varchar(431)
,`tipo` varchar(2)
,`codigo` varchar(11)
,`idade` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_tipo_atendimento`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_tipo_atendimento` (
`codigo` int(11)
,`tipo` varchar(12)
);

-- --------------------------------------------------------

--
-- Estrutura para view `abrigamentos`
--
DROP TABLE IF EXISTS `abrigamentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mulheresapp`@`localhost` SQL SECURITY DEFINER VIEW `abrigamentos`  AS SELECT `tb_mulheres`.`mul_codigo` AS `Código`, `tb_mulheres`.`mul_nome` AS `Nome`, `tb_mulheres`.`mul_cpf` AS `CPF`, `tb_mulheres`.`mul_rg` AS `RG`, `tb_mulheres`.`mul_prontuario` AS `Prontuário`, `h`.`tec_nome` AS `Técnico de Referência`, `i`.`tec_nome` AS `Técnico responsável pelo Abrigamento`, `tb_mulheres`.`mul_telefone1` AS `Telefone 1`, `tb_mulheres`.`mul_telefone2` AS `Telefone 2`, `tb_mulheres`.`mul_email` AS `E-mail`, `a`.`alt_alternativa` AS `Encaminhada de`, `b`.`alt_alternativa` AS `Religião`, `c`.`alt_alternativa` AS `Cor`, `d`.`alt_alternativa` AS `Estado Civil`, date_format(`tb_mulheres`.`mul_data_nasc`,'%d/%m/%Y') AS `Data Nascimento`, timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,current_timestamp()) AS `Idade`, `tb_mulheres`.`mul_endereco` AS `Endereço`, `e`.`alt_alternativa` AS `Bairro`, `f`.`alt_alternativa` AS `Cidade`, `g`.`alt_alternativa` AS `Faixa Salarial`, (select count(0) from `tb_componentes_abrigamento` where `tb_componentes_abrigamento`.`cab_abr_codigo` = `tb_abrigamentos`.`abr_codigo`) AS `Quantidade de Dependentes`, 1 + (select count(0) from `tb_componentes_abrigamento` where `tb_componentes_abrigamento`.`cab_abr_codigo` = `tb_abrigamentos`.`abr_codigo`) AS `Total de Abrigados`, `tb_abrigamentos`.`abr_data_inicio` AS `Início do Abrigamento1`, `tb_abrigamentos`.`abr_data_fim` AS `Fim do Abrigamento1`, `tb_abrigamentos`.`abr_roldepertences` AS `Pertences`, date_format(`tb_abrigamentos`.`abr_data_inicio`,'%d/%m/%Y %H:%i') AS `Início do Abrigamento`, date_format(`tb_abrigamentos`.`abr_data_fim`,'%d/%m/%Y %H:%i') AS `Fim do Abrigamento`, NULL AS `Nulo`, current_timestamp() AS `Agora` FROM ((((((((((`tb_abrigamentos` join `tb_mulheres` on(`tb_mulheres`.`mul_codigo` = `tb_abrigamentos`.`abr_mul_codigo`)) left join `tb_tecnicos` `h` on(`h`.`tec_codigo` = `tb_mulheres`.`mul_tec_codigo`)) left join `tb_tecnicos` `i` on(`i`.`tec_codigo` = `tb_abrigamentos`.`abr_tec_codigo`)) left join `tb_alternativas` `a` on(`a`.`alt_codigo` = `tb_mulheres`.`mul_encaminhada`)) left join `tb_alternativas` `b` on(`b`.`alt_codigo` = `tb_mulheres`.`mul_religiao`)) left join `tb_alternativas` `c` on(`c`.`alt_codigo` = `tb_mulheres`.`mul_cor`)) left join `tb_alternativas` `d` on(`d`.`alt_codigo` = `tb_mulheres`.`mul_estado_civil`)) left join `tb_alternativas` `e` on(`e`.`alt_codigo` = `tb_mulheres`.`mul_bairro`)) left join `tb_alternativas` `f` on(`f`.`alt_codigo` = `tb_mulheres`.`mul_cidade`)) left join `tb_alternativas` `g` on(`g`.`alt_codigo` = `tb_mulheres`.`mul_faixa_salarial`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `atendimentos`
--
DROP TABLE IF EXISTS `atendimentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mulheresapp`@`localhost` SQL SECURITY DEFINER VIEW `atendimentos`  AS SELECT `tb_atendimentos`.`ate_data` AS `Data1`, date_format(`tb_atendimentos`.`ate_data`,'%d/%m/%Y %H:%i') AS `Data`, `a`.`tec_apelido` AS `Técnico 1`, `b`.`tec_apelido` AS `Técnico 2`, `b`.`tec_apelido` AS `Técnico Referência`, `tb_mulheres`.`mul_nome` AS `Nome Mulher`, `tb_atendimentos`.`ate_resumo` AS `Resumo`, `tb_mulheres`.`mul_codigo` AS `Código da Mulher`, `vw_tipo_atendimento`.`tipo` AS `Tipo do Atendimento` FROM (((((`tb_atendimentos` join `tb_mulheres` on(`tb_atendimentos`.`ate_mul_codigo` = `tb_mulheres`.`mul_codigo`)) join `tb_tecnicos` `a` on(`a`.`tec_codigo` = `tb_atendimentos`.`ate_tec_codigo1`)) join `tb_tecnicos` `b` on(`b`.`tec_codigo` = `tb_atendimentos`.`ate_tec_codigo2`)) join `tb_tecnicos` `c` on(`c`.`tec_codigo` = `tb_mulheres`.`mul_tec_codigo`)) join `vw_tipo_atendimento` on(`vw_tipo_atendimento`.`codigo` = `tb_atendimentos`.`ate_codigo`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `mulheres`
--
DROP TABLE IF EXISTS `mulheres`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mulheresapp`@`localhost` SQL SECURITY DEFINER VIEW `mulheres`  AS SELECT `tb_mulheres`.`mul_nome` AS `Nome`, `tb_mulheres`.`mul_cpf` AS `CPF`, `tb_mulheres`.`mul_rg` AS `RG`, `tb_mulheres`.`mul_prontuario` AS `Prontuário`, `tb_tecnicos`.`tec_nome` AS `Técnico de Referência`, `tb_mulheres`.`mul_telefone1` AS `Telefone 1`, `tb_mulheres`.`mul_telefone2` AS `Telefone 2`, `tb_mulheres`.`mul_email` AS `E-mail`, `a`.`alt_alternativa` AS `Encaminhada de`, `b`.`alt_alternativa` AS `Religião`, `c`.`alt_alternativa` AS `Cor`, `d`.`alt_alternativa` AS `Estado Civil`, date_format(`tb_mulheres`.`mul_data_nasc`,'%d/%m/%Y') AS `Data Nascimento`, timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,current_timestamp()) AS `Idade`, `tb_mulheres`.`mul_endereco` AS `Endereço`, `e`.`alt_alternativa` AS `Bairro`, `f`.`alt_alternativa` AS `Cidade`, `g`.`alt_alternativa` AS `Faixa Salarial`, CASE WHEN `tb_mulheres`.`mul_ja_abrigada` = 0 THEN 'Não' ELSE 'Sim' END AS `Já foi abrigada`, CASE WHEN `tb_mulheres`.`mul_atualmente_em_uso` = 0 THEN 'Não' ELSE 'Sim' END AS `Usa Psicotrópicos`, CASE WHEN `tb_mulheres`.`mul_psiquiatra` = 0 THEN 'Não' ELSE 'Sim' END AS `Atendimento Psiquiátrico`, CASE WHEN `tb_mulheres`.`mul_psicologo` = 0 THEN 'Não' ELSE 'Sim' END AS `Atendimento Psicológico`, CASE WHEN `tb_mulheres`.`mul_drogas` = 0 THEN 'Não' ELSE 'Sim' END AS `Substâncias psicoativas`, (select date_format(`tb_atendimentos`.`ate_data`,'%d/%m/%Y') from `tb_atendimentos` where `tb_atendimentos`.`ate_mul_codigo` = `tb_mulheres`.`mul_codigo` order by `tb_atendimentos`.`ate_data` desc limit 1) AS `Último atendimento`, (select date_format(`tb_agressores`.`agr_data_inicio_agressoes`,'%d/%m/%Y') from `tb_agressores` where `tb_agressores`.`agr_mul_codigo` = `tb_mulheres`.`mul_codigo` order by `tb_agressores`.`agr_data_inicio_agressoes` desc limit 1) AS `Início das Agressões` FROM ((((((((`tb_mulheres` left join `tb_tecnicos` on(`tb_tecnicos`.`tec_codigo` = `tb_mulheres`.`mul_tec_codigo`)) left join `tb_alternativas` `a` on(`a`.`alt_codigo` = `tb_mulheres`.`mul_encaminhada`)) left join `tb_alternativas` `b` on(`b`.`alt_codigo` = `tb_mulheres`.`mul_religiao`)) left join `tb_alternativas` `c` on(`c`.`alt_codigo` = `tb_mulheres`.`mul_cor`)) left join `tb_alternativas` `d` on(`d`.`alt_codigo` = `tb_mulheres`.`mul_estado_civil`)) left join `tb_alternativas` `e` on(`e`.`alt_codigo` = `tb_mulheres`.`mul_bairro`)) left join `tb_alternativas` `f` on(`f`.`alt_codigo` = `tb_mulheres`.`mul_cidade`)) left join `tb_alternativas` `g` on(`g`.`alt_codigo` = `tb_mulheres`.`mul_faixa_salarial`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_atendimentos_semanais`
--
DROP TABLE IF EXISTS `vw_atendimentos_semanais`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mulheresapp`@`localhost` SQL SECURITY DEFINER VIEW `vw_atendimentos_semanais`  AS SELECT count(0) AS `atendimentos`, `vw_tipo_atendimento`.`tipo` AS `tipo`, date_format(`tb_atendimentos`.`ate_data` + interval 2 - dayofweek(`tb_atendimentos`.`ate_data`) day,'%d/%m/%Y') AS `dia` FROM (`tb_atendimentos` join `vw_tipo_atendimento` on(`vw_tipo_atendimento`.`codigo` = `tb_atendimentos`.`ate_codigo`)) WHERE cast(`tb_atendimentos`.`ate_data` as date) between curdate() + interval -49 day and curdate() GROUP BY date_format(`tb_atendimentos`.`ate_data` + interval 2 - dayofweek(`tb_atendimentos`.`ate_data`) day,'%d/%m/%Y'), `vw_tipo_atendimento`.`tipo` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_timeline_mulher`
--
DROP TABLE IF EXISTS `vw_timeline_mulher`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mulheresapp`@`localhost` SQL SECURITY DEFINER VIEW `vw_timeline_mulher`  AS SELECT `tb_mulheres`.`mul_codigo` AS `mulher`, `tb_mulheres`.`mul_data_nasc` AS `data`, 'Nascimento' AS `descricao`, '1' AS `tipo`, '0' AS `codigo`, timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_mulheres`.`mul_data_nasc`) AS `idade` FROM `tb_mulheres`union select `tb_mulheres`.`mul_codigo` AS `mulher`,`tb_mulheres`.`mul_estado_civil_data` AS `data`,concat('Mudou estado civil para <b>',`tb_alternativas`.`alt_alternativa`,'</b>') AS `descricao`,'2' AS `tipo`,'0' AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_mulheres`.`mul_estado_civil_data`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, mul_estado_civil_data)` from (`tb_mulheres` join `tb_alternativas` on(`tb_alternativas`.`alt_codigo` = `tb_mulheres`.`mul_estado_civil`)) where `tb_mulheres`.`mul_estado_civil_data` is not null union select `tb_atendimentos`.`ate_mul_codigo` AS `mulher`,`tb_atendimentos`.`ate_data` AS `data`,concat('Atendimento por <b>',`tb_tecnicos`.`tec_apelido`,'</b>: ',`tb_atendimentos`.`ate_resumo`) AS `descricao`,'3' AS `tipo`,`tb_atendimentos`.`ate_codigo` AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_atendimentos`.`ate_data`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, ate_data)` from ((`tb_atendimentos` join `tb_tecnicos` on(`tb_atendimentos`.`ate_tec_codigo1` = `tb_tecnicos`.`tec_codigo`)) join `tb_mulheres` on(`tb_atendimentos`.`ate_mul_codigo` = `tb_mulheres`.`mul_codigo`)) union select `tb_mulheres`.`mul_codigo` AS `mulher`,`tb_mulheres`.`mul_data_desempregada` AS `data`,'Ficou <b>desempregada</b>' AS `descricao`,'4' AS `tipo`,'0' AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_mulheres`.`mul_data_desempregada`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, mul_data_desempregada)` from `tb_mulheres` where `tb_mulheres`.`mul_data_desempregada` is not null union select `tb_mulheres`.`mul_codigo` AS `mulher`,`tb_mulheres`.`mul_psiquiatra_data` AS `data`,'Iniciou acompanhamento <b>psiquiatrico</b>' AS `descricao`,'5' AS `tipo`,'0' AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_mulheres`.`mul_psiquiatra_data`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, mul_psiquiatra_data)` from `tb_mulheres` where `tb_mulheres`.`mul_psiquiatra_data` is not null union select `tb_mulheres`.`mul_codigo` AS `mulher`,`tb_mulheres`.`mul_psicologo_data` AS `data`,'Iniciou acompanhamento <b>psicológico</b>' AS `descricao`,'6' AS `tipo`,'0' AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_mulheres`.`mul_psicologo_data`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, mul_psicologo_data)` from `tb_mulheres` where `tb_mulheres`.`mul_psicologo_data` is not null union select `tb_mulheres`.`mul_codigo` AS `mulher`,`tb_mulheres`.`mul_droga_data` AS `data`,concat('Iniciou o uso de <b>substância psicoativa</b> (',`tb_mulheres`.`mul_droga_qual`,')') AS `descricao`,'7' AS `tipo`,'0' AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_mulheres`.`mul_droga_data`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, mul_droga_data)` from `tb_mulheres` where `tb_mulheres`.`mul_droga_data` is not null union select `tb_agressores`.`agr_mul_codigo` AS `mulher`,`tb_agressores`.`agr_data_inicio_agressoes` AS `data`,concat('Início das Agreções por <b>',`tb_agressores`.`agr_nome`,'</b>') AS `descricao`,'8' AS `tipo`,`tb_agressores`.`agr_codigo` AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_agressores`.`agr_data_inicio_agressoes`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, agr_data_inicio_agressoes)` from (`tb_agressores` join `tb_mulheres` on(`tb_agressores`.`agr_mul_codigo` = `tb_mulheres`.`mul_codigo`)) union select `tb_agressores`.`agr_mul_codigo` AS `mulher`,`tb_agressores`.`agr_data_bo` AS `data`,concat('Feito BO contra <b>',`tb_agressores`.`agr_nome`,'</b>') AS `descricao`,'9' AS `tipo`,`tb_agressores`.`agr_codigo` AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_agressores`.`agr_data_bo`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, agr_data_bo)` from (`tb_agressores` join `tb_mulheres` on(`tb_agressores`.`agr_mul_codigo` = `tb_mulheres`.`mul_codigo`)) union select `tb_agressores`.`agr_mul_codigo` AS `mulher`,`tb_agressores`.`agr_data_medida` AS `data`,concat('Obteve medida protetiva contra <b>',`tb_agressores`.`agr_nome`,'</b>') AS `descricao`,'10' AS `tipo`,`tb_agressores`.`agr_codigo` AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_agressores`.`agr_data_medida`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, agr_data_medida)` from (`tb_agressores` join `tb_mulheres` on(`tb_agressores`.`agr_mul_codigo` = `tb_mulheres`.`mul_codigo`)) union select `tb_pessoas`.`pes_mul_codigo` AS `mulher`,`tb_pessoas`.`pes_data_nasc` AS `data`,concat('Nascimento do <b>filho</b> ',`tb_pessoas`.`pes_nome`) AS `descricao`,'11' AS `tipo`,`tb_pessoas`.`pes_codigo` AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_pessoas`.`pes_data_nasc`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, pes_data_nasc)` from ((`tb_pessoas` join `tb_alternativas` on(`tb_alternativas`.`alt_codigo` = `tb_pessoas`.`pes_grau_parentesco`)) join `tb_mulheres` on(`tb_pessoas`.`pes_mul_codigo` = `tb_mulheres`.`mul_codigo`)) where `tb_alternativas`.`alt_alternativa` in ('Filho','filho') union select `tb_pessoas`.`pes_mul_codigo` AS `mulher`,`tb_pessoas`.`pes_data_nasc` AS `data`,concat('Nascimento da <b>filha</b> ',`tb_pessoas`.`pes_nome`) AS `descricao`,'11' AS `tipo`,`tb_pessoas`.`pes_codigo` AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_pessoas`.`pes_data_nasc`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, pes_data_nasc)` from ((`tb_pessoas` join `tb_alternativas` on(`tb_alternativas`.`alt_codigo` = `tb_pessoas`.`pes_grau_parentesco`)) join `tb_mulheres` on(`tb_pessoas`.`pes_mul_codigo` = `tb_mulheres`.`mul_codigo`)) where `tb_alternativas`.`alt_alternativa` in ('Filha','filha') union select `tb_abrigamentos`.`abr_mul_codigo` AS `mulher`,`tb_abrigamentos`.`abr_data_inicio` AS `data`,'Abrigada na <b>CACC</b>' AS `descricao`,'12' AS `tipo`,`tb_abrigamentos`.`abr_codigo` AS `codigo`,timestampdiff(YEAR,`tb_mulheres`.`mul_data_nasc`,`tb_abrigamentos`.`abr_data_inicio`) AS `TIMESTAMPDIFF(YEAR, mul_data_nasc, abr_data_inicio)` from (`tb_abrigamentos` join `tb_mulheres` on(`tb_abrigamentos`.`abr_mul_codigo` = `tb_mulheres`.`mul_codigo`))  ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_tipo_atendimento`
--
DROP TABLE IF EXISTS `vw_tipo_atendimento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mulheresapp`@`localhost` SQL SECURITY DEFINER VIEW `vw_tipo_atendimento`  AS SELECT `tb_atendimentos`.`ate_codigo` AS `codigo`, CASE WHEN `a`.`tec_car_codigo` = 2 AND `b`.`tec_car_codigo` = 3 THEN 'Psicossocial' WHEN `a`.`tec_car_codigo` = 3 AND `b`.`tec_car_codigo` = 2 THEN 'Psicossocial' WHEN `a`.`tec_car_codigo` = 2 AND `b`.`tec_car_codigo` = 2 THEN 'Social' WHEN `a`.`tec_car_codigo` = 3 AND `b`.`tec_car_codigo` = 3 THEN 'Psicológico' WHEN `a`.`tec_car_codigo` = 4 AND `b`.`tec_car_codigo` = 4 THEN 'Jurídico' WHEN `a`.`tec_car_codigo` = 3 OR `b`.`tec_car_codigo` = 3 THEN 'Psicológico' WHEN `a`.`tec_car_codigo` = 2 OR `b`.`tec_car_codigo` = 2 THEN 'Social' WHEN `a`.`tec_car_codigo` = 4 OR `b`.`tec_car_codigo` = 4 THEN 'Jurídico' ELSE 'Outro' END AS `tipo` FROM ((`tb_atendimentos` join `tb_tecnicos` `a` on(`a`.`tec_codigo` = `tb_atendimentos`.`ate_tec_codigo1`)) left join `tb_tecnicos` `b` on(`b`.`tec_codigo` = `tb_atendimentos`.`ate_tec_codigo2`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mulher_codigo` (`mulher_codigo`);

--
-- Índices de tabela `relatorios`
--
ALTER TABLE `relatorios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `tblreports`
--
ALTER TABLE `tblreports`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_mulheres`
--
ALTER TABLE `tb_mulheres`
  ADD PRIMARY KEY (`mul_codigo`);

--
-- Índices de tabela `tb_tecnicos`
--
ALTER TABLE `tb_tecnicos`
  ADD PRIMARY KEY (`tec_codigo`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `relatorios`
--
ALTER TABLE `relatorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tblreports`
--
ALTER TABLE `tblreports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tb_mulheres`
--
ALTER TABLE `tb_mulheres`
  MODIFY `mul_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `tb_tecnicos`
--
ALTER TABLE `tb_tecnicos`
  MODIFY `tec_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`mulher_codigo`) REFERENCES `tb_mulheres` (`mul_codigo`) ON DELETE CASCADE;

--
-- Restrições para tabelas `relatorios`
--
ALTER TABLE `relatorios`
  ADD CONSTRAINT `relatorios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
