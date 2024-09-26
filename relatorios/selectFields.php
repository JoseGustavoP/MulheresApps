<?php
session_start();

// Initialize session variables if not already set
if (!isset($_SESSION['selectedTables'])) {
    $_SESSION['selectedTables'] = ''; // Default value
}
if (!isset($_SESSION['selectedFields'])) {
    $_SESSION['selectedFields'] = ''; // Default value
}

// Check for POST data and update session variable
if (isset($_POST["selectedTables"]) && $_POST["selectedTables"] != "") {
    $_SESSION['selectedTables'] = $_POST["selectedTables"];
}

$design_titulo = "Relatórios";
$design_ativo = "r3"; // Active menu item
$design_migalha1_texto = "Relatórios";
$design_migalha1_link = "index.php";
$design_migalha2_texto = "Editar: Parte 2";
$design_migalha2_link = "";

require_once('includes/config.php');
include("design1.php");
?>

<script language="javascript" type="text/javascript" src="ajaxlib.js"></script>
<script language="javascript" type="text/javascript">
   var lstSelectedFields;
   var lstAllFields;
   var cmdNext;
   var selectedFields;
   var dispFields;
   var lstTables;

   function initVars() {
      lstSelectedFields = document.getElementById("lstSelectedFields");
      lstAllFields = document.getElementById("lstAllFields");
      selectedFields = document.getElementById("selectedFields");
      cmdNext = document.getElementById("cmdNext");
      dispFields = document.getElementById("dispFields");
      lstTables = document.getElementById("lstTables");

      doAjax('getFieldNames.php', 'tableName=' + lstTables.options[0].value, 'displayFields', 'post', 0, 'progress');
   }

   function cmdSelectFields_onclick() {
      initVars();

      var addIndex = lstAllFields.selectedIndex;
      if (addIndex < 0)
         return;

      for (i = 0; i < lstAllFields.options.length; i++) {
         if (lstAllFields.options[i].selected) {
            var tmpFound = 0;
            for (var x = 0; x <= ((lstSelectedFields.options.length) - 1); x++) {
               if (lstSelectedFields.options[x].value == lstAllFields.options[i].value) {
                  tmpFound = 1;
               }
            }

            if (tmpFound != 1) {
               newOption = document.createElement('option');
               newText = document.createTextNode(lstAllFields.options[i].value);

               newOption.appendChild(newText);
               newOption.setAttribute("value", lstAllFields.options[i].value);

               lstSelectedFields.appendChild(newOption);

               updateFields();
               cmdNext.disabled = false;
            }
         }
      }
   }

   function cmdRemoveFields_onclick() {
      var selIndex = lstSelectedFields.selectedIndex;
      var itemCount = lstSelectedFields.options.length;
      if (selIndex < 0)
         return;

      for (i = 0; i < itemCount; i++) {
         for (x = 0; x < lstSelectedFields.options.length; x++) {
            if (lstSelectedFields.options[x].selected) {
               lstSelectedFields.removeChild(lstSelectedFields.options.item(x))
            }
         }
      }

      updateFields();

      if (lstSelectedFields.options.length == 0) {
         cmdNext.disabled = true;
      }
   }

   function updateFields() {
      selectedFields.value = "";
      for (var x = 0; x <= ((lstSelectedFields.options.length) - 1); x++) {
         selectedFields.value = selectedFields.value + lstSelectedFields.options[x].value + "~";
      }
   }

   function displayFields(fieldData) {
      dispFields.innerHTML = fieldData;
   }

   function moveUpList() {
      if (lstSelectedFields.length == -1) {
         alert("Não existem itens para mover!");
      } else {
         var selected = lstSelectedFields.selectedIndex;
         if (selected == -1) {
            alert("Você deve selecionar um item para mover!");
         } else {
            if (lstSelectedFields.length == 0) {
               alert("Só há uma entrada!\nEla permanecerá no mesmo lugar.");
            } else {
               if (selected == 0) {
                  alert("O primeiro item da lista não pode ser movido para cima.");
               } else {
                  var moveText1 = lstSelectedFields[selected - 1].text;
                  var moveText2 = lstSelectedFields[selected].text;
                  var moveValue1 = lstSelectedFields[selected - 1].value;
                  var moveValue2 = lstSelectedFields[selected].value;
                  lstSelectedFields[selected].text = moveText1;
                  lstSelectedFields[selected].value = moveValue1;
                  lstSelectedFields[selected - 1].text = moveText2;
                  lstSelectedFields[selected - 1].value = moveValue2;
                  lstSelectedFields.selectedIndex = selected - 1;
                  updateFields();
               }
            }
         }
      }
   }

   function moveDownList() {
      if (lstSelectedFields.length == -1) {
         alert("Não existem itens para mover!");
      } else {
         var selected = lstSelectedFields.selectedIndex;
         if (selected == -1) {
            alert("Você deve selecionar um item para mover!");
         } else {
            if (lstSelectedFields.length == 0) {
               alert("Só há uma entrada!\nEla permanecerá no mesmo lugar.");
            } else {
               if (selected == lstSelectedFields.length - 1) {
                  alert("O último item da lista não pode ser movido para baixo.");
               } else {
                  var moveText1 = lstSelectedFields[selected + 1].text;
                  var moveText2 = lstSelectedFields[selected].text;
                  var moveValue1 = lstSelectedFields[selected + 1].value;
                  var moveValue2 = lstSelectedFields[selected].value;
                  lstSelectedFields[selected].text = moveText1;
                  lstSelectedFields[selected].value = moveValue1;
                  lstSelectedFields[selected + 1].text = moveText2;
                  lstSelectedFields[selected + 1].value = moveValue2;
                  lstSelectedFields.selectedIndex = selected + 1;
                  updateFields();
               }
            }
         }
      }
   }

   function jumpURL(tmpURL) {
      window.location.href = tmpURL;
   }

   function cmdNew_onClick() {
      var tmpVal = confirm("Confirme a Ação");

      if (tmpVal == true) {
         window.open("newReport.php", "_self");
      }
   }

   initVars();
