<?php
session_start();
require_once('includes/config.php');

// Ensure $dbVisTables is defined
if (!isset($dbVisTables)) {
    die("A variável dbVisTables não está definida. Verifique o arquivo config.php.");
}

// Explode dbVisTables into an array
$visTables = explode(",", $dbVisTables);
if (count($visTables) == 1) {
    if ($visTables[0] != "") {
        $_SESSION['selectedTables'] = "`" . $visTables[0] . "`";
        header("Location:selectFields.php");
        exit; // Exit after header to prevent further execution
    }
}

// Use the already created mysqli connection for mulheresapp_natal
$connDB = $mysqli_natal;

// Check the connection
if ($connDB->connect_error) {
    die("Connection failed: " . $connDB->connect_error);
}

// Get tables
$query_recGetTables = "SHOW TABLES";
$recGetTables = $connDB->query($query_recGetTables);

// Check if query was successful
if (!$recGetTables) {
    die("Query failed: " . $connDB->error);
}

// Get the first row of results
$row_recGetTables = $recGetTables->fetch_array();
$totalRows_recGetTables = $recGetTables->num_rows;

// Remaining code...
$design_titulo = "Relatórios";
$design_ativo = "r3";
$design_migalha1_texto = "Relatórios";
$design_migalha1_link = "index.php";
$design_migalha2_texto = "Editar: Parte 1";
$design_migalha2_link = "";

include("design1.php");
?>

<script language="javascript" type="text/javascript">
function cmdSelectTables_onclick() {
    var lstAllTables = document.getElementById('lstAllTables');
    var lstTables = document.getElementById('lstTables');
    
    // Move todos os itens selecionados
    for (var i = lstAllTables.options.length - 1; i >= 0; i--) {
        if (lstAllTables.options[i].selected) {
            var option = lstAllTables.options[i];
            lstTables.appendChild(option); // Move a opção
        }
    }
    updateHiddenField();
}

function cmdRemoveTables_onclick() {
    var lstTables = document.getElementById('lstTables');
    var lstAllTables = document.getElementById('lstAllTables');
    
    // Move todos os itens selecionados de volta
    for (var i = lstTables.options.length - 1; i >= 0; i--) {
        if (lstTables.options[i].selected) {
            var option = lstTables.options[i];
            lstAllTables.appendChild(option); // Move a opção de volta
        }
    }
    updateHiddenField();
}

function updateHiddenField() {
    var lstTables = document.getElementById('lstTables');
    var selectedTables = [];
    
    for (var i = 0; i < lstTables.options.length; i++) {
        selectedTables.push(lstTables.options[i].value);
    }
    
    // Atualiza o campo oculto
    document.getElementById('selectedTables').value = selectedTables.join('~');
    
    // Habilita o botão Avançar se houver tabelas selecionadas
    document.getElementById('cmdNext').disabled = selectedTables.length === 0;
}

function cmdNew_onClick() {
    var tmpVal = confirm("Confirme a Ação");

    if (tmpVal) {
        // Redefine as variáveis de sessão
        <?php
        $_SESSION['selectedTables'] = '';
        $_SESSION['selectedFields'] = '';
        ?>
        window.location.href = "selectFields.php"; // Ou o nome da página que você deseja redirecionar
    }
}
</script>

