<?php
    session_start();
    if (!isset($_SESSION['userId'])) {
        // Redirigir a index.php con un mensaje de error en la URL
        header("Location: ../index.php?error=login_required");
        exit; // Asegurarse de que el script se detenga después de la redirección
    }
    require '../php/conexion_materias.php';

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Materias</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="../css/styles.css" rel="stylesheet">
    
</head>
<body class="m-1 bg-ligthGray">
    <main>
        <nav class="navbar navbar-expand-sm bg-success navbar-dark">
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
                            <a class="nav-link btn btn-outline-dark" href="../usuarios/lista_usuarios.php">Control de Usuarios</a>
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
    <div class="rounded-3 m-1 p-2 h-auto shadow p-4 mb-4 bg-white">
        <div class="d-flex flex-column justify-content-center">
            <div id="titulo">
                <h2 class="text-center">Gestión de Materias <hr></h2>
            </div>
            <div class="ms-auto">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalMateria">Crear Nueva Materia</button>
            </div>
        </div>
        <hr>
        <div class="d-flex flex-wrap justify-content-between">
            <?php 
                $llenar = 7;
                $materias = getAllMaterias($conn);
                if(!isset($materias['message_error'])){
                    foreach ($materias as $materia) {
            ?>
            <div class="card w-25 responsive-card">
                <div class="card-header text-center">
                  <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseTwo">
                    <h4><strong><?php echo $materia['nombre']; ?></strong></h4>
                  </a>
                </div>
                <div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
                  <div class="card-body">
                    <div class="d-flex flex-column">
                        <?php 
                        
                            if($materia['objetivo_aprendizaje'] != null && $materia['objetivo_aprendizaje'] != '' && $materia['objetivo_aprendizaje'] != ' '){
                        ?>
                        <div>
                            <label class="labelDato text-bg-dark w-100  rounded-1 p-1"><strong>Objetivo:</strong></label>
                            <p class="textoDato border border-secondary w-100  p-2 rounded-2"><?php echo $materia['objetivo_aprendizaje'];  ?></p>
                        </div>

                        <?php 
                                $llenar--;

                            }else{
                                $llenar ++;
                            }
                            if($materia['cuatrimestre'] != null && $materia['cuatrimestre'] != '' && $materia['cuatrimestre'] != ' '){
                        ?>
                            <div>
                                <label class="labelDato text-bg-dark w-100  rounded-1 p-1"><strong>Cuatrimestre:</strong></label>
                                <p class="textoDato border border-secondary w-100  p-2  rounded-2"><?php echo $materia['cuatrimestre'];  ?></p>
                            </div>
                        <?php 
                                $llenar--;

                            }else{
                                $llenar ++;
                            }
                         
                            if($materia['horas_teoricas'] != null && $materia['horas_teoricas'] != '' && $materia['horas_teoricas'] != ' ' && $materia['horas_practicas'] != null && $materia['horas_practicas'] != '' && $materia['horas_practicas'] != ' ' && $materia['horas_totales'] != null && $materia['horas_totales'] != '' && $materia['horas_totales'] != ' ' && $materia['horas_semanales'] != null && $materia['horas_semanales'] != '' && $materia['horas_semanales'] != ' '){
                            ?>
                                <div class="table-responsive rounded-2">
                                    <table class="table table-bordered border border-secondary ">
                                        <thead class="table-dark ">
                                              <tr class="text-center titCol">
                                                <th>Hrs. Teoricas</th>
                                                <th>Hrs. Práctica</th>
                                                <th>Hrs. Totales</th>
                                                <th>Hrs. Semana</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                              <tr class="text-center textoDato">
                                                <td><?php echo $materia['horas_teoricas']; ?></td>
                                                <td><?php echo $materia['horas_practicas']; ?></td>
                                                <td><?php echo $materia['horas_totales']; ?></td>
                                                <td><?php echo $materia['horas_semanales']; ?></td>
                                              </tr>
                                            </tbody>
                                          </table>
                                </div>
                            <?php 
                                $llenar -=4;

                            }else{
                                $llenar += 4;
                            }
                        
                            if($materia['competencias'] != null && $materia['competencias'] != '' && $materia['competencias'] != ' '){
                        ?>
                            <div>
                                <label class="labelDato text-bg-dark w-100  rounded-1 p-1"><strong>Competencias:</strong></label>
                                <p class="textoDato border border-secondary w-100  p-2  rounded-2"><?php echo $materia['competencias'];  ?></p>
                            </div>
                        <?php 
                               $llenar --;

                           }else{
                               $llenar ++;
                           }

                        ?>
                         
                    </div>
                        
                  </div>
                  
                  <div class="card-footer">
                    <div class="d-flex justify-content-center">
                        <?php if($llenar != 0){ ?>
                            <div>
                                <button type="button" class="btn btn-outline-warning">Agregar datos faltantes</button>
                            </div>

                        <? } ?>
                            <div>
                                <button type="button" class="btn btn-outline-warning">Agregar datos</button>
                            </div>                            
                        <?php } ?>                                                
                    </div>
                  </div>
                </div>
              </div>
            
            <?php 

                }
            ?>

            
        </div>


        </div>
        

        <!-- Modal -->
        <div class="modal fade" id="modalMateria" tabindex="-1" aria-labelledby="modalMateriaLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalMateriaLabel">Crear Nueva Materia</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="materiaForm">
                            <div class="mb-3">
                                <label for="nombreMateria" class="form-label">Nombre de la Materia</label>
                                <input type="text" class="form-control" id="nombreMateria" name="nombreMateria" required>
                            </div>
                            <div class="mb-3">
                                <label for="objetivoAprendizaje" class="form-label">Objetivo de Aprendizaje</label>
                                <textarea class="form-control" id="objetivoAprendizaje" name="objetivoAprendizaje" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="competencias" class="form-label">Competencias</label>
                                <textarea class="form-control" id="competencias" name="competencias" rows="3" required></textarea>
                            </div>
                            <div class="d-flex flex-wrap justify-content-around">
                                <div class="mb-3">
                                    <label for="cuatrimestre" class="form-label">Cuatrimestre</label>
                                    <input type="text" class="form-control" id="cuatrimestre" name="cuatrimestre" required>
                                </div>
                                <div class="mb-3">
                                    <label for="horasTeoricas" class="form-label">Horas Teóricas</label>
                                    <input type="number" class="form-control" id="horasTeoricas" name="horasTeoricas" required>
                                </div>
                                <div class="mb-3">
                                    <label for="horasPracticas" class="form-label">Horas Prácticas</label>
                                    <input type="number" class="form-control" id="horasPracticas" name="horasPracticas" required>
                                </div>
                                <div class="mb-3">
                                    <label for="horasTotalesSemanaCuatrimestre" class="form-label">Horas Totales por Semana Cuatrimestre</label>
                                    <input type="number" class="form-control" id="horasTotalesSemanaCuatrimestre" name="horasTotalesSemanaCuatrimestre" required>
                                </div>
                            </div>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="unidades-tab" data-bs-toggle="tab" href="#unidades" role="tab" aria-controls="unidades" aria-selected="true">Unidades de Aprendizaje</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="evaluacion-tab" data-bs-toggle="tab" href="#evaluacion" role="tab" aria-controls="evaluacion" aria-selected="false">Proceso de Evaluación</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="ensenanza-tab" data-bs-toggle="tab" href="#ensenanza" role="tab" aria-controls="ensenanza" aria-selected="false">Proceso de Enseñanza-Aprendizaje</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="capacidades-tab" data-bs-toggle="tab" href="#capacidades" role="tab" aria-controls="capacidades" aria-selected="false">Capacidades Derivadas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="fuentes-tab" data-bs-toggle="tab" href="#fuentes" role="tab" aria-controls="fuentes" aria-selected="false">Fuentes Bibliográficas</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active container shadow-lg p-4 mb-4 bg-white" id="unidades" role="tabpanel" aria-labelledby="unidades-tab">
                                    <div id="unidadesContainer"></div> <hr>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-outline-primary mt-3" id="agregarUnidadBtn">Agregar Unidad de Aprendizaje</button>
                                    </div>
                                </div>
                                <div class="tab-pane fade container shadow-lg p-4 mb-4 bg-white" id="evaluacion" role="tabpanel" aria-labelledby="evaluacion-tab">
                                    <div id="procesoEvaluacionContainer"></div> <hr>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-outline-primary mt-3" id="agregarEvaluacionBtn">Agregar Proceso de Evaluación</button>
                                    </div>
                                </div>
                                <div class="tab-pane fade container shadow-lg p-4 mb-4 bg-white" id="ensenanza" role="tabpanel" aria-labelledby="ensenanza-tab">
                                    <div id="procesoEnsenanzaContainer"></div> <hr>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-outline-primary mt-3" id="agregarEnsenanzaBtn">Agregar Proceso de Enseñanza-Aprendizaje</button>
                                    </div>
                                </div>
                                <div class="tab-pane fade container shadow-lg p-4 mb-4 bg-white" id="capacidades" role="tabpanel" aria-labelledby="capacidades-tab">
                                    <div id="capacidadesContainer"></div> <hr>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-outline-primary mt-3" id="agregarCapacidadBtn">Agregar Capacidad Derivada</button>
                                    </div>
                                </div>
                                <div class="tab-pane fade container shadow-lg p-4 mb-4 bg-white" id="fuentes" role="tabpanel" aria-labelledby="fuentes-tab">
                                    <div id="fuentesContainer"></div> <hr>
                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn btn-outline-primary mt-3" id="agregarFuenteBtn">Agregar Fuente Bibliográfica</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" id="guardarMateria">Guardar Materia</button>
                    </div>
                </div>
            </div>
        </div>


    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/script.js"></script>
</body>
<?php } ?>
</html>