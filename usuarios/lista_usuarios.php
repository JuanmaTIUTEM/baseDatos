<?php 
    include   "../php/conexion_users.php";

    $allUsers = getAllUsers($conn);


    session_start();
	if (!isset($_SESSION['userId'])) {
	    // Redirigir a index.php con un mensaje de error en la URL
	    header("Location: ../index.php?error=login_required");
	    exit; // Asegurarse de que el script se detenga después de la redirección
	}
	if ($_SESSION['user']['userTypeId'] != 1) {
		 // Redirigir a index.php con un mensaje de error en la URL
	    header("Location: ../errores/noAutorizado.php?error=not_access");
	    exit; // Asegurarse de que el script se detenga después de la redirección
	}else{

 ?>

 <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

   
    <title>
        Usuarios
    </title>

<link href="../css/styles.css" rel="stylesheet">
    
</head>
<body class="m-1 bg-ligthGray">

    <main>
        <nav class="navbar navbar-expand-sm bg-success  navbar-dark">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><?php echo $_SESSION['user']['first_name']." ".$_SESSION['user']['last_name'] ?></a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
                    <ul class="navbar-nav">

                        <?php 
                            if ($_SESSION['user']['userTypeId'] == 1) {
                        ?>
                        <li class="nav-item">
                            <a class="nav-link btn btn-outline-dark" href="../materias/materias.php">Control de Materias</a>
                        </li>
                        <?php 
                            }
                         ?>
                        <li class="nav-item">
                            <a class="nav-link btn btn-outline-dark" href="#">Cambiar Contraseña</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn btn-outline-dark" href="../php/logout.php">Cerrar Serión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </main>

    <section class="d-flex justify-content-center">
        <div id="contenido" class="m-2 container-fluid border border-1 border-success  bg-light">
            <div class="d-flex flex-column justify-content-center">
                <div id="titulo">
                    <h2 class="text-center">Listado de usuarios <hr></h2>
                </div>
                <div class="ms-auto">
                    <button type="button" class="btn btn-md btn-success" data-bs-toggle="modal" data-bs-target="#newUser">Nuevo Usuario</button>
                </div>
                    <div class="container mt-3 table-responsive">
                                  
                      <table class="table table-dark table-hover">
                        <thead >
                            <tr class="text-center">
                              <th>#</th>
                              <th>Código</th>
                              <th>Nombre Completo</th>
                              <th>Email</th>
                              <th>Tipo Usuario</th>
                              <th>Acciones</th>
                            </tr>
                          </thead>
                        <tbody class="text-center">
                            <?php 
                                foreach ($allUsers as $user) {
                                    echo "<tr>";
                                    echo "<td>".$user['user_id']."</td>";
                                    echo "<td>".$user['user_code']."</td>";
                                    echo "<td>".$user['first_name']." ".$user['last_name']."</td>";
                                    echo " <td>".$user['email']."</td>";
                                    echo " <td>".$user['userType']."</td>";
                                    echo '<td class="d-flex justify-content-between">
                                <div>
                                   <button class="btn btn-sm btn-outline-info">Editar</button> 
                                </div>';
                                echo '<div>';
                                if($user['userActive']== 1){
                                  echo '<button class="btn btn-sm btn-outline-danger">Inactivar</button>';
                                }else{
                                  echo '<button class="btn btn-sm btn-outline-success">Activar</button>';
                                }
                                
                                echo '</div>';
                                
                            echo "</td>";
                            echo "</tr>";
                                }
                            ?>                          
                        </tbody>
                      </table>
                    </div>

                
            </div>
        </div>
    </section>

    <footer>
        
    </footer>

</body>

<div class="modal " id="newUser">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Nuevo Usuario</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body ">
        <form action="../php/inserts.php" method="POST">
            <input type="hidden" name="option" value="1">
            <div class="d-flex flex-column" id="datosGenerales">
                
                <h5 class="text-center">Datos generales <hr></h5>
                <div class="input-group mb-3">
                  <span class="input-group-text">Nombre Completo</span>
                  <input type="text" class="form-control" placeholder="Nombre" name="nombre">
                  <input type="text" class="form-control" placeholder="Apellidos" name="apellidos">
                </div>

                <div>
                    <div class="input-group">
                        <span class="input-group-text">Email:</span>
                        <input type="text" class="form-control" placeholder="email" name="email">
                        <span class="input-group-text">Teléfono:</span>
                        <input type="text" class="form-control" placeholder="ej. 3141234567" name="phone">
                    </div>    
                </div>
            </div>
            <hr>    
            <div class="mt-1 d-flex flex-column" id="datosUsuario">
                    <h5 class="text-center">Datos de usuario <hr></h5>
                    <div class="d-flex justify-content-between">
                        <div class="input-group mb-3">
                          <span class="input-group-text">Nickname</span>
                          <input type="text" class="form-control" placeholder="Nombre de Usuario" name="nickname">
                        </div>
                        <div class="input-group mb-3">
                          <span class="input-group-text">Password</span>
                          <input type="password" class="form-control" placeholder="Contraseña" name="pass">
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <div class="input-group mb-3 w-50">
                          <span class="input-group-text ">Tipo de usuario:</span>
                          <select name="userType" class="form-control">
                              <?php 
                              $allTypes = getAllTypes($conn);

                              echo "<option value='0'>Selecciona una opción</option>";

                              foreach($allTypes as $type){
                                echo "<option value='".$type['userTypeId']."' title='".$type['userTypeId']."'>".$type['userType']."</option>";

                              }

                              ?>
                          </select>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between">
                        <div class="input-group mb-3">
                            <span class="input-group-text">Departamento:</span>
                            <input type="text" class="form-control" placeholder="Ej. Sistemas" name="departamento">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">Grupo:</span>
                            <input type="text" class="form-control" placeholder="Ej. 3TID1" name="grupo">
                        </div>    
                    </div>
                    <div class="d-flex justify-content-between">
                        <div class="input-group mb-3">
                            <span class="input-group-text">Carrera:</span>
                            <input type="text" class="form-control" placeholder="Ej. TSU en TID" name="carrera">
                        </div>
                           
                    </div>
                </div>
            </div>
        

      <!-- Modal footer -->
      <div class="modal-footer d-flex justify-content-between">
        <button type="submit" class="btn btn-success" data-bs-dismiss="modal">Enviar</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
      </form>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/script.js"></script>
</html>

<?php } ?>