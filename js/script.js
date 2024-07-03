$(document).ready(function() {
            var unidadCounter = 0;
            var temaCounter = 0;
            var evaluacionCounter = 0;
            var ensenanzaCounter = 0;
            var capacidadCounter = 0;
            var fuenteCounter = 0;

            // Agregar unidad de aprendizaje dinámicamente
            $("#agregarUnidadBtn").click(function() {
                unidadCounter++;
                temaCounter = 0; // Reset temaCounter for each new unidad
                var html = `
                    <div class="unidadAprendizaje mb-3  border border-top-0 container">
                        <h4>Unidad de Aprendizaje ${unidadCounter}</h4>
                        <div class="mb-3">
                            <label for="nombreUnidad${unidadCounter}" class="form-label">Nombre de la Unidad</label>
                            <input type="text" class="form-control nombreUnidad" id="nombreUnidad${unidadCounter}" name="nombreUnidad${unidadCounter}" required>
                        </div>
                        <div id="temasContainer${unidadCounter}"></div>
                        <button type="button" class="btn btn-outline-primary mt-3 agregarTemaBtn" data-unidad="${unidadCounter}">Agregar Tema</button>
                        <button type="button" class="btn btn-outline-danger mt-3 eliminarUnidadBtn">Eliminar Unidad de Aprendizaje</button>
                    </div>
                `;
                $("#unidadesContainer").append(html);
            });

            // Agregar tema dinámicamente
            $(document).on("click", ".agregarTemaBtn", function() {
                var unidadId = $(this).data("unidad");
                temaCounter++;
                var html = `
                    <div class="tema mb-3">
                        <h5>Tema ${temaCounter}</h5>
                        <div class="mb-3">
                            <label for="nombreTema${unidadId}-${temaCounter}" class="form-label">Nombre del Tema</label>
                            <input type="text" class="form-control" id="nombreTema${unidadId}-${temaCounter}" name="nombreTema${unidadId}-${temaCounter}" required>
                        </div>

                        <div class="saberContainer mb-3 border border-top-0 container" id="saberContainer${unidadId}-${temaCounter}">
                            <h6>Saber</h6>
                            <div class="mb-3">
                                <label for="saber${unidadId}-${temaCounter}-1" class="form-label">Saber</label>
                                <textarea class="form-control" id="saber${unidadId}-${temaCounter}-1" name="saber${unidadId}-${temaCounter}-1" rows="3" required></textarea>
                            </div>
                        </div>
                        

                        <div class="saberHacerContainer mb-3 border border-top-0 container" id="saberHacerContainer${unidadId}-${temaCounter}">
                            <h6>Saber Hacer</h6>
                            <div class="mb-3">
                                <label for="saberHacer${unidadId}-${temaCounter}-1" class="form-label">Saber Hacer</label>
                                <textarea class="form-control" id="saberHacer${unidadId}-${temaCounter}-1" name="saberHacer${unidadId}-${temaCounter}-1" rows="3" required></textarea>
                            </div>
                        </div>
                        

                        <div class="serContainer mb-3 border border-top-0 container" id="serContainer${unidadId}-${temaCounter}">
                            <h6>Ser</h6>
                            <div class="mb-3">
                                <label for="ser${unidadId}-${temaCounter}-1" class="form-label">Ser</label>
                                <textarea class="form-control" id="ser${unidadId}-${temaCounter}-1" name="ser${unidadId}-${temaCounter}-1" rows="3" required></textarea>
                            </div>
                        </div>
                        

                        <button type="button" class="btn btn-outline-danger mt-3 eliminarTemaBtn">Eliminar Tema</button>
                    </div>
                `;
                $("#temasContainer" + unidadId).append(html);
            });

            // Eliminar unidad de aprendizaje
            $(document).on("click", ".eliminarUnidadBtn", function() {
                $(this).closest(".unidadAprendizaje").remove();
            });

            // Eliminar tema
            $(document).on("click", ".eliminarTemaBtn", function() {
                $(this).closest(".tema").remove();
            });

            // Agregar proceso de evaluación dinámicamente
            $("#agregarEvaluacionBtn").click(function() {
                evaluacionCounter++;
                var html = `
                    <div class="procesoEvaluacion mb-3  border border-top-0 container">
                        <h4>Proceso de Evaluación ${evaluacionCounter}</h4>
                        <div class="mb-3">
                            <label for="procesoEvaluacion${evaluacionCounter}" class="form-label">Proceso de Evaluación</label>
                            <textarea class="form-control" id="procesoEvaluacion${evaluacionCounter}" name="procesoEvaluacion${evaluacionCounter}" rows="3" required></textarea>
                        </div>
                        <button type="button" class="btn btn-outline-danger eliminarEvaluacionBtn">Eliminar Proceso de Evaluación</button>
                    </div>
                `;
                $("#procesoEvaluacionContainer").append(html);
            });

            // Eliminar proceso de evaluación
            $(document).on("click", ".eliminarEvaluacionBtn", function() {
                $(this).closest(".procesoEvaluacion").remove();
            });

            // Agregar proceso de enseñanza-aprendizaje dinámicamente
            $("#agregarEnsenanzaBtn").click(function() {
                ensenanzaCounter++;
                var html = `
                    <div class="procesoEnsenanza mb-3  border border-top-0 container">
                        <h4>Proceso de Enseñanza-Aprendizaje ${ensenanzaCounter}</h4>
                        <div class="mb-3">
                            <label for="procesoEnsenanza${ensenanzaCounter}" class="form-label">Proceso de Enseñanza-Aprendizaje</label>
                            <textarea class="form-control" id="procesoEnsenanza${ensenanzaCounter}" name="procesoEnsenanza${ensenanzaCounter}" rows="3" required></textarea>
                        </div>
                        <button type="button" class="btn btn-outline-danger eliminarEnsenanzaBtn">Eliminar Proceso de Enseñanza-Aprendizaje</button>
                    </div>
                `;
                $("#procesoEnsenanzaContainer").append(html);
            });

            // Eliminar proceso de enseñanza-aprendizaje
            $(document).on("click", ".eliminarEnsenanzaBtn", function() {
                $(this).closest(".procesoEnsenanza").remove();
            });

            // Agregar capacidad derivada dinámicamente
            $("#agregarCapacidadBtn").click(function() {
                capacidadCounter++;
                var html = `
                    <div class="capacidad mb-3  border border-top-0 container">
                        <h4>Capacidad Derivada ${capacidadCounter}</h4>
                        <div class="mb-3">
                            <label for="capacidad${capacidadCounter}" class="form-label">Capacidad Derivada</label>
                            <textarea class="form-control" id="capacidad${capacidadCounter}" name="capacidad${capacidadCounter}" rows="3" required></textarea>
                        </div>
                        <button type="button" class="btn btn-outline-danger eliminarCapacidadBtn">Eliminar Capacidad Derivada</button>
                    </div>
                `;
                $("#capacidadesContainer").append(html);
            });

            // Eliminar capacidad derivada
            $(document).on("click", ".eliminarCapacidadBtn", function() {
                $(this).closest(".capacidad").remove();
            });

            // Agregar fuente bibliográfica dinámicamente
            $("#agregarFuenteBtn").click(function() {
                fuenteCounter++;
                var html = `
                    <div class="fuente mb-3  border border-top-0 container">
                        <h4>Fuente Bibliográfica ${fuenteCounter}</h4>
                        <div class="mb-3">
                            <label for="autor${fuenteCounter}" class="form-label">Autor</label>
                            <input type="text" class="form-control" id="autor${fuenteCounter}" name="autor${fuenteCounter}" required>
                        </div>
                        <div class="mb-3">
                            <label for="year${fuenteCounter}" class="form-label">Año</label>
                            <input type="number" class="form-control" id="year${fuenteCounter}" name="year${fuenteCounter}" required>
                        </div>
                        <div class="mb-3">
                            <label for="tituloDocumento${fuenteCounter}" class="form-label">Título del Documento</label>
                            <input type="text" class="form-control" id="tituloDocumento${fuenteCounter}" name="tituloDocumento${fuenteCounter}" required>
                        </div>
                        <div class="mb-3">
                            <label for="ciudad${fuenteCounter}" class="form-label">Ciudad</label>
                            <input type="text" class="form-control" id="ciudad${fuenteCounter}" name="ciudad${fuenteCounter}" required>
                        </div>
                        <div class="mb-3">
                            <label for="pais${fuenteCounter}" class="form-label">País</label>
                            <input type="text" class="form-control" id="pais${fuenteCounter}" name="pais${fuenteCounter}" required>
                        </div>
                        <div class="mb-3">
                            <label for="editorial${fuenteCounter}" class="form-label">Editorial</label>
                            <input type="text" class="form-control" id="editorial${fuenteCounter}" name="editorial${fuenteCounter}" required>
                        </div>
                        <button type="button" class="btn btn-outline-danger eliminarFuenteBtn">Eliminar Fuente Bibliográfica</button>
                    </div>
                `;
                $("#fuentesContainer").append(html);
            });

            // Eliminar fuente bibliográfica
            $(document).on("click", ".eliminarFuenteBtn", function() {
                $(this).closest(".fuente").remove();
            });
            $('#guardarMateria').on('click', function() {
                        var formData = $('#materiaForm').serializeArray();
                        console.log(formData);
                        // Aquí puedes enviar los datos del formulario formData a tu backend para guardarlos en la base de datos
                         $.ajax({
                             url: '../php/guardar_datos.php',
                             method: 'POST',
                             data: formData,
                             success: function(response) {
                                 console.log(response);
                             },
                             error: function(xhr, status, error) {
                                 console.error(error);
                             }
                         });
                        $('#modalMateria').modal('hide');
                        $('#materiaForm')[0].reset();
                        $('#unidadesContainer').empty();
                        $('#procesoEvaluacionContainer').empty();
                        $('#procesoEnsenanzaContainer').empty();
                        $('#capacidadesContainer').empty();
                        $('#fuentesContainer').empty();
                        unidadCounter = 0;
                        evaluacionCounter = 0;
                        ensenanzaCounter = 0;
                        capacidadCounter = 0;
                        fuenteCounter = 0;
                    });
        });