<?php 
ob_start();
session_start();

// Configurações de Conexão ao Banco de Dados
$endereco = "localhost";  // Endereço do servidor MySQL
$usuario = "root";  // Usuário MySQL
$senha = "";  // Senha do MySQL (vazia, se for local)
$banco = "mulheresapp_relatorios";  // Nome do banco de dados
$MySQLi = new mysqli($endereco, $usuario, $senha, $banco, 3306);  // Conectando ao banco de dados



// Verificando conexão
if ($MySQLi->connect_errno) {
    die("Falha na conexão: " . $MySQLi->connect_error);
    exit();
}

// Definindo o fuso horário e charset
date_default_timezone_set('America/Sao_Paulo');
$MySQLi->set_charset("utf8");

// Funções de formatação de data e hora
function data($data) {
    return date("d/m/Y", strtotime($data));
}

function hora($data) {
    return date("d/m/Y H:i", strtotime($data));
}

function day($data) {
    return date("Y-m-d", strtotime($data));
}

function tempo($data) {
    return date("H:i", strtotime($data));
}

function mes($data) {
    return date("Y-m", strtotime($data));
}

// Função para formatar a data em português
function dataEmPortugues($timestamp) {
    $dia_mes = date("d", $timestamp);  // Dia do mês
    $mes_num = date("m", $timestamp);  // Número do mês

    // Associando números dos meses aos nomes em português
    $meses = [
        1 => "Janeiro", 2 => "Fevereiro", 3 => "Março", 4 => "Abril",
        5 => "Maio", 6 => "Junho", 7 => "Julho", 8 => "Agosto",
        9 => "Setembro", 10 => "Outubro", 11 => "Novembro", 12 => "Dezembro"
    ];

    $mes_nome = $meses[(int)$mes_num];  // Convertendo o número do mês para o nome
    return $dia_mes . " de " . $mes_nome;
}

// Função para datas na timeline das mulheres
function datamulher($timestamp) {
    $dia_mes = date("d", $timestamp);  // Dia do mês
    $mes_num = date("m", $timestamp);  // Número do mês
    $ano = date("Y", $timestamp);  // Ano

    // Associando números dos meses aos nomes em português
    $meses = [
        1 => "Janeiro", 2 => "Fevereiro", 3 => "Março", 4 => "Abril",
        5 => "Maio", 6 => "Junho", 7 => "Julho", 8 => "Agosto",
        9 => "Setembro", 10 => "Outubro", 11 => "Novembro", 12 => "Dezembro"
    ];

    $mes_nome = $meses[(int)$mes_num];  // Convertendo o número do mês para o nome
    return $mes_nome . ' de ' . $ano;
}

?>
