<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HomePage.aspx.vb" Inherits="AppBiblioteca.WebForm2" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Principal</title>
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        /* Contenedor del menú */
        .navbar {
            background-color: #00bcd4;
            color: #ffffff;
            display: flex;
            padding: 10px;
            justify-content: center;
            font-size: 18px;
        }

        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .navbar ul li {
            position: relative;
            padding: 10px 20px;
            cursor: pointer;
        }

        .navbar ul li:hover {
            background-color: #0097a7;
        }

        /* Estilos de los submenús */
        .dropdown {
            display: none;
            position: absolute;
            background-color: #ffffff;
            color: #000000;
            top: 40px;
            left: 0;
            width: 300px;
            border: 1px solid #ddd;
            padding: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .navbar ul li:hover .dropdown {
            display: block;
        }

        .dropdown-column {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
        }

        .dropdown-column div {
            flex: 1 1 50%;
            padding: 10px;
            box-sizing: border-box;
        }

        .dropdown-column div a {
            text-decoration: none;
            color: #333;
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
        }

        .dropdown-column div a:hover {
            color: #00bcd4;
        }

        .dropdown-title {
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* Estilos de pie */
        .footer {
            background-color: #f0f0f0;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            margin-top: 20px;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <!-- Menú de navegación -->
    <div class="navbar">
        <ul>
            <li>Sistema
                <div class="dropdown">
                    <div class="dropdown-column">
                        <div>
                            <div class="dropdown-title">Configuración</div>
                            <a href="#">Usuarios</a>
                            <a href="#">Permisos</a>
                            <a href="#">Roles</a>
                        </div>
                        <div>
                            <div class="dropdown-title">Sesión</div>
                            <a href="#">Cerrar Sesión</a>
                        </div>
                    </div>
                </div>
            </li>
            <li>Mantenimiento
                <div class="dropdown">
                    <div class="dropdown-column">
                        <div>
                            <div class="dropdown-title">Biblioteca</div>
                            <a href="#">Bibliotecarios</a>
                            <a href="#">Lectores</a>
                        </div>
                        <div>
                            <div class="dropdown-title">Inventario</div>
                            <a href="#">Libros</a>
                            <a href="#">Materiales</a>
                        </div>
                    </div>
                </div>
            </li>
            <li>Operaciones
                <div class="dropdown">
                    <div class="dropdown-column">
                        <div>
                            <div class="dropdown-title">Préstamos</div>
                            <a href="#">Nuevo Préstamo</a>
                            <a href="#">Historial de Préstamos</a>
                        </div>
                        <div>
                            <div class="dropdown-title">Reservas</div>
                            <a href="#">Nueva Reserva</a>
                            <a href="#">Historial de Reservas</a>
                        </div>
                    </div>
                </div>
            </li>
            <li>Reportes
                <div class="dropdown">
                    <div class="dropdown-column">
                        <div>
                            <div class="dropdown-title">Estadísticas</div>
                            <a href="#">Préstamos Mensuales</a>
                            <a href="#">Reservas Anuales</a>
                        </div>
                        <div>
                            <div class="dropdown-title">Generar Reporte</div>
                            <a href="#">Reporte de Libros</a>
                            <a href="#">Reporte de Usuarios</a>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>

    <!-- Pie con información del usuario -->
    <div class="footer">
        <div>USUARIO: <span>Nombre del usuario</span></div>
        <div>FECHA Y HORA: <span id="fechaHora"></span></div>
    </div>

    <script>
        // Script para mostrar la fecha y hora actual
        function actualizarFechaHora() {
            const ahora = new Date();
            const opciones = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
            document.getElementById('fechaHora').innerText = ahora.toLocaleDateString('es-ES', opciones);
        }

        setInterval(actualizarFechaHora, 1000);
        actualizarFechaHora();
    </script>
</body>
</html>
