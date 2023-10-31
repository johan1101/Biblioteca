<%@page import="Clases.Serializacion"%>
<%@page import="Clases.Lista"%>

<!-- Incluci�n de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<style>
    <%@include file= "style/biblioteca.css" %>
    .dropdown-left {
        text-align: left; /* Alinea el texto del dropdown a la izquierda */
    }
</style>

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Librerias Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

<!-- Bootstrap Stylesheet -->
<link href="style/style.css" rel="stylesheet">

<%
    // Crear una instancia de la clase ListasEnlazadas
    Lista listaEnlazada = new Lista();

    // Obtener el contexto del servlet
    ServletContext context = getServletContext();

    listaEnlazada = Serializacion.leerArchivoLibros(context);

    if (listaEnlazada == null) {
        listaEnlazada = new Lista();
    }
%>

<div class="container-fluid bg-light pt-3 d-none d-lg-block">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <p><i></i>Todos los libros</p>
                    <p class="text-body px-3">|</p>
                    <p><i></i>que puedas imaginar</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid position-relative nav-bar p-0">
    <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
        <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
            <a href="" class="navbar-brand">
                <h1 class="m-0 text-primary"><span class="text-dark">BIBLIO</span>TECA</h1>
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                <div class="navbar-nav ml-auto py-0">
                    <!-- Enlaces del men� superior que dirigen a las paginas inico y otras -->
                    <a href="inicio.jsp" class="nav-item nav-link">Inicio</a> 
                    <a href="agregarLibro.jsp" class="nav-item nav-link">Agregar libro</a> 
                    <a href="biblioteca.jsp" class="nav-item nav-link active">Listado de libros</a> 
                    <a href="#" class="nav-item nav-link">Buscar</a>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="container-fluid page-header">
    <div class="container">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
            <h3 class="display-4 text-white text-uppercase">Libros</h3>
            <div class="d-inline-flex text-white">
                <p class="m-0 text-uppercase"><a class="text-white" href="">Inicio</a></p>
                <i class="fa fa-angle-double-right pt-1 px-3"></i>
                <p class="m-0 text-uppercase">Libros</p>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-3 pb-3">
            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Todas los libros registrados</h6>
            <h1>Libros</h1>
        </div>
        <div class="row">
            <%
                // Llama al m�todo MostrarLista() para generar la representaci�n HTML de la lista de libros
                String listaLibrosHTML = listaEnlazada.MostrarLista();
                out.println(listaLibrosHTML);
            %>
        </div>
    </div>
</div>
<center>
    <!-- Bot�n que redirige a la p�gina inicial (index) -->
    <a href='inicio.jsp' class='btn btn-primary py-md-3 px-md-5 mt-2'style='margin-right: 30px;'>Regresar</a>

    <!-- Bot�n que envia a la p�gina de agregarLibro para agregar un nuevo libro -->
    <a href='agregarLibro.jsp' class='btn btn-primary py-md-3 px-md-5 mt-2'>Agregar libro</a><br>
</center><br><br>

<!-- Modal para eliminar un libro -->
<div class="modal fade" id="eliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="popup">
                <div class="form">
                    <h2>�Seguro que quieres eliminar este libro?</h2>
                    <div class="form-element" style="display: flex; justify-content: space-between;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar</button>
                        <button type="button" class="btn btn-danger" style="margin-left: 10px;" onclick="eliminar()">Eliminar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="editarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <form id="fileUploadForm" enctype="multipart/form-data">
                <div class="popup" >
                    <div class="close-btn" class="btn-close" data-bs-dismiss="modal">&times;</div>
                    <div class="form">
                        <h2>Editar libro</h2>
                        <div class="form-element">
                            <label for="email">Titulo</label>
                            <input type="text" id="nuevoTitulo" name="cedula" placeholder="Ingrese el nuevo titulo" maxlength="10" required>
                        </div>
                        <div class="form-element">
                            <label for="email">Autor</label>
                            <input type="text" id="nuevoAutor" name="nombre" placeholder="Ingrese el nuevo autor" maxlength="20" required>
                        </div>
                        <div class="form-element">
                            <label for="email">Fecha de publicaci�n</label>
                            <br><input type="date" id="nuevaFecha" name="contrasena" placeholder="Ingresa tu contrase�a" required>
                        </div>
                        <div class="form-element">
                            <label for="email">Imagen</label>
                            <br><input type="file" id="imagen" name="imagen" placeholder="Ingresa tu nombre" maxlength="20" required>
                        </div>
                        <div class="form-element">
                            <button type="submit" onclick="editarLibro()">Editar</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

    var codigoEliminar;
    function mostrarModalEliminar(opcion) {

        $('#eliminar').modal('show');

        codigoEliminar = opcion;
    }

    function eliminar() {

        var eliminar = codigoEliminar;

        // Realiza una solicitud AJAX al servlet para realizar la ordenaci�n alfab�tica
        $.ajax({
            url: 'SvEliminar?opcion=' + eliminar,
            method: 'POST', // Utiliza POST u otro m�todo HTTP seg�n corresponda
            success: function (data) {
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:
                // Registra un mensaje de error en la consola (para fines de depuraci�n)
                console.log('Error al realizar la ordenaci�n alfab�tica.');
            }
        });
    }

    var codigoE
    function mostrarModalEditar(codigo) {
        $('#editar').modal('show');
        var codigoE = codigo;
    }

    function editarLibro() {
        var codigoEditar = codigoE;
        var form = document.getElementById("fileUploadForm");
        // Verificar la validez del formulario
        if (form.checkValidity()) {

            // Obt�n el formulario
            var form = document.getElementById("fileUploadForm");
            // Construye un objeto FormData con el formulario
            var formData = new FormData(form);

            var nuevoTitulo = document.getElementById('nuevoTitulo').value;
            var nuevoAutor = document.getElementById('nuevoAutor').value;
            var nuevaFecha = document.getElementById('nuevaFecha').value;

            formData.append('nuevoTitulo', nuevoTitulo);
            formData.append('nuevoAutor', nuevoAutor);
            formData.append('nuevaFecha', nuevaFecha);
            $.ajax({
                url: 'SvEditar', // URL del servlet que manejar� la edici�n de la foto
                method: 'POST', // Utiliza POST para enviar datos de formulario
                data: formData, // Env�a los datos del formulario incluyendo el archivo y el nombre
                contentType: false, // Establece el tipo de contenido como false para que jQuery maneje autom�ticamente el encabezado
                processData: false, // No procesa los datos, ya que FormData lo hace autom�ticamente
                success: function (data) {
                    // En caso de �xito en la solicitud:
                    // Cierra el modal de edici�n de foto
                    $('#editar').modal('hide');
                    // Recarga la p�gina actual para reflejar los cambios
                    location.reload();
                },
                error: function () {
                    // En caso de error en la solicitud:
                    // Registra un mensaje de error en la consola (para fines de depuraci�n)
                    console.log('Error al editar la foto del perro.');
                }
            });
        }
    }

</script>

<!-- Incluci�n de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>