<?php
require 'conexion_materias.php';
print_r($_POST);

// Recibir los datos del formulario
$nombreMateria = $_POST['nombreMateria'];
$objetivoAprendizaje = $_POST['objetivoAprendizaje'];
$cuatrimestre = $_POST['cuatrimestre'];
$horasTeoricas = $_POST['horasTeoricas'];
$horasPracticas = $_POST['horasPracticas'];
$horasSemanales = $_POST['horasSemanales'];
$competencias = $_POST['competencias'];

// Calcular las horas totales por semana para el cuatrimestre
$horasTotalesSemanaCuatrimestre = intval($horasTeoricas) + intval($horasPracticas);


$sql ="INSERT INTO `materias`(`nombre`, `competencias`, `cuatrimestre`, `horas_teoricas`, `horas_practicas`, `horas_totales`, `horas_semanales`, `objetivo_aprendizaje`) VALUES ('$nombreMateria','$competencias','$cuatrimestre',$horasTeoricas,'$horasPracticas',$horasTotalesSemanaCuatrimestre,$horasSemanales,'$objetivoAprendizaje')";

$queryMaterias = "CALL AgregarMateria ('$nombreMateria','$competencias','$cuatrimestre',$horasTeoricas,'$horasPracticas',$horasTotalesSemanaCuatrimestre,$horasSemanales,'$objetivoAprendizaje, @ultimo_id');";
echo "<br> <h4>Codigo a ejecutar en phpmyadmin:</h4>";
echo $queryMaterias;

//Ejecución de sql en bd
$result = $conn->query($queryMaterias);
if ($result) {
	$row = $result->fetch_assoc();
	print_r($row);
}

$conn->close();
?>
