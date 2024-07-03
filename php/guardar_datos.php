<?php
require 'conexion_materias.php';
print_r($_POST);

// Recibir los datos del formulario
$nombreMateria = $_POST['nombreMateria'];
$objetivoAprendizaje = $_POST['objetivoAprendizaje'];
$cuatrimestre = $_POST['cuatrimestre'];
$horasTeoricas = $_POST['horasTeoricas'];
$horasPracticas = $_POST['horasPracticas'];
$horasPracticas = $_POST['horasPracticas'];
$horasTotalesSemanaCuatrimestre = $_POST['horasTotalesSemanaCuatrimestre'];
$competencias = $_POST['competencias'];


$sql ="INSERT INTO `materias`(`nombre`, `competencias`, `cuatrimestre`, `horas_teoricas`, `horas_practicas`, `horas_totales`, `horas_semanales`, `objetivo_aprendizaje`) VALUES ('$nombreMateria','$competencias','[$cuatrimestre',$horasTeoricas,'$horasPracticas',$horasTotalesSemanaCuatrimestre,'[value-7]','[value-8]')"

$queryMaterias = "CALL AgregarMateria ('$nombreMateria','$objetivoAprendizaje','$cuatrimestre',$horasTeoricas,$horasPracticas,$horasTotalesSemanaCuatrimestre,'$competencias')"

echo $queryMaterias;

$conn->close();
?>
