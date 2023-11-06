<%@page import="Clases.Lista"%>
<%@page import="Clases.Serializacion"%>
<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

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
    // Crear una instancia de la clase Lista
    Lista listaEnlazada = new Lista();

    // Obtener el contexto del servlet
    ServletContext context = getServletContext();

    // Primero, obtén el código de usuario de la sesión
    int codigoUsuario = (int) session.getAttribute("codigoUsuario");

    // Luego, intenta leer la lista de libros desde la serialización
    listaEnlazada = Serializacion.leerArchivoLibros(context);

    // Verificamos si listaEnlazada es null y si el usuario tiene libros
    if (listaEnlazada == null || !listaEnlazada.verificarUsuario(codigoUsuario)) {
        // Si la lista está vacía o el usuario no tiene libros, crea una nueva lista
        listaEnlazada = new Lista();
    }
    
    boolean verificar = listaEnlazada.verificarUsuario(codigoUsuario);

    System.out.println(verificar);
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
                    <a href="agregarLibro.jsp" class="nav-item nav-link active">Agregar libro</a> 
                    <a href="biblioteca.jsp" class="nav-item nav-link">Listado de libros</a>
                                        <a href="librosPrestamo.jsp" class="nav-item nav-link">Prestamos</a>
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
                <p class="m-0 text-uppercase"><a class="text-white" href="">Agregar libro</a></p>
                <i class="fa fa-angle-double-right pt-1 px-3"></i>
                <p class="m-0 text-uppercase">Libros</p>
            </div>
        </div>
    </div>
</div>

<form action="SvAgregarLibro" method="POST" enctype="multipart/form-data">
    <div class="container-fluid booking mt-5 pb-5">
        <div class="container pb-5">
            <div class="bg-light shadow" style="padding: 30px;">
                <div class="row">
                    <!-- Cajas de texto donde se añadira toda la información del video agregado -->
                    <div class="col-md-3">
                        <div>
                            <label>Titulo</label>
                            <input type="text" class="form-control p-4" name="titulo" id="titulo" placeholder="Ingrese el titulo"
                                   required="required" data-validation-required-message="Porfavor escriba el titulo del libro" required/>
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div>
                            <label>Autor</label>
                            <input type="text" class="form-control p-4" name="autor" id="autor" placeholder="Ingrese el autor"
                                   required="required" data-validation-required-message="Porfavor escriba el autor del libro" />
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div>
                            <label>Año de publicacion</label>
                            <input type="date" class="form-control p-4" name="anioPublicacion" id="anioPublicacion" placeholder="Fecha de publicación"
                                   required="required" data-validation-required-message="Porfavor escriba el año de publicación" />
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-3 mb-md-0">
                            <div>
                                <label>Imagen</label>
                                <input type="file" class="form-control p-4" name="fotoPortada" id="fotoPortada" placeholder="Imagen de Portada"
                                       required="required" data-validation-required-message="Porfavor ingrese la imagen del libro" accept=".jpg, .jpeg, .png"/>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Botón que culmina la tarea de agregar el video -->
                <%
                    //Condicional if para saber si existen libros en el archivo
                    if (verificar == true) {
                %>
                <center>
                    <!-- En caso que si existan libros (Muestra boton que pregunta donde agregar) -->
                    <br><button id="agregarLibroBtn" type="button" class="btn btn-primary" style="height: 47px; width: 150px; margin-top: -2px; margin-right: 16px">Agregar</button>
                    <a href="inicio.jsp" id="regresarNoBtn" class="btn btn-primary" type="submit" style="height: 47px; width: 150px; margin-top: -2px;">Regresar</a>
                </center>
                <%
                } else if (verificar == false) {
                %>
                <center>
                    <!-- En caso de que no existan tareas muestra el boton para agregar la tarea directamente -->
                    <button class="btn btn-primary" type="submit" style="height: 47px; width: 150px; margin-top: 20px; margin-right: 16px">Agregar</button>
                    <a href="inicio.jsp" class="btn btn-primary" type="submit" style="height: 47px; width: 150px; margin-top: 20px;">Regresar</a>
                </center>
                <%
                    }
                %>
                <div id="radioButtonsContainer" style="display: none;">

                    <div>
                        <center>
                            <div class="form-check" style="margin-bottom: 10px; display: inline-block;">
                                <input type="radio" name="posicion" id="inicio" value="inicio" class="form-check-input" checked>
                                <label for="inicio" class="form-check-label" style="margin-right: 20px">Al inicio</label>
                            </div>
                            <div class="form-check" style="display: inline-block;">
                                <input type="radio" name="posicion" id="final" value="final" class="form-check-input">
                                <label for="final" class="form-check-label">Al final</label>
                            </div>
                        </center>
                    </div>

                    <center>
                        <button id="agregarLibroFinalBtn" class="btn btn-primary" type="submit" style="height: 47px; width: 150px; margin-top: 20px; margin-right: 16px">Agregar</button>
                        <a href="inicio.jsp" id="regresarBtn" class="btn btn-primary" type="submit" style="height: 47px; width: 150px; margin-top: 20px;">Regresar</a>
                    </center>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    $(document).ready(function () {
        $('#agregarLibroBtn').click(function () {
            $('#agregarLibroBtn').hide();
            $('#regresarNoBtn').hide();
            $('#radioButtonsContainer').show();
            $('#agregarLibroFinalBtn').show();
            $('#regresarBtn').show();
        });
    });
</script>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>