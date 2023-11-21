<%@page import="Clases.Serializacion"%>
<%@page import="Clases.Lista"%>

<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<style>
    <%@include file= "style/biblioteca.css" %>
    .dropdown-left {
        text-align: left; /* Alinea el texto del dropdown a la izquierda */
    }

    .cardList{
        border-radius: 12px;
    }

    .gx-5 {
        --bs-gutter-y: 2rem;
    }
    
    .modal-ancho .modal-dialog {
        max-width: 50%; /* Ajusta el valor para el ancho deseado */
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
                    <!-- Enlaces del menú superior que dirigen a las paginas inico y otras -->
                    <a href="inicio.jsp" class="nav-item nav-link">Inicio</a> 
                    <a href="agregarLibro.jsp" class="nav-item nav-link">Agregar libro</a> 
                    <a href="biblioteca.jsp" class="nav-item nav-link">Listado de libros</a>
                                        <a href="librosPrestamo.jsp" class="nav-item nav-link active">Prestamos</a>
                    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li>
                                <center>
                                    <img src="./img/imagenUsua.jpeg" alt="" width="160px" height="150px" style="display: block; margin: 0 auto; margin-right: 10px; margin-left: 10px; margin-top: 10px; margin-bottom: 10px">
                                </center>
                        </li>
                        <li><a style="text-align: center;" class="dropdown-item heading-section"><%= session.getAttribute("nombreUsuario")%></a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a style="text-align: left;" class="dropdown-item left-align" href="index.jsp">Cerrar sesión</a></li>
                    </ul>
                    </li>
                    </ul>
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
    <div class="row justify-content-end">
        <div class="col-lg-3 col-md-2 col-sm-2 mb-2" style="margin-right: 250px; margin-top: 18px">
            <div class="input-group"> 
                <input style="height: 45px;" type="text" class="form-control" id="busqueda" placeholder="Buscar">
                <button style="height: 45px;" class="btn btn-primary float-right" type="submit">Buscar</button>
            </div>
        </div>
    </div><br>

    <div class="container pt-5 pb-3">
        <div class="text-center mb-3 pb-3">
            <h5 class="text-primary text-uppercase" style="letter-spacing: 5px">Todos los libros en prestamo</h5>
            <h1>Libros</h1><br><br>
        </div>

        <div class="row gx-5 justify-content-center d-flex">
            <%
                // Recuperar el valor del atributo "codigo" de la sesión
                int codigoUsuario = (int) session.getAttribute("codigoUsuario");
                // Llama al método MostrarLista() para generar la representación HTML de la lista de libros
                String listaLibrosHTML = listaEnlazada.MostrarListaPrestados(codigoUsuario);
                out.println(listaLibrosHTML);
            %>
        </div>
    </div>
</div>

<center>
    <!-- Botón que redirige a la página inicial (index) -->
    <a href='biblioteca.jsp' class='btn btn-primary py-md-3 px-md-5 mt-2'style='margin-right: 30px;'>Todos los libros</a>
</center><br><br>

<!----------------------------------------------------- VENTANAS MODALES ----------------------------------------------------->

<!-- Modal para la visualización del libro -->
<div class="modal fade modal-ancho" id="exampleModalDetalles" tabindex="-1" aria-labelledby="exampleModalLabelDetalles" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabelDetalles">Detalles del libro</h5>
            </div>
            <div class="modal-body">
                <div id="libro-details">
                    <!-- Aquí se mostrarán los detalles del libro -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal para devolver un libro -->
<div class="modal fade" id="devolverLibro" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="devolverLibroLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="popup">
                <div class="form">
                    <h2>¿Seguro que quieres devolver este libro?</h2>
                    <div class="form-element" style="display: flex; justify-content: space-between;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar</button>
                        <button type="button" class="btn btn-danger" style="margin-left: 10px;" onclick="devolver()">Devolver</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="editarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="popup" >
                <div class="close-btn" class="btn-close" data-bs-dismiss="modal">&times;</div>
                <div class="form">
                    <form action="SvEditar" method="POST" enctype="multipart/form-data">
                        <h2>Editar libro</h2>
                        <div id="libro">

                        </div>
                        <div class='form-element'>
                            <button type='submit'>Editar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top" style="display: inline;"><i class="fa fa-angle-double-up"></i></a>

<%
    String valorCodigo = request.getParameter("codigoE");

    if (valorCodigo != null) {
%>

<script>
    $(document).ready(function () {
        mostrarModal();
    });
</script>
<%
    }
%>

<script>
 var codigoDevolver;
    function mostrarModalDevolver(codigo) {

        $('#devolverLibro').modal('show');

         codigoDevolver = codigo;
    }
    
        function devolver() {

        var codigo = codigoDevolver;

        // Realiza una solicitud AJAX al servlet para realizar la ordenación alfabética
        $.ajax({
            url: 'SvDevolverLibro?codigo=' + codigo,
            method: 'POST', // Utiliza POST u otro método HTTP según corresponda
            success: function (data) {
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:
                // Registra un mensaje de error en la consola (para fines de depuración)
                console.log('Error al realizar la ordenación alfabética.');
            }
        });
    }
    
    
    var codigoE = "";
    function mostrarModalEditar(codigo) {
        var ventana = "prestamos";
        codigoE = codigo;
        $('#editar').modal('show');

        $.ajax({
            url: 'SvEditar?codigo=' + codigo + '&ventana=' + ventana,
            method: 'GET', // Utiliza POST u otro método HTTP según corresponda
            success: function (data) {

            },
            error: function () {
                // En caso de error en la solicitud:
                // Registra un mensaje de error en la consola (para fines de depuración)
                console.log('Error al realizar la ordenación alfabética.');
            }
        });
    }

    /**
     * Esta función se encarga de mostrar los detalles de un libro en una ventana modal.
     * Se dispara cuando se muestra el modal.
     */
    $('#exampleModalDetalles').on('show.bs.modal', function (event) {
        // Obtiene el botón que desencadenó el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el código del libro desde el atributo 'data-nombre' del botón
        var codigo = button.data('nombre');

        // Realiza una solicitud AJAX al servlet para obtener los detalles del libro por su código
        $.ajax({
            url: 'SvAgregarLibro?codigo=' + codigo, // Utiliza 'codigo' en lugar de 'nombre'
            method: 'GET', // Método HTTP utilizado para la solicitud
            success: function (data) {
                // La función que se ejecuta cuando la solicitud AJAX es exitosa

                // Actualiza el contenido del modal con los detalles del libro
                $('#libro-details').html(data);
            },
            error: function () {
                // La función que se ejecuta en caso de error durante la solicitud AJAX

                // Maneja errores aquí si es necesario, por ejemplo, muestra un mensaje en la consola
                console.log('Error al cargar los detalles del libro');
            }
        });
    });
    
        $('#editar').on('show.bs.modal', function (event) {
        // Obtiene el botón que desencadenó el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el nombre del perro desde el atributo 'data-nombre' del botón
        var codigo = button.data('codigo');

        console.log(codigo);

        // Realiza una solicitud AJAX al servlet para obtener los detalles del libro por su codigo
        $.ajax({
            url: 'SvMostrarInformacionEditar?codigo=' + codigo, // La URL del servlet, puede variar según la configuración
            method: 'GET', // Método HTTP utilizado para la solicitud
            success: function (data) {
                // La función que se ejecuta cuando la solicitud AJAX es exitosa

                // Actualiza el contenido del modal con los detalles del libro
                $('#libro').html(data);
            },
            error: function () {
                // La función que se ejecuta en caso de error durante la solicitud AJAX

                // Maneja errores aquí si es necesario, por ejemplo, muestra un mensaje en la consola
                console.log('Error al cargar los detalles del libro');
            }
        });
    });
</script>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
