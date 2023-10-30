<%@page import="Clases.Serializacion"%>
<%@page import="Clases.Lista"%>

<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<style>
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
                    <!-- Enlaces del menú superior que dirigen a las paginas inico y otras -->
                    <a href="index.jsp" class="nav-item nav-link">Inicio</a> 
                    <a href="agregarLibro.jsp" class="nav-item nav-link">Agregar libro</a> 
                    <a href="biblioteca.jsp" class="nav-item nav-link active">Listado de libros</a> 
                    <a href="Generos.jsp" class="nav-item nav-link">Buscar</a>
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
                // Llama al método MostrarLista() para generar la representación HTML de la lista de libros
                String listaLibrosHTML = listaEnlazada.MostrarLista();
                out.println(listaLibrosHTML);
            %>
        </div>
    </div>
</div>
<center>
    <!-- Botón que redirige a la página inicial (index) -->
    <a href='index.jsp' class='btn btn-primary py-md-3 px-md-5 mt-2'style='margin-right: 30px;'>Regresar</a>

    <!-- Botón que envia a la página de agregarLibro para agregar un nuevo libro -->
    <a href='agregarLibro.jsp' class='btn btn-primary py-md-3 px-md-5 mt-2'>Agregar libro</a><br>
</center><br><br>

<script>
    function eliminar(opcion) {

        var eliminar = opcion;

        // Realiza una solicitud AJAX al servlet para realizar la ordenación alfabética
        $.ajax({
            url: 'SvEliminar?opcion=' + eliminar,
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
</script>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>