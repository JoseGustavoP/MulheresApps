<?php
session_start();
?>
<?php 
require_once('includes/config.php'); ?>
<?php
if ($_POST["selectedFields"]!=""){
	$_SESSION['selectedFields'] = $_POST["selectedFields"]; 
}

$design_titulo = "Relatórios";
$design_ativo = "r3"; // coloca o class="nav-link active" no menu correto
$design_migalha1_texto = "Relatórios";
$design_migalha1_link = "index.php";
$design_migalha2_texto = "Editar: Parte 3";
$design_migalha2_link = "";

include("design1.php");
?>

<script language="javascript" type="text/javascript" src="ajaxlib.js"></script>
<script language="javascript" type="text/javascript">
var lstType;
var lstFieldNames;
var lstConditions;
var lstValueType;
var inputValue;
var lstConditions;
var cmdNext;
var lstAppliedConditions;
var appliedConditions;
var txtReportName;
var lstSortName;
var lstSortOrder;
var inputType;

function initVars() {
	lstType = document.getElementById("lstType");
	lstFieldNames = document.getElementById("lstFieldNames");
	lstConditions = document.getElementById("lstConditions");
	lstValueType = document.getElementById("lstValueType");
	inputValue = document.getElementById("inputValue");
	lstConditions = document.getElementById("lstConditions");
	cmdNext = document.getElementById("cmdNext");
	lstAppliedConditions = document.getElementById("lstAppliedConditions");
	appliedConditions = document.getElementById("appliedConditions");
	txtReportName = document.getElementById("txtReportName");
	lstSortName = document.getElementById("lstSortName");
	lstSortOrder = document.getElementById("lstSortOrder");
	inputType = document.getElementById("inputType");
}

function jumpURL(tmpURL) {	
	window.location.href = tmpURL;
}

function displayInput(inputData){
	inputType.innerHTML = inputData;
}

function cmdAdd_onClick(){
	initVars();
	if(validateFields()==0){
		if (lstAppliedConditions.options.length==0){
			if (lstConditions.value!="LIKE"){
				if (lstValueType.value=="field"){
					tmpCondition = lstFieldNames.value + " " + lstConditions.value + " " + stripQuotes(inputValue.value);
				}else{
					tmpCondition = lstFieldNames.value + " " + lstConditions.value + " '" + stripQuotes(inputValue.value) + "'";
				}
			}else{
				if (lstValueType.value=="field"){
					tmpCondition = lstFieldNames.value + " " + lstConditions.value + " " + stripQuotes(inputValue.value);
				}else{
					tmpCondition = lstFieldNames.value + " " + lstConditions.value + " '%" + stripQuotes(inputValue.value) + "%'";
				}
			}
		}else{
			if (lstConditions.value!="LIKE"){
				if (lstValueType.value=="field"){
					tmpCondition = lstType.value + " " + lstFieldNames.value + " " + lstConditions.value + " " + stripQuotes(inputValue.value);
				}else{
					tmpCondition = lstType.value + " " + lstFieldNames.value + " " + lstConditions.value + " '" + stripQuotes(inputValue.value) + "'";
				}
			}else{
				if (lstValueType.value=="field"){
					tmpCondition = lstType.value + " " + lstFieldNames.value + " " + lstConditions.value + " " + stripQuotes(inputValue.value);
				}else{
					tmpCondition = lstType.value + " " + lstFieldNames.value + " " + lstConditions.value + " '%" + stripQuotes(inputValue.value) + "%'";
				}
			}
		}
	newOption = document.createElement('option');
	newText = document.createTextNode(tmpCondition);
	
	newOption.appendChild(newText);
	newOption.setAttribute("value",tmpCondition);
	
	lstAppliedConditions.appendChild(newOption);
	updateConditions();
	}
}

function updateConditions(){
	appliedConditions.value = "";

	if (lstAppliedConditions.options.length!=0){
		var splitData = lstAppliedConditions.options[0].value.split(" ");
		if (splitData[0]=='AND' || splitData[0]=='OR') {
			appliedConditions.value = (splitData[1] + splitData[2] + splitData[3]) + " ~";
			
			for (var x = 1; x <= ((lstAppliedConditions.options.length)-1); x++)
			{
				appliedConditions.value = appliedConditions.value + lstAppliedConditions.options[x].value + " ~";
			}
		}else{
			for (var x = 0; x <= ((lstAppliedConditions.options.length)-1); x++)
			{
				appliedConditions.value = appliedConditions.value + lstAppliedConditions.options[x].value + " ~";
			}
		}
	} else {
		for (var x = 0; x <= ((lstAppliedConditions.options.length)-1); x++)
		{
			appliedConditions.value = appliedConditions.value + lstAppliedConditions.options[x].value + " ~";
		}
	}
}

