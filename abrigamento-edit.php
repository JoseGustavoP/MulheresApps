<?php
// Ativar exibição de erros para depuração
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Incluir arquivos de configuração e permissões
include("config.php");
include("acesso.php");
include("permisaoAdm.php");

// Definir variáveis para o design
$design_titulo = "Editar Abrigamento";
$design_ativo = "m7"; // classe ativa no menu
$design_migalha1_texto = "Abrigo";
$design_migalha1_link = "abrigo.php";
$design_migalha2_texto = "Editar Abrigamento";
$design_migalha2_link = "";

// Incluir o design1.php
include("design1.php");

// Função para formatar a data para o input datetime-local
function format_datetime_local($datetime) {
    return date('Y-m-d\TH:i', strtotime($datetime));
}

// Manipular exclusão de dependente
if (isset($_GET['delPes']) && isset($_GET['delAbr'])) {
    $pessoa = intval($_GET['delPes']);
    $abrigo = intval($_GET['delAbr']);
    
    // Usar Prepared Statement para prevenir SQL Injection
    $stmt = $MySQLi->prepare("DELETE FROM tb_componentes_abrigamento WHERE cab_abr_codigo = ? AND cab_pes_codigo = ?");
    if ($stmt) {
        $stmt->bind_param("ii", $abrigo, $pessoa);
        if ($stmt->execute()) {
            $stmt->close();
            header("Location: abrigamento-edit.php?codigo=$abrigo&msg=1");
            exit();
        } else {
            echo "Erro ao executar a exclusão: " . $stmt->error;
            exit();
        }
    } else {
        echo "Erro ao preparar a exclusão: " . $MySQLi->error;
        exit();
    }
}

// Obter mensagem de status, se existir
$msg = isset($_GET['msg']) ? $_GET['msg'] : null;

