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
-- Banco de dados: `mulheresapp_relatorios`
--

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
(8, '`Abrigamentos`.`Fim do Abrigamento` is null ~OR `Abrigamentos`.`Fim do Abrigamento` >= now() ~', 'Abrigadas atualmente', '`Abrigamentos`.`Nome`', 'ASC', NULL, '`Abrigamentos`.`Nome`~`Abrigamentos`.`Início do Abrigamento`~`Abrigamentos`.`Fim do Abrigamento`~`Abrigamentos`.`CPF`~`Abrigamentos`.`Idade`~`Abrigamentos`.`Bairro`~`Abrigamentos`.`Cidade`~`Abrigamentos`.`Quantidade de Dependentes`~', '`Abrigamentos`~', 0),
(11, '`Mulheres`.`Bairro` <> \'\'    ~', 'Mulheres Por Bairro', '`Mulheres`.`Bairro`', 'ASC', NULL, '`Mulheres`.`Bairro`~`Mulheres`.`Nome`~`Mulheres`.`Idade`~`Mulheres`.`Último atendimento`~', '`Mulheres`~', 0),
(12, NULL, 'Atendimentos', '`Atendimentos`.`Data1`', 'DESC', NULL, '`Atendimentos`.`Tipo do Atendimento`~`Atendimentos`.`Data`~`Atendimentos`.`Técnico 1`~`Atendimentos`.`Técnico 2`~`Atendimentos`.`Nome Mulher`~`Atendimentos`.`Resumo`~', '`Atendimentos`~', 0),
(13, NULL, 'Todas as Abrigadas', NULL, NULL, NULL, '`Abrigamentos`.`Nome`~`Abrigamentos`.`CPF`~`Abrigamentos`.`Técnico responsável pelo Abrigamento`~`Abrigamentos`.`Telefone 1`~`Abrigamentos`.`Idade`~`Abrigamentos`.`Bairro`~`Abrigamentos`.`Faixa Salarial`~`Abrigamentos`.`Quantidade de Dependentes`~`Abrigamentos`.`Início do Abrigamento`~`Abrigamentos`.`Fim do Abrigamento`~', '`Abrigamentos`~', 0),
(14, NULL, 'RELATÓRIO MENSAL DE ABRIGAMENTO', '`Abrigamentos`.`Início do Abrigamento1`', 'ASC', NULL, '`Abrigamentos`.`Nome`~`Abrigamentos`.`CPF`~`Abrigamentos`.`Início do Abrigamento1`~`Abrigamentos`.`Fim do Abrigamento1`~', '`Abrigamentos`~', 0),
(50, NULL, 'teste', NULL, NULL, NULL, 'tb_agressores.`agr_nome`~tb_mulheres.`mul_nome`~', '`tb_agressores`~`tb_mulheres`', 0),
(51, NULL, 'Inicio dos abrigamentos', NULL, NULL, NULL, 'tb_abrigamentos.`abr_data_inicio`~', '`tb_abrigamentos`', 0),
(52, NULL, 'czdasdas', NULL, NULL, NULL, 'tb_cargos.`car_codigo`~tb_cargos.`car_cargo`~', '`tb_cargos`', 0),
(53, NULL, 'Teste de atendimentos', NULL, NULL, NULL, 'tb_atendimentos.`ate_relatorio`~tb_atendimentos.`ate_data`~tb_atendimentos.`ate_codigo`~', '`tb_atendimentos`', 0),
(54, NULL, 'Testess', NULL, NULL, NULL, 'tb_mulheres.`mul_nome`~tb_mulheres.`mul_cpf`~', '`tb_mulheres`', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

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
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `relatorios`
--
ALTER TABLE `relatorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tblreports`
--
ALTER TABLE `tblreports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `relatorios`
--
ALTER TABLE `relatorios`
  ADD CONSTRAINT `relatorios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