function validateFields(){
var errorValue = 0;
	
	if (lstType.value=="") {
		errorValue = 1;
	}
	
	if (lstFieldNames.value=="") {
		errorValue = 1;
	}
	
	if (lstConditions.value=="") {
		errorValue = 1;
	}
	
	try {	
		if (inputValue.value=="") {
			//errorValue = 1;
		}
	}catch(err){
		errorValue = 1;
	}

return errorValue;
}

function cmdRemove_onClick() {
	var selIndex = lstAppliedConditions.selectedIndex;
	var itemCount = lstAppliedConditions.options.length;
   	if(selIndex < 0)
      return;

	for (i = 0; i < itemCount; i++) {
	
		for (x = 0; x < lstAppliedConditions.options.length; x++) {
			if (lstAppliedConditions.options[x].selected) {
				lstAppliedConditions.removeChild(lstAppliedConditions.options.item(x))
			}
		}
	}
  
	updateConditions();
	if (lstAppliedConditions.options.length==0){
	}

}

function submitForm(){
	var tmpMsg = "";

	if (txtReportName.value=="") {
		tmpMsg = tmpMsg + "O nome do relatório é obrigatório" + "\n";
	}
	
	if (trim(lstSortName.value)!="") {
		if (trim(lstSortOrder.value)=="") {
			tmpMsg = tmpMsg + "'Ordenado por' é obrigatório" + "\n";
		}
	}

	if (trim(lstSortOrder.value)!="") {
		if (trim(lstSortName.value)=="") {
			tmpMsg = tmpMsg + "'Em ordem' é obrigatório" + "\n";
		}
	}
	
	if (tmpMsg=="") {
	updateConditions();
	document.frmConditions.submit();
	}else{
	alert(tmpMsg);
	}

}

function trim(str)
{
 return str.replace(/^\s+|\s+$/g, ''); 
}