// Verificar se o código do abrigamento foi passado
if (isset($_GET['codigo'])) {
    $cod = intval($_GET['codigo']);
    
    // Obter detalhes do abrigamento
    $stmt = $MySQLi->prepare("SELECT abr_codigo, abr_roldepertences, abr_mul_codigo, abr_tec_codigo, mul_nome, tec_apelido, abr_data_inicio, abr_data_fim, mul_codigo, tec_codigo 
                               FROM tb_abrigamentos 
                               JOIN tb_mulheres ON abr_mul_codigo = mul_codigo
                               JOIN tb_tecnicos ON abr_tec_codigo = tec_codigo
                               WHERE abr_codigo = ?");
    if ($stmt) {
        $stmt->bind_param("i", $cod);
        $stmt->execute();
        $resultado = $stmt->get_result()->fetch_assoc();
        if (!$resultado) {
            echo "Abrigamento não encontrado.";
            exit();
        }
        $mulherCod = $resultado['mul_codigo'];
        $stmt->close();
    } else {
        echo "Erro ao preparar a consulta: " . $MySQLi->error;
        exit();
    }
    
    // Obter dependentes do abrigamento
    $stmt = $MySQLi->prepare("SELECT pes_nome, pes_codigo, cab_abr_codigo, TIMESTAMPDIFF(YEAR, pes_data_nasc, NOW()) as idade 
                               FROM tb_componentes_abrigamento 
                               JOIN tb_pessoas ON cab_pes_codigo = pes_codigo
                               JOIN tb_mulheres ON pes_mul_codigo = mul_codigo
                               WHERE cab_abr_codigo = ?");
    if ($stmt) {
        $stmt->bind_param("i", $cod);
        $stmt->execute();
        $consulta4 = $stmt->get_result();
        $stmt->close();
    } else {
        echo "Erro ao preparar a consulta dos dependentes: " . $MySQLi->error;
        exit();
    }
    
    // Obter pessoas que não estão no abrigamento e são da mesma mulher
    $stmt = $MySQLi->prepare("SELECT pes_codigo, pes_nome 
                               FROM tb_pessoas 
                               WHERE pes_codigo NOT IN (SELECT cab_pes_codigo FROM tb_componentes_abrigamento WHERE cab_abr_codigo = ?) 
                               AND pes_mul_codigo = ?");
    if ($stmt) {
        $stmt->bind_param("ii", $cod, $mulherCod);
        $stmt->execute();
        $consulta5 = $stmt->get_result();
        $stmt->close();
    } else {
        echo "Erro ao preparar a consulta das pessoas disponíveis: " . $MySQLi->error;
        exit();
    }
} else {
    header("Location: abrigo.php");
    exit();
}

// Manipular adição de novo dependente
if (isset($_POST['pessoa']) && isset($_POST['abrigo'])) {
    $pessoa = intval($_POST['pessoa']);
    $abrigo = intval($_POST['abrigo']);
    
    // Inserir novo dependente
    $stmt = $MySQLi->prepare("INSERT INTO tb_componentes_abrigamento (cab_abr_codigo, cab_pes_codigo) VALUES (?, ?)");
    if ($stmt) {
        $stmt->bind_param("ii", $abrigo, $pessoa);
        if ($stmt->execute()) {
            $stmt->close();
            header("Location: abrigamento-edit.php?codigo=$abrigo&msg=2");
            exit();
        } else {
            echo "Erro ao adicionar dependente: " . $stmt->error;
            exit();
        }
    } else {
        echo "Erro ao preparar a inserção do dependente: " . $MySQLi->error;
        exit();
    }
}

// Manipular atualização do abrigamento
if (isset($_POST['codigo'])) {
    $codigo = intval($_POST['codigo']);
    $mulher = intval($_POST['mulher']);
    $inicio = $_POST['inicio'];
    $fim = $_POST['fim'];
    $tecnico = intval($_POST['tecnico']);
    $pertences = $_POST['pertences'];
    
    // Opcional: Sanitizar o conteúdo de "pertences" se necessário
    // Por exemplo, usar HTML Purifier para limpar o HTML inserido
    // $pertences = htmlspecialchars($pertences, ENT_QUOTES, 'UTF-8');
    
    if ($fim != '') {
        $stmt = $MySQLi->prepare("UPDATE tb_abrigamentos 
                                   SET abr_mul_codigo = ?, abr_tec_codigo = ?, abr_data_inicio = ?, abr_data_fim = ?, abr_roldepertences = ?
                                   WHERE abr_codigo = ?");
        if ($stmt) {
            $stmt->bind_param("iisssi", $mulher, $tecnico, $inicio, $fim, $pertences, $codigo);
        } else {
            echo "Erro ao preparar a atualização: " . $MySQLi->error;
            exit();
        }
    } else {
        $stmt = $MySQLi->prepare("UPDATE tb_abrigamentos 
                                   SET abr_mul_codigo = ?, abr_tec_codigo = ?, abr_data_inicio = ?, abr_data_fim = NULL, abr_roldepertences = ?
                                   WHERE abr_codigo = ?");
        if ($stmt) {
            $stmt->bind_param("iissi", $mulher, $tecnico, $inicio, $pertences, $codigo);
        } else {
            echo "Erro ao preparar a atualização sem data final: " . $MySQLi->error;
            exit();
        }
    }
    
    if ($stmt->execute()) {
        $stmt->close();
        header("Location: abrigamento-edit.php?codigo=$codigo&msg=2");
        exit();
    } else {
        echo "Erro ao atualizar o abrigamento: " . $stmt->error;
        exit();
    }
}

// Obter tecnicos ativos para o select
$stmt = $MySQLi->prepare("SELECT tec_codigo, tec_apelido FROM tb_tecnicos WHERE tec_ativo = 1");
if ($stmt) {
    $stmt->execute();
    $consulta3 = $stmt->get_result();
    $stmt->close();
} else {
    echo "Erro ao preparar a consulta dos técnicos: " . $MySQLi->error;
    exit();
}
?>

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <!-- Card para editar abrigamento -->
    <div class="card card-primary">
      <div class="card-header">
        <h3 class="card-title">Editar abrigamento</h3>
      </div>
      <!-- /.card-header -->
      <!-- Formulário -->
      <form role="form" action="abrigamento-edit.php?codigo=<?php echo $cod ?>" method="POST">
        <div class="card-body">
          <!-- Nome da Mulher (não editável) -->
          <div class="form-group">
            <label>Nome</label>
            <input type="hidden" name="codigo" value="<?php echo $resultado['abr_codigo'] ?>">
            <input type="hidden" name="mulher" value="<?php echo $resultado['mul_codigo'] ?>">
            <input type="text" class="form-control" value="<?php echo htmlspecialchars($resultado['mul_nome']) ?>" disabled>
          </div>
          
          <div class="row">
            <!-- Data Inicial -->
            <div class="col-sm-6">
              <div class="form-group">
                <label>Data inicial</label>
                <input name="inicio" required type="datetime-local" class="form-control"
                  value="<?php echo format_datetime_local($resultado['abr_data_inicio']); ?>">
              </div>
            </div>
            <!-- Data Final -->
            <div class="col-sm-6">
              <div class="form-group">
                <label>Data final</label>
                <input name="fim" type="datetime-local" class="form-control"
                  value="<?php echo $resultado['abr_data_fim'] ? format_datetime_local($resultado['abr_data_fim']) : ''; ?>">
              </div>
            </div>
          </div>
          
          <!-- Seleção de Técnico -->
          <div class="form-group">
            <label>Técnico</label>
            <select name="tecnico" class="custom-select">
              <?php while ($resultado3 = $consulta3->fetch_assoc()) { ?>
                <option value="<?php echo $resultado3['tec_codigo']; ?>" <?php if ($resultado3['tec_codigo'] == $resultado['tec_codigo']) echo 'selected'; ?>>
                  <?php echo htmlspecialchars($resultado3['tec_apelido']); ?>
                </option>
              <?php } ?>
            </select>
          </div>
          
          <!-- Campo Pertences com TinyMCE -->
          <div class="form-group">
            <label>Pertences</label>
            <!-- Incluir o script do TinyMCE -->
            <script src="https://cdn.tiny.cloud/1/k7vhbf0ybiy0bsqxhlfwwfww6zcohn8dz5eo1rg71vgdzsx3/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
            <!-- Inicializar o TinyMCE -->
            <script>
              tinymce.init({
                selector: '#mytextarea',
                plugins: [
                  'anchor', 'autolink', 'charmap', 'codesample', 'emoticons', 'image', 'link', 'lists', 'media', 'searchreplace', 'table', 'visualblocks', 'wordcount',
                ],
                toolbar: 'undo redo | bold italic underline | link image media | align | numlist bullist | emoticons charmap | removeformat',
                branding: false,
                height: 200,
              });
            </script>
            <!-- Textarea para Pertences -->
            <textarea id="mytextarea" name="pertences" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
<?php echo htmlspecialchars($resultado['abr_roldepertences']); ?>
            </textarea>
          </div>
        </div>
        <!-- Botão de Salvar -->
        <div class="card-footer">
          <center><button type="submit" class="btn btn-primary">Salvar</button></center>
        </div>
      </form>
    </div>

    <!-- Card para listar dependentes -->
    <div class="card card-secondary">
      <div class="card-header">
        <h3 class="card-title">Listagem de dependentes no Abrigamento</h3>
      </div>
      <div class="card-body">
        <!-- Mensagens de Sucesso -->
        <?php 
        if ($msg == 1) {
            echo "<div class='alert alert-success'>Dependente removido do abrigamento com sucesso!</div>";
        }
        if ($msg == 2) {
            echo "<div class='alert alert-success'>Dependente adicionado ao abrigamento com sucesso!</div>";
        }
        ?>
        
        <!-- Tabela de Dependentes -->
        <table class="table table-hover table-bordered">
          <thead>
            <tr>
              <th>Nome</th>
              <th>Idade</th>
              <th>Ação</th>
            </tr>
          </thead>
          <tbody>
            <?php while ($resultado4 = $consulta4->fetch_assoc()) { ?>
              <tr>
                <td><?php echo htmlspecialchars($resultado4['pes_nome']); ?></td>
                <td><?php echo $resultado4['idade'] ? $resultado4['idade'] . ' anos' : '-'; ?></td>
                <td>
                  <button type="button" onclick="window.location.href='abrigamento-edit.php?delPes=<?php echo $resultado4['pes_codigo']; ?>&delAbr=<?php echo $resultado4['cab_abr_codigo']; ?>&codigo=<?php echo $resultado4['cab_abr_codigo']; ?>'" class="btn btn-block bg-gradient-primary btn-sm">Remover</button>
                </td>
              </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <!-- Formulário para adicionar novo dependente -->
      <div class="card-footer">
        <form action="abrigamento-edit.php?codigo=<?php echo $cod ?>" method="POST">
          <input type="hidden" name="abrigo" value="<?php echo $cod; ?>">
          <label>Adicionar novo dependente:</label>
          <div class="input-group">
            <select name="pessoa" class="custom-select">
              <?php while ($resultado5 = $consulta5->fetch_assoc()) { ?>
                <option value="<?php echo $resultado5['pes_codigo']; ?>"><?php echo htmlspecialchars($resultado5['pes_nome']); ?></option>
              <?php } ?>
            </select>
            <span class="input-group-append">
              <button type="submit" class="btn btn-primary btn-flat">Adicionar</button>
            </span>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

<?php include("design2.php"); ?>

<!-- Scripts adicionais -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- InputMask -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<script>
  $(function () {
    $('[data-mask]').inputmask();
  });
</script>
