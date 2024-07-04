<?php 

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "login";

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}


function getAllUsers($con){
    $query = "SELECT * FROM vwallusersdata"; //String de consulta a BD
    $result = $con->query($query); 
    
    if ($result->num_rows > 0) {
        // Recorre cada fila del resultado y añádela al array $rows
        while($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
    }
    
    return $rows;
}

function getAllTypes($con){
    $query = "SELECT * FROM catusertypes";
    $result = $con->query($query);
       $rows = array();//Array que almacena los registros

       // Verifica si la consulta devuelve resultados
       if ($result->num_rows > 0) {
           // Recorre cada fila del resultado y añádela al array $rows
           while($row = $result->fetch_assoc()) {
               $rows[] = $row;
           }
       }
       
       return $rows;
}

?>