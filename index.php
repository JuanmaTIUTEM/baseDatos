<?php
session_start();

// Verificar si hay un mensaje de error en la URL
$error_message = '';
if (isset($_GET['error'])) {
    if ($_GET['error'] === 'login_required') {
        $error_message = 'Debe iniciar sesión antes de acceder a esta página.';
    }
}

// Resto del contenido de index.php
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Base de Datos para Aplicaciones Hojas de Asignatura</title>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
	<main>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">TSU en TID</a>
			</div>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="#">Log-In</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Acerca de</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</main>

<section id="dashboard">
	<div class="d-flex justify-content-center">
		<div id="title" class="texr-center">
			<h2>Hojas de Asignatura <hr></h2>
		</div>		
	</div>
</section>
<section id="log_in" class="container-fluid border border-start-0 shadow-lg p-4 mb-4 bg-white justify-content-center w-75 ">
	<div class="p-2 container">
		<h4 class="text-center"> Iniciar Sesion</h4>
	</div>
	<div class="d-flex justify-content-center">
		<form action="php/login.php" method="POST">
		  <div class="mb-3 mt-3 text-center">
		    <label for="userName" class="form-label">Usuario:</label>
		    <input type="text" class="form-control" id="userName" placeholder="Nombre de Usuario" name="userName">
		  </div>
		  <div class="mb-3 text-center">
		    <label for="pwd" class="form-label">Contraseña:</label>
		    <input type="password" class="form-control" id="pwd" name="pswd">
		  </div>
		  <div class="d-flex justify-content-center">
		  	<div>
		  		<button type="submit" class="btn btn-outline-success">Ingresar</button>
		  	</div>
		  </div>
		</form>
	</div>
	
</section>
<?php if (!empty($error_message)) : ?>
	<div class="d-flex justify-content-center mt-3">
		<div class=" alert alert-warning alert-dismissible fade show w-50">
		    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		    <strong>ERROR!</strong> <?php echo htmlspecialchars($error_message); ?>
		  </div>
	</div>
<?php endif; ?>
</body>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
