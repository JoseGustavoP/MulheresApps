<?php
// arquivo que utiliza a conexão
include('config.php'); // Inclui as configurações, como a conexão com o banco de dados

// Verifica se a conexão com o banco de dados foi estabelecida
if ($MySQLi) {
    // Verifica se o código do usuário foi passado
    if (isset($_GET['codigousuarioconectado'])) {
        $codigoUsuario = $_GET['codigousuarioconectado'];

        // Consulta SQL para buscar os relatórios do usuário
        $sql = "SELECT * FROM relatorios WHERE usuario_id = ?";
        $stmt = $MySQLi->prepare($sql);
        $stmt->bind_param("i", $codigoUsuario); // "i" indica que $codigoUsuario é um inteiro
        $stmt->execute();
        $relatorios = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

        // Verifica se existem relatórios para esse usuário
        if ($relatorios) {
            echo "<h1>Relatórios do Usuário $codigoUsuario</h1>";
            echo "<ul>";
            foreach ($relatorios as $relatorio) {
                echo "<li><strong>" . htmlspecialchars($relatorio['titulo']) . "</strong>: " . htmlspecialchars($relatorio['descricao']) . "</li>";
            }
            echo "</ul>";
        } else {
            echo "Nenhum relatório encontrado para este usuário.";
        }
    } else {
        echo "Código de usuário não fornecido.";
    }
} else {
    echo "Erro: Conexão com o banco de dados não estabelecida.";
}
?>
