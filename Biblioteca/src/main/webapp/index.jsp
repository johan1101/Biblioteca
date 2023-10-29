<!-- Incluci�n de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<style>
    <%@include file= "style/index.css" %>
</style>

<div class = "wrapper">
    <form action="SvRegistrarIngresar" method="POST">
        <h1>Ingresar</h1>
        <div class="input-box">
            <input type="text" name="cedula" placeholder="Cedula" maxlength="10" required pattern="[0-9]+" title="Solo se permiten n�meros">
            <i class='bx bxs-user'></i>
        </div>
        <div class="input-box">
            <input type="password" name="contrasena" placeholder="Contrase�a" maxlength="20" required>
            <i class='bx bxs-lock-alt' ></i>
        </div>
        <button type="submit" class="btn">Iniciar</button>
        <div class="register-link">
            <p>No tiene una cuenta? <a href="#" type="button" id="show-login" data-bs-toggle="modal" data-bs-target="#registrar">Reg�strese aqui</a></p>
        </div>
    </form>
</div>

<form action="SvRegistrarIngresar" method="GET">
    <div class="modal fade" id="registrar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="registrarLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="popup" >
                    <div class="close-btn" class="btn-close" data-bs-dismiss="modal">&times;</div>
                    <div class="form">
                        <h2>Registrar Cuenta</h2>
                        <div class="form-element">
                            <label for="email">Cedula</label>
                            <input type="text" id="cedula" name="cedula" placeholder="Ingrese su cedula" maxlength="10" required pattern="[0-9]+" title="Solo se permiten n�meros">
                        </div>
                        <div class="form-element">
                            <label for="email">Nombre de usuario</label>
                            <input type="text" id="name" name="nombre" placeholder="Ingresa tu nombre" maxlength="20" required>
                        </div>
                        <div class="form-element">
                            <label for="password">Contrase�a</label>
                            <input type="password" id="password" name="contrasena" placeholder="Ingresa tu contrase�a" maxlength="20" required>
                        </div>
                        <div class="form-element">
                            <button type="submit">Registrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script>

    function usuarioNoCorrecto() {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        // Mostrar una notificaci�n Toastr de error
        toastr.error('La cedula o contrase�a no son correctas', 'No ha podido ingresar');

    }

    function usuarioR() {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        toastr.success('Se ha registrado exitosamente!', 'Registrado');

    }

    function usuarioNoR() {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"

        };

        toastr.error('Ya existe un usuario registrado con esa cedula', 'Error');
    }

</script>
<%
    
    String estado = (String) session.getAttribute("estado");

    if (estado == null) {
        estado = "no";
    }

    if (estado.equals("noRegistrado")) {
%>
<script>
    $(document).ready(function () {
        usuarioNoR();
    });
</script>
<%
    }

    if (estado.equals("siRegistrado")) {
%>
<script>
    $(document).ready(function () {
        usuarioR();
    });
</script>
<%
    }

    if (estado.equals("noValidado")) {
%>
<script>
    $(document).ready(function () {
        usuarioNoCorrecto();
    });
</script>
<%
    }

        // Elimina el atributo "estado" del objeto request
        session.removeAttribute("estado");
%>
<!-- Incluci�n de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
