<%@page import="Clases.Serializacion"%>
<%@page import="Clases.Lista"%>

<!-- Incluci�n de la plantilla de header -->
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
                        <li><a style="text-align: left;" class="dropdown-item left-align" href="index.jsp">Cerrar sesi�n</a></li>
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
                // Recuperar el valor del atributo "codigo" de la sesi�n
                int codigoUsuario = (int) session.getAttribute("codigoUsuario");
                // Llama al m�todo MostrarLista() para generar la representaci�n HTML de la lista de libros
                String listaLibrosHTML = listaEnlazada.MostrarListaPrestados(codigoUsuario);
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

<!-- Modal para devolver un libro -->
<div class="modal fade" id="devolverLibro" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="devolverLibroLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="popup">
                <div class="form">
                    <h2>�Seguro que quieres devolver este libro?</h2>
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
                        <div class="form-element">
                            <label for="email">Titulo</label>
                            <input type="text" id="nuevoTitulo" name="nuevoTitulo" placeholder="Ingrese el nuevo titulo" maxlength="20" required>
                        </div>
                        <div class="form-element">
                            <label for="email">Autor</label>
                            <input type="text" id="nuevoAutor" name="nuevoAutor" placeholder="Ingrese el nuevo autor" maxlength="20" required>
                        </div>
                        <div class="form-element">
                            <label for="email">Fecha de publicaci�n</label>
                            <br><input type="date" id="nuevaFecha" name="nuevaFecha" required>
                        </div>
                        <div class="form-element">
                            <label for="email">Imagen</label>
                            <br><input type="file" id="imagen" name="imagen" maxlength="20" required>
                        </div>
                        <div class="form-element">
                            <button type="submit">Editar</button>
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

        // Realiza una solicitud AJAX al servlet para realizar la ordenaci�n alfab�tica
        $.ajax({
            url: 'SvDevolverLibro?codigo=' + codigo,
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
    
    
    var codigoE = "";
    function mostrarModalEditar(codigo) {
        var ventana = "prestamos";
        codigoE = codigo;
        $('#editar').modal('show');

        $.ajax({
            url: 'SvEditar?codigo=' + codigo + '&ventana=' + ventana,
            method: 'GET', // Utiliza POST u otro m�todo HTTP seg�n corresponda
            success: function (data) {

            },
            error: function () {
                // En caso de error en la solicitud:
                // Registra un mensaje de error en la consola (para fines de depuraci�n)
                console.log('Error al realizar la ordenaci�n alfab�tica.');
            }
        });
    }

</script>

<!-- Incluci�n de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
