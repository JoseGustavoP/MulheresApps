<?php 
    ob_start();
    // ini_set('session.cookie_domain', '.mulheres.app.br');
    //session_name('mulheres.app.br');
    session_start();
    $id = $_SESSION['id'];
    //$naolidas = $MySQLi->query("SELECT COUNT(men_codigo) as nolidas FROM tb_mensagens 
    //                                WHERE men_tec_destinatario = $id AND men_lida = 0"); //calcula as mensagens nao lidas
    //$nolidas=$naolidas->fetch_assoc();
    //setcookie('cross-site-cookie', 'name', ['samesite' => 'None', 'secure' => true]);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="description" content="O MulheresApp é um software de cadastramento e acompanhamento de mulheres vítimas de violência doméstica, para secretarias de apoio à mulher.">
  <meta name="mobile-web-app-capable" content="yes">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>MulheresApp | <?php echo $design_titulo; ?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="icon" type="image/png" href="../imagens/logomc.png" sizes="310x310">
 <meta name="google-signin-client_id" content="582244156383-8h7u6g4vh6sahpml3sb6i3f3hbvj4l57.apps.googleusercontent.com">
</head>
<body class="hold-transition sidebar-mini" onLoad="initVars();">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../index.php" class="nav-link">Início</a>
      </li>
    </ul>
    <!-- SEARCH FORM -->
    <form class="form-inline ml-3" action="/mulheres.php" method="post">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" name="buscar" placeholder="Buscar Mulher" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item">
        <a class="nav-link" href="../mensagens.php">
          <i class="nav-icon fas fa-comments"></i>
          <?php if($nolidas['nolidas']>0) { ?><span class="badge badge-danger navbar-badge"><?php echo $nolidas['nolidas'] ?><?php } ?></span>
        </a>
        
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../configuracoes.php">
          <i class="nav-icon fas fa-cogs"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../sair.php" onclick="signOut();">
          <i class="nav-icon fas fa-sign-out-alt"></i>
        </a>
      </li>
      

    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../index.php" class="brand-link">
      <img src="../imagens/logomc.png"
           alt="AdminLTE Logo"
           class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light"><b>Mulheres</b>App</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../<?php echo 'imagens/tecnicos/'  . $_SESSION['id'] . '.jpg?' . time() ?>" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block"><?php echo $_SESSION['nome']?></a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          <li class="nav-item">
            <a href="../" class="nav-link <?php if($design_ativo=='r1') echo "active"; ?>">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>Voltar para Dashboard</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="index.php" class="nav-link <?php if($design_ativo=='r2') echo "active"; ?>">
              <i class="nav-icon fas fa-chart-bar"></i>
              <p>Página Inicial</p>
            </a>
          </li>
		  <li class="nav-item">
            <a href="selectTables.php" class="nav-link <?php if($design_ativo=='r3') echo "active"; ?>">
              <i class="nav-icon fas fa-sliders-h"></i>
              <p>Configurar relatório</p>
            </a>
          </li>
          <li class="nav-header">RELATÓRIOS CADASTRADOS</li>
          
        <?php
        
        mysql_select_db($database_connSave, $connSave);
        $query_recReports22 = "SELECT * FROM tblreports WHERE status = 0 ORDER BY txtReportName";
        $recReports22 = mysql_query($query_recReports22, $connSave);

        while ($row_recReports22 = mysql_fetch_assoc($recReports22)){
         echo '
          <li class="nav-item">
            <a class="nav-link ';
            if($_SESSION['txtReportName'] == $row_recReports22['txtReportName']) echo 'active';
            
            echo '" href="loadReport.php?id='. $row_recReports22['id'] . '">
              <i class="nav-icon fas fa-circle"></i>
              <p>'.$row_recReports22['txtReportName'].'</p>
            </a>
          </li>
         
         ';   
            
        }
        ?>
          
		  
        
          </li>
		  
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1><?php echo $design_titulo; ?></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            <?php if($design_migalha1_texto != "" && $design_migalha2_texto == "") { ?>
              <li class="breadcrumb-item"><a href="../">Início</a></li>
              <li class="breadcrumb-item active"><?php echo $design_migalha1_texto; ?></li>
            <?php } elseif($design_migalha1_texto != "" && $design_migalha1_texto != "") {  ?>
              <li class="breadcrumb-item"><a href="../">Início</a></li>
              <li class="breadcrumb-item"><a href="<?php echo $design_migalha1_link; ?>"><?php echo $design_migalha1_texto; ?></a></li>
              <li class="breadcrumb-item active"><?php echo $design_migalha2_texto; ?></li>
            <?php } ?>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    
<script>
    function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function () {
        console.log('User signed out.');
      });
    }

    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
  </script>
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>