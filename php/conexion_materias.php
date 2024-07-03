<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bdasignaturas";

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

function getAllMaterias($con){
    $sql = "SELECT * FROM Materias";
    $result = $con->query($sql);

    $materias = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $materias[] = $row;
        }
         return $materias;
    }else{
        return $error['message_error'] = "No hay materias registradas";
    }

   

    $con->close();
}




?>
