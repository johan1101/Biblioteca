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
                    <a href="agregarLibro.jsp" class="nav-item nav-link active">Agregar libro</a> 
                    <a href="biblioteca.jsp" class="nav-item nav-link">Listado de libros</a> 
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
                <p class="m-0 text-uppercase"><a class="text-white" href="">Agregar libro</a></p>
                <i class="fa fa-angle-double-right pt-1 px-3"></i>
                <p class="m-0 text-uppercase">Libros</p>
            </div>
        </div>
    </div>
</div>

<form action ="SvAgregarLibro" method = "POST">
    <div class="container-fluid booking mt-5 pb-5">
        <div class="container pb-5">
            <div class="bg-light shadow" style="padding: 30px;">
                <div class="row align-items-center" style="min-height: 60px;">
                    <div class="col-md-10">
                        <div class="row">
                            <!-- Cajas de texto donde se añadira toda la información del video agregado -->
                            <div class="col-md-3">
                                <div>
                                    <input type="text" class="form-control p-4" name="titulo" id="titulo" placeholder="Titulo del libro"
                                           required="required" data-validation-required-message="Porfavor escriba el titulo del libro" required/>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div>
                                    <input type="text" class="form-control p-4" name="autor" id="autor" placeholder="Autor"
                                           required="required" data-validation-required-message="Porfavor escriba el autor del libro" />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div>
                                    <input type="date" class="form-control p-4" name="anioPublicacion" id="anioPublicacion" placeholder="Año de publicación"
                                           required="required" data-validation-required-message="Porfavor escriba el año de publicación" />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mb-3 mb-md-0">
                                    <div>
                                        <input type="file" class="form-control p-4" name="fotoPortada" id="fotoPortada" placeholder="Imagen de Portada"
                                               required="required" data-validation-required-message="Porfavor ingrese la imagen del libro" accept=".jpg, .jpeg, .png"/>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <!-- Botón que culmina la tarea de agregar el video -->
                        <button class="btn btn-primary btn-block" type="submit" style="height: 47px; margin-top: -2px;">Agregar</button>
                        <a href='index.jsp' class="btn btn-primary btn-block" type="submit" style="height: 47px; margin-top: 20px;">Regresar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>