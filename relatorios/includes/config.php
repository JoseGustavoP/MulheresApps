<?php session_start();
    if(!isset($_SESSION['id'])){
		header("Location: ../login.php");
	}
// Basic Parameters
$pageTitle = "Gerenciador de Relatórios"; 

// Database To Be Queired
$hostname_connDB = "localhost"; 	// The host name of the MySql server
$database_connDB = "mulheres_natal2"; 			// The name of the Database to be queired
$username_connDB = "mulheres_sistema";			// Username to login to the server
$password_connDB = "Natal2020";			// Password to the MySQL server
$dbVisTables = "";			// The name of the tables to be displayed seperated by commas. 
					// Leave this blank if all the tables and views are to be displayed.
					// eg $dbVisTables = "table1,table2,table3";

//Databse To Save Reports
$hostname_connSave = "localhost"; 	// The host name of the MySql server where the generated reports are to be saved
$database_connSave = "mulheres_relatorios"; 	// The name of the Database to save the generated reports
$username_connSave = "mulheres_sistema";		// Username to login to the server
$password_connSave = "Natal2020";		// Password to the MySQL server

//Do not edit after this point
$connDB = @mysql_pconnect($hostname_connDB, $username_connDB, $password_connDB) or trigger_error(mysql_error(),E_USER_ERROR); 
$connSave = @mysql_pconnect($hostname_connSave, $username_connSave, $password_connSave) or trigger_error(mysql_error(),E_USER_ERROR); 


mysql_query("SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'", $connDB);
mysql_query("SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'", $connSave);

//header( 'content-type: text/html; charset=utf-8' );

	date_default_timezone_set('America/Sao_Paulo');
//  	mysqli_set_charset($connDB, "utf8");

//error_reporting(E_ALL & ~E_DEPRECATED & ~E_NOTICE);
error_reporting(0);

// $connDB = new mysqli($hostname_connDB, $username_connDB, $password_connDB,$database_connDB); 
// $connSave = new mysqli($hostname_connSave, $username_connSave, $password_connSave,$database_connSave); 
// if (mysqli_connect_errno()) {
// 		die(mysqli_connect_error());
// 		exit();
// 	}
	
?>