function stripQuotes(string){
return string.replace(/'/g,"");
}

function cmdNew_onClick() {
	var tmpVal= confirm("Confirme a ação");
	
	if (tmpVal== true){
		window.open("newReport.php","_self");
	} 
}
//initVars();
</script>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="card card-primary card-outline">
          <div class="card-header">
            <h3 class="card-title">Filtros e Classificações do Relatório</h3>
          </div> 
          
          <div class="card-body">


                <?php if($_SESSION['txtReportName']!="") {
                    echo "<h2>Edição: ".$_SESSION['txtReportName']."</h2>";
                }
                else{
                    echo "<h2>Novo Relatório</h2>";
                }
                ?>
          

<div id="progress"></div>

<div class="card">
    <div class="card-header">
        <h3 class="card-title">Filtros</h3>
    </div>
    <div class="card-body">

           <div class="row">
           <div class="col-md-6">
               
                  <div class="form-group row">
                    <label for="lstType" class="col-sm-5 col-form-label">Tipo</label>
                    <div class="col-sm-7">
                        <select name="lstType" id="lstType" class="form-control">
                          <option value="AND">E</option>
                          <option value="OR">OU</option>
                        </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="lstFieldNames" class="col-sm-5 col-form-label">Campo</label>
                    <div class="col-sm-7">
                        <select name="lstFieldNames" id="lstFieldNames" class="form-control">
                            <?php
        					$tmpFields = split("~",$_SESSION['selectedFields']);
        					for ($x=0; $x<=count($tmpFields)-1; $x+=1) {
        						if ($tmpFields[$x]!=""){
        					?>
                                  <option value="<?php echo $tmpFields[$x];?>">
                                  <?php echo $tmpFields[$x];?>                          
        						  </option>
                                  <?php
        	  					}
        	  				}
        					?>
                        </select>  
                    </div>
                  </div>
 
                  <div class="form-group row">
                    <label for="lstConditions" class="col-sm-5 col-form-label">Condição</label>
                    <div class="col-sm-7">
                        <select name="lstConditions" id="lstConditions" class="form-control">
                          <option value="=">Igual</option>
                          <option value="&lt;&gt;">Diferente</option>
                          <option value="&gt;">Maior que</option>
                          <option value="&lt;">Menor que</option>
                          <option value="&gt;=">Maior ou igual a</option>
                          <option value="&lt;=">Menor ou igual a</option>
                          <option value="LIKE">Parecido</option>
                        </select>
                    </div>
                  </div>
                        
                  <div class="form-group row">
                    <label for="lstValueType" class="col-sm-5 col-form-label">Tipo de valor</label>
                    <div class="col-sm-7">
                        <select name="lstValueType" id="lstValueType" onchange="doAjax('getInputType.php','inputValue=' + this.value,'displayInput','post',0,'progress');" class="form-control">
                          <option value=""></option>
                          <option value="input">Digitar valor</option>
                          <option value="field">Coluna</option>
                        </select> 
                    </div>
                  </div>
                           
                  <div class="form-group row">
                    <label for="lstValueType" class="col-sm-5 col-form-label">Valor</label>
                    <div class="col-sm-7">
                        <div id="inputType">-------</div>
                    </div>
                  </div>
               
                          
           </div>
           <div class="col-md-6">
             
             <select name="lstAppliedConditions" size="5" multiple="multiple" id="lstAppliedConditions" class="form-control">
					<?php
					$tmpCondition = split("~",$_SESSION['appliedConditions']);
					for ($x=0; $x<=count($tmpCondition)-1; $x+=1) {
						if ($tmpCondition[$x]!=""){
						?>
                          <option value="<?php echo stripslashes($tmpCondition[$x]);?>">
                          <?php echo stripslashes($tmpCondition[$x]);?>                          
						  </option>
                          <?php
	  					}
	  				}
					?>
                        </select>
                        <br>
                        
                          <input name="cmdAdd" type="submit" class="btn btn-block bg-gradient-primary" id="cmdAdd" onclick="cmdAdd_onClick();" value="Adicionar" />
                          <input name="cmdRemove" type="button" class="btn btn-block bg-gradient-secondary" id="cmdRemove" onclick="cmdRemove_onClick();" value="Remover"/>
                        
             
                          
           </div>
           </div>
 
    </div>                
 </div>         
                          
                          
                          <br>
                          
                          <form id="frmConditions" name="frmConditions" method="post" action="generateSQL.php" style="margin:0px">
                          
                          <div class="form-group row">
                            <label for="txtReportName" class="col-sm-3 col-form-label">Nome do relatório</label>
                            <div class="col-sm-9">
                                <input name="txtReportName" type="text" id="txtReportName" value="<?php echo $_SESSION['txtReportName'];?>" size="50" class="form-control" /> 
                            </div>
                          </div>
                          
                          
                          <div class="form-group row">
                            <label for="lstSortName" class="col-sm-3 col-form-label">Ordenado por</label>
                            <div class="col-sm-9">
                                <select name="lstSortName" id="lstSortName"  class="form-control">
                                  <option value=""></option>
                                  <?php
									$tmpFields = split("~",$_SESSION['selectedFields']);
									for ($x=0; $x<=count($tmpFields)-1; $x+=1) {
										if ($tmpFields[$x]!=""){
	  								?>
                                  		<option value="<?php echo $tmpFields[$x];?>" <?php if (!(strcmp($tmpFields[$x], $_SESSION['lstSortName']))) {echo "selected=\"selected\"";} ?>>
                                  		<?php echo $tmpFields[$x];?>                                  
										</option>
                                  	<?php
	  									}
	  								}
									?>
                                </select>
                            </div>
                          </div>
                          
                          
                          
                          <div class="form-group row">
                            <label for="lstSortOrder" class="col-sm-3 col-form-label">Em ordem</label>
                            <div class="col-sm-9">
                                <select name="lstSortOrder" id="lstSortOrder"  class="form-control">
                                  <option value="" <?php if (!(strcmp("", $_SESSION['lstSortOrder']))) {echo "selected=\"selected\"";} ?>></option>
                                  <option value="ASC" <?php if (!(strcmp("ASC", $_SESSION['lstSortOrder']))) {echo "selected=\"selected\"";} ?>>Crescente</option>
                                  <option value="DESC" <?php if (!(strcmp("DESC", $_SESSION['lstSortOrder']))) {echo "selected=\"selected\"";} ?>>Decrescente</option>
                                </select>
                            </div>
                          </div>
                                
                                  <input name="appliedConditions" type="hidden" id="appliedConditions" class="form-control" />
                               
                                                             
                                
                          <div class="form-group row">
                            <label for="lstSortOrder" class="col-sm-3 col-form-label">Salvar este relatório?</label>
                            <div class="col-sm-9">
                                <select name="lstSave" id="lstSave"  class="form-control">
                                  <option value="1">Sim</option>
                                  <option value="0" selected>Não</option>
                                </select>
                            </div>
                          </div>
                                
                                  <!--<input name="txtRecPerPage" type="text" id="txtRecPerPage" value="<?php if ($_SESSION['txtRecPerPage']!='') { echo $_SESSION['txtRecPerPage'];} else { echo ('20'); } ?>" size="15" />-->
                                  
                                  
                                                         
                                
                      </form>
                        
                        
                        
                         <br>
                         
                         <div class="margin">
                      <button name="cmdNew" type="button" class="btn btn-info" id="cmdNew" onclick="cmdNew_onClick();"><i class="fas fa-file"></i> Reiniciar como novo relatório</button>
                      <button name="cmdBack" type="button" class="btn btn-success m-2" id="cmdBack" onclick="jumpURL('selectFields.php');"><i class="fas fa-arrow-left"></i> Voltar</button>
                      <button name="cmdNext" type="submit" class="btn btn-success" id="cmdNext" onclick="submitForm();">Avançar <i class="fas fa-arrow-right"></i></button>
                      </div>

                          
                                       
</div>
            </div>
        </div>
    </div>
</section>

<?php include('design2.php'); ?>
