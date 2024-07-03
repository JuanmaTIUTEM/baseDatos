<?php 

$error_message = '';
if (isset($_GET['error'])) {
    if ($_GET['error'] === 'not_access') {
        $error_message = 'Usuario sin acceso a ese sitio.';
    }
}
 ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Error!! Usuario sin Acceso al sitio...</title>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<main class="d-flex justify-content-center">
		<div class="text-center">
			<h1>ERROR DE ACCESO <hr></h1>
		</div>
	</main>
	<?php if (!empty($error_message)) : ?>
	<div class="d-flex justify-content-center mt-3">
		<div class=" alert alert-danger fade show w-50 text-center">
		    <strong>ERROR!</strong> <?php echo htmlspecialchars($error_message); ?>
		 </div>
	</div>
<?php endif; ?>
</body>
</html>