<section class="content">
    <div class="container-fluid">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Selecione a(s) tabela(s) que compõem este relatório</h3>
            </div>
            <div class="card-body">
                <?php if (isset($_SESSION['txtReportName']) && $_SESSION['txtReportName'] != "") {
                    echo "<h2>Edição: " . $_SESSION['txtReportName'] . "</h2>";
                } else {
                    echo "<h2>Novo Relatório</h2>";
                } ?>

                <div class="row">
                    <div class="col-md-5 col-12">
                        Lista de tabelas disponíveis
                        <select name="lstAllTables" size="10" multiple id="lstAllTables" class='form-control'>
                            <?php
                            do {
                                if ($dbVisTables != "") {
                                    $visTables = explode(",", $dbVisTables);
                                    for ($x = 0; $x < count($visTables); $x++) {
                                        if ($row_recGetTables[0] == trim($visTables[$x])) {
                                            ?>
                                            <option value="<?php echo "`" . $row_recGetTables[0] . "`"; ?>"><?php echo $row_recGetTables[0]; ?></option>
                                            <?php
                                        }
                                    }
                                } else {
                                    ?>
                                    <option value="<?php echo "`" . $row_recGetTables[0] . "`"; ?>"><?php echo $row_recGetTables[0]; ?></option>
                                    <?php
                                }
                            } while ($row_recGetTables = mysqli_fetch_array($recGetTables));
                            ?>
                        </select>
                    </div>

                    <div class="col-md-2 col-12 card-body text-center">
                        <a href="javascript:void(0);" class="btn btn-sm btn-primary m-2" onclick="cmdSelectTables_onclick();"><i class="fas fa-arrow-right"></i></a><br>
                        <a href="javascript:void(0);" class="btn btn-sm btn-primary" onclick="cmdRemoveTables_onclick();"><i class="fas fa-arrow-left"></i></a>
                    </div>

                    <div class="col-md-5 col-12">
                        Tabelas selecionadas
                        <select name="lstTables" size="10" multiple id="lstTables" class='form-control' onchange="updateHiddenField();">
                            <?php
                            $tmpTables = explode("~", $_SESSION['selectedTables']);
                            for ($x = 0; $x < count($tmpTables); $x++) {
                                if ($tmpTables[$x] != "") {
                                    ?>
                                    <option value="<?php echo $tmpTables[$x]; ?>"><?php echo $tmpTables[$x]; ?></option>
                                    <?php
                                }
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <br>

                <form action="selectFields.php" method="post" name="frmTables" id="frmTables">
                    <div class="margin">
                        <button name="cmdNew" type="button" class="btn btn-info" id="cmdNew" onclick="cmdNew_onClick();"><i class="fas fa-file"></i> Reiniciar como novo relatório</button>
                        <button name="cmdBack" type="button" class="btn btn-success m-2" id="cmdBack" onclick="jumpURL('index.php');"><i class="fas fa-arrow-left"></i> Voltar</button>
                        <button name="cmdNext" type="submit" class="btn btn-success" id="cmdNext" disabled>Avançar <i class="fas fa-arrow-right"></i></button>
                    </div>
                    <input name="selectedTables" type="hidden" id="selectedTables" value="<?php echo ($_SESSION['selectedTables']); ?>">
                </form>
            </div>
        </div>
    </div>
</section>

<style>
  /* Estilo para garantir que o conteúdo principal não fique atrás da sidebar */
  .content {
    margin-left: 250px;
    /* Ajuste de acordo com a largura da sidebar */
    padding: 20px;
    /* Espaçamento interno para o conteúdo */
  }

  /* Sidebar fixa */
  .main-sidebar {
    position: fixed;
    /* Manter a sidebar fixa */
    height: 100%;
    /* Ocupa toda a altura da página */
    overflow-y: auto;
    /* Rolagem vertical se necessário */
  }

  /* Wrapper para flexbox */
  .wrapper {
    display: flex;
    /* Flexbox para melhor layout */
  }

  /* Estilos responsivos */
  @media (max-width: 768px) {
    .content {
      margin-left: 0;
      /* Remove a margem da sidebar em telas menores */
      padding: 10px;
      /* Ajusta o espaçamento interno */
    }

    .main-sidebar {
      position: relative;
      /* Altera a posição para se adaptar ao layout */
      height: auto;
      /* Ajusta a altura da sidebar */
    }

    .row {
      flex-direction: column;
      /* Altera a direção para coluna em telas menores */
    }
  }
</style>

<?php
include('design2.php');
mysqli_free_result($recGetTables);
?>
