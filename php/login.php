<?php
    require 'conexion_users.php';
// Consulta SQL para obtener todos los registros
$query = "SELECT * FROM usersactive";
$result = $conn->query($query);

// Verificar si se encontraron resultados
if ($result->num_rows > 0) {
    // Iterar sobre los resultados usando fetch_assoc dentro de un bucle while
    while ($row = $result->fetch_assoc()) {
        $registros[] = $row;
    }
} else {
    echo "No se encontraron registros.";
}
print_r($_POST);
echo "<br>";
foreach ($registros as $row) {
    echo "<br>";
    if($row['userCode'] == $_POST['userName']){
        if($row['Pass'] == md5($_POST['pswd'])){
            $id= $row['uId'];
            $query2 = "SELECT * FROM vwallusersdata where user_id = $id";
            $result = $conn->query($query2);

            // Verificar si se encontraron resultados
            if ($result->num_rows > 0) {
                // Iterar sobre los resultados usando fetch_assoc dentro de un bucle while
                $user = $result->fetch_assoc();
                print_r($user);
                // Configurar tiempo de vida de la sesión a 5 min (300 segundos)
                // Obtener la dirección IP del usuario
                $ip_address = $_SERVER['REMOTE_ADDR'];

                // Mostrar la dirección IP (para propósitos de demostración)
                echo "Tu dirección IP es: $ip_address";
                session_set_cookie_params(300);
                session_start();
                $current_datetime = date('Y-m-d H:i:s');
                $_SESSION['userId'] =  $ip_address . "_" . $id;
                $_SESSION['user'] = $user;
                $_SESSION['dateTimeSession'] = $current_datetime;
                header("Location: ../materias/materias.php");
                die();
            } else {
                echo "No se encontraron registros.";
            }
            
        }
    }

}
// Cerrar la conexión
$conn->close();
?>
