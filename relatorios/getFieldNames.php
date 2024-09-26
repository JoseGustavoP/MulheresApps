<?php
require_once('includes/config.php');

// Verifica se a tabela foi passada
if (!isset($_POST["tableName"])) {
    die("Nome da tabela não fornecido.");
}

$tableName = $_POST["tableName"];
if (empty($tableName)) {
    die("Nome da tabela está vazio.");
}

// Imprime o nome da tabela para debug
echo "Tabela: " . htmlspecialchars($tableName);

// Verifica as tabelas existentes
$tabelas = $mysqli_natal->query("SHOW TABLES");
$tabelasExistentes = [];
while ($row = $tabelas->fetch_array(MYSQLI_NUM)) {
    $tabelasExistentes[] = $row[0]; // Adiciona os nomes das tabelas ao array
}

if (!in_array($tableName, $tabelasExistentes)) {
    die("Tabela não encontrada: " . htmlspecialchars($tableName));
}

// Usa a conexão mysqli
$query_recGetFields = "SHOW COLUMNS FROM " . $mysqli_natal->real_escape_string($tableName);
$recGetFields = $mysqli_natal->query($query_recGetFields);

if (!$recGetFields) {
    die(dmyError());
}
?>
<select name="lstAllFields" size="10" multiple id="lstAllFields" class="form-control">
    <?php while ($row_recGetFields = $recGetFields->fetch_array(MYSQLI_ASSOC)) { ?>
        <option value="<?php echo ($_POST["tableName"] . ".`" . $row_recGetFields['Field'] . "`"); ?>">
            <?php echo $row_recGetFields['Field']; ?>
        </option>
    <?php } ?>
</select>
<a href="javascript:cmdSelectFields_onclick();" name="cmdSelectFields" type="button" id="cmdSelectFields" class="btn btn-block bg-gradient-primary">
    <i class="fas fa-arrow-down"></i> Adicionar Coluna
</a>
<?php
$recGetFields->free(); // Libera o resultado
?>
