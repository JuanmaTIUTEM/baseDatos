<?php 
	include 'conexion_users.php';
	print_r($_POST);

	$option =  $_POST['option'];

	if($option == 1){
		$query = "INSERT INTO catpersons(personName, personLName, personEmail, personPhone) VALUES ('".$_POST['nombre']."','".$_POST['apellidos']."','".$_POST['email']."','".$_POST['phone']."')";
		
			$result = $mysqli->query($query);
			if($result){
				$p = 1;
			}else{
				$p = 0;
			}
		$id = $mysqli->insert_id; //Esta línea obtiene el ID generado automáticamente 
								  //por la base de datos para la última fila que se ha insertado.
		echo "ID insertada:" . $id;
		$query2 = "INSERT INTO catusers(fk_personId, fk_UserTypeId, cveUser, userPass, departament, groupStdnt, career, dependence) VALUES ('".$id."','".$_POST['userType']."','".$_POST['nickname']."',md5('".$_POST['pass']."'),'".$_POST['departamento']."','".$_POST['grupo']."','".$_POST['carrera']."','UTeM')";

		$result2 = $mysqli->query($query2);
		if($result2 && $p){
			echo "<br>Datos enviados correctamente<hr><br>";
			header("Location:index.php");

		}


	}

 ?>