</script>

<div class="wrapper">
   <!-- Main content -->
   <div class="content-wrapper">
      <section class="content">
         <div class="container-fluid">
            <div class="card card-primary card-outline">
               <div class="card-header">
                  <h3 class="card-title">Seleção de Colunas do formulário (Formato: tabela.coluna)</h3>
               </div> <!-- /.card-header -->

               <div class="card-body">
                  <?php
                  echo "<h2>" . ($_SESSION['txtReportName'] ?? "Novo Relatório") . "</h2>";
                  ?>
                  <div class="row">
                     <div class="col-md-2 col-12">
                        <b>Tabelas:</b>
                        <select name="lstTables" id="lstTables" class='form-control'
                           onChange="doAjax('getFieldNames.php','tableName=' + this.value,'displayFields','post',0,'progress');">
                           <?php
                           $tmpTables = explode("~", $_SESSION['selectedTables']);
                           for ($x = 0; $x <= count($tmpTables) - 1; $x += 1) {
                              if ($tmpTables[$x] != "") {
                                 ?>
                                 <option value="<?php echo $tmpTables[$x]; ?>" <?php if ((count($tmpTables) - 1) == 1) {
                                       print "selected='selected'";
                                    } ?>> <?php echo $tmpTables[$x]; ?> </option>
                                 <?php
                              }
                           }
                           ?>
                        </select>
                     </div>
                     <div class="col-md-10 col-12">
                        <b>Colunas disponíveis:</b>
                        <div id="dispFields"></div>

                        <b>Colunas escolhidas:</b>
                        <div class="row">
                           <div class="col-md-10 col-12">
                              <select name="lstSelectedFields" size="5" multiple="multiple" id="lstSelectedFields"
                                 class='form-control'>
                                 <?php
                                 $tmpFields = explode("~", $_SESSION['selectedFields']);
                                 for ($x = 0; $x <= count($tmpFields) - 1; $x += 1) {
                                    if ($tmpFields[$x] != "") {
                                       ?>
                                       <option value="<?php echo $tmpFields[$x]; ?>">
                                          <?php echo $tmpFields[$x]; ?>
                                       </option>
                                       <?php
                                    }
                                 }
                                 ?>
                              </select>
                           </div>
                           <div class="col-md-2 col-12">
                              <a href="javascript:moveUpList();" class="btn btn-xs btn-primary"><i
                                    class="fas fa-arrow-up"></i></a>
                              <a href="javascript:moveDownList();" class="btn btn-xs btn-primary"><i
                                    class="fas fa-arrow-down"></i></a>
                           </div>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-10 col-12">
                        <button type="button" id="cmdSelectFields" class="btn btn-primary"
                           onClick="cmdSelectFields_onclick();">Selecionar</button>
                        <button type="button" id="cmdRemoveFields" class="btn btn-primary"
                           onClick="cmdRemoveFields_onclick();">Remover</button>
                     </div>
                     <div class="col-md-2 col-12">
                        <input type="hidden" name="selectedFields" id="selectedFields" />
                        <input type="button" id="cmdNext" class="btn btn-primary" value="Próximo" disabled="disabled"
                           onClick="jumpURL('report2.php');" />
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
   </div>
</div>

<?php
include("design2.php");
?>
