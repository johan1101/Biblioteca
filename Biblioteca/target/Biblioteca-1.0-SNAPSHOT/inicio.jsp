
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
                    <a href="inicio.jsp" class="nav-item nav-link ac3tive">Inicio</a> 
                    <a href="agregarLibro.jsp" class="nav-item nav-link">Agregar libro</a> 
                    <a href="biblioteca.jsp" class="nav-item nav-link">Listado de libros</a>
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

<!-- Carousel Start -->
<div class="container-fluid p-0">
    <div id="header-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="w-100" src="img/carousel-1.jpg" alt="Image">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3" style="max-width: 900px;">
                        <h4 class="text-white text-uppercase mb-md-3">Biblioteca online</h4>
                        <h1 class="display-3 text-white mb-md-4">Libros, el transporte a otras dimensiones</h1>
                        <a href="biblioteca.jsp" class="btn btn-primary py-md-3 px-md-5 mt-2">Leer ahora</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img class="w-100" src="img/carousel-2.jpg" alt="Image">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3" style="max-width: 900px;">
                        <h4 class="text-white text-uppercase mb-md-3">Biblioteca online</h4>
                        <h1 class="display-3 text-white mb-md-4">Libros, el transporte a otras dimensiones</h1>
                        <a href="biblioteca.jsp" class="btn btn-primary py-md-3 px-md-5 mt-2">Leer ahora</a>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                <span class="carousel-control-prev-icon mb-n2"></span>
            </div>
        </a>
        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                <span class="carousel-control-next-icon mb-n2"></span>
            </div>
        </a>
    </div>
</div>
<!-- Carousel End -->

<!-- About Start -->
<div class="container-fluid py-5">
    <div class="container pt-5">
        <div class="row">
            <div class="col-lg-6" style="min-height: 500px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100" src="img/about-1.jpg" style="object-fit: cover;">
                </div>
            </div>
            <div class="col-lg-6 pt-5 pb-lg-5">
                <div class="about-text bg-white p-4 p-lg-5 my-lg-5">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Biblioteca online</h6>
                    <h1 class="mb-3">Disfruta de todos lo libros que encontraras en nuestra biblioteca online</h1>
                    <p>Tenemos libros de todos los géneros para que puedas leerlos una y otra vez, disfruta de las historias que tienen preparadas los autores más conocidos de la literatura mundial. No tengas miedo y atrevete a volar a otro mundo.</p>
                    <a href="biblioteca.jsp" class="btn btn-primary mt-1">Leer ahora</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->

<!-- Testimonial Start -->
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="text-center mb-3 pb-3">
            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Servicios</h6>
            <h1>Servicios de biblioteca online</h1>
        </div>
        <div class="owl-carousel testimonial-carousel">
            <div class="text-center pb-4">
                <img class="img-fluid mx-auto" src="img/blog-1.jpg" style="width: 150px; height: 150px;" >
                <div class="testimonial-text bg-white p-4 mt-n5">
                    <p class="mt-5">Agrega todos los libros que desees para que puedas leerlos desde nuestra biblioteca online a cualquier hora.
                    </p>
                    <h5 class="text-truncate">Agregar libro</h5>
                    <span>Libros</span>
                </div>
            </div>
            <div class="text-center">
                <img class="img-fluid mx-auto" src="img/blog-2.jpg" style="width: 150px; height: 150px;" >
                <div class="testimonial-text bg-white p-4 mt-n5">
                    <p class="mt-5">Encuentra todos los libros disponibles y descrube todas las funciones que tenemos preparadas para ti.
                    </p>
                    <h5 class="text-truncate">Listado de libros</h5>
                    <span>Libros</span>
                </div>
            </div>
            <div class="text-center">
                <img class="img-fluid mx-auto" src="img/blog-3.png" style="width: 150px; height: 150px;" >
                <div class="testimonial-text bg-white p-4 mt-n5">
                    <p class="mt-5">Busca tus libros preferidos digitando en el buscador el título del libro que deseas buscar o el autor del mismo.
                    </p>
                    <h5 class="text-truncate">Buscar libros</h5>
                    <span>Libros</span>
                </div>
            </div>
            <div class="text-center">
                <img class="img-fluid mx-auto" src="img/blog-4.jpg" style="width: 150px; height: 150px;" >
                <div class="testimonial-text bg-white p-4 mt-n5">
                    <p class="mt-5">Clasifica los libros disponibles por categoria, para que puedas encontrar tu libro favorito mucho más facil.
                    </p>
                    <h5 class="text-truncate">Clasificar</h5>
                    <span>Libros</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Testimonial End -->

<!-- Blog Start -->
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <div class="text-center mb-3 pb-3">
            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Biblioteca</h6>
            <h1>Reglas para leer un libro</h1>
        </div>
        <div class="row pb-3">
            <div class="col-lg-4 col-md-6 mb-4 pb-2">
                <div class="blog-item">
                    <div class="position-relative">
                        <div class="blog-date">
                            <h6 class="font-weight-bold mb-n1">01</h6>
                            <small class="text-white text-uppercase">Regla</small>
                        </div>
                    </div><br>
                    <br><div class="bg-white p-4">
                        <div class="d-flex mb-2">
                            <a class="text-primary text-uppercase text-decoration-none" href="">Biblioteca</a>
                            <span class="text-primary px-2">|</span>
                            <a class="text-primary text-uppercase text-decoration-none" href="">Libros</a>
                        </div>
                        <a class="h5 m-0 text-decoration-none" href="">Siempre el libro antes que la pelicula.</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4 pb-2">
                <div class="blog-item">
                    <div class="position-relative">
                        <div class="blog-date">
                            <h6 class="font-weight-bold mb-n1">02</h6>
                            <small class="text-white text-uppercase">Regla</small>
                        </div>
                    </div><br>
                    <br><div class="bg-white p-4">
                        <div class="d-flex mb-2">
                            <a class="text-primary text-uppercase text-decoration-none" href="">Biblioteca</a>
                            <span class="text-primary px-2">|</span>
                            <a class="text-primary text-uppercase text-decoration-none" href="">Libros</a>
                        </div>
                        <a class="h5 m-0 text-decoration-none" href="">Nunca te saltes el primer capitulo con tal de "pasar a la acción".</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4 pb-2">
                <div class="blog-item">
                    <div class="position-relative">
                        <div class="blog-date">
                            <h6 class="font-weight-bold mb-n1">03</h6>
                            <small class="text-white text-uppercase">Regla</small>
                        </div>
                    </div><br>
                    <br><div class="bg-white p-4">
                        <div class="d-flex mb-2">
                            <a class="text-primary text-uppercase text-decoration-none" href="">Biblioteca</a>
                            <span class="text-primary px-2">|</span>
                            <a class="text-primary text-uppercase text-decoration-none" href="">Libros</a>
                        </div>
                        <a class="h5 m-0 text-decoration-none" href="">Manten siempre la mente abierta.</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Blog End -->

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>