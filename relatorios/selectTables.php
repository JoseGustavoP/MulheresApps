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
// Your JavaScript code remains here
</script>

<section class="content">
  <div class="container-fluid">
    <div class="card card-primary card-outline">
      <div class="card-header">
        <h3 class="card-title">Selecione a(s) tabela(s) que compõem este relatório</h3>
      </div>
      <div class="card-body">
        <?php if ($_SESSION['txtReportName'] != "") {
            echo "<h2>Edição: " . $_SESSION['txtReportName'] . "</h2>";
        } else {
            echo "<h2>Novo Relatório</h2>";
        } ?>

        <div class="row">
          <div class="col-md-5">
            Lista de tabelas disponíveis
            <select name="lstAllTables" size="10" multiple id="lstAllTables" class='form-control'>
              <?php
              do {
                  if ($dbVisTables != "") {
                      $visTables = explode(",", $dbVisTables);
                      for ($x = 0; $x <= count($visTables) - 1; $x += 1) {
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

          <div class="col-md-2 card-body text-center">
            <a href="javascript:cmdSelectTables_onclick();" class="btn btn-sm btn-primary m-2"><i class="fas fa-arrow-right"></i></a><br>
            <a href="javascript:cmdRemoveTables_onclick();" class="btn btn-sm btn-primary"><i class="fas fa-arrow-left"></i></a>
          </div>

          <div class="col-md-5">
            Tabelas selecionadas
            <select name="lstTables" size="10" multiple id="lstTables" class='form-control'>
              <?php
              $tmpTables = explode("~", $_SESSION['selectedTables']);
              for ($x = 0; $x <= count($tmpTables) - 1; $x += 1) {
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
            <button name="cmdNext" type="submit" class="btn btn-success" id="cmdNext" <?php if ($_SESSION['selectedTables'] == "") { echo ("disabled='disabled'"); } ?>>Avançar <i class="fas fa-arrow-right"></i></button>
          </div>
          <input name="selectedTables" type="hidden" id="selectedTables" value="<?php echo($_SESSION['selectedTables']); ?>">
        </form>
      </div>
    </div>
  </div>
</section>

<?php
include('design2.php');
mysqli_free_result($recGetTables);
?>
