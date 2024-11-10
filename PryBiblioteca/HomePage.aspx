<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HomePage.aspx.vb" Inherits="PryBiblioteca.WebForm2" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú principal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('principal.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .navbar {
            background-color: #00bcd4;
            color: #ffffff;
            display: flex;
            padding: 10px;
            justify-content: center;
            font-size: 18px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
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

        .dashboard {
            display: flex;
            justify-content: space-around;
            margin: 100px 20px 60px 20px;
            flex-wrap: wrap;
        }

        .dashboard .card {
            width: 200px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-bottom: 20px;
        }

        .dashboard .card h3 {
            margin: 10px 0;
            font-size: 24px;
            color: #00bcd4;
        }

        .dashboard .card p {
            font-size: 14px;
            color: #666;
        }

        .footer {
            background-color: #f0f0f0;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            font-size: 18px;
            position: fixed;
            width: 100%;
            bottom: 0;
            border-top: 1px solid #ddd;
            z-index: 1000;
            align-items: center;
        }

        .footer div {
            margin: 0 20px;
        }
    </style>
</head>
<body>
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
                            <a href="frmBibliotecario.aspx">Bibliotecarios</a>
                            <a href="frmLector.aspx">Lectores</a>
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

    <div class="dashboard">
        <div class="card">
            <i class="fas fa-book fa-2x"></i>
            <h3>320</h3>
            <p>Total de libros</p>
        </div>
        <div class="card">
            <i class="fas fa-users fa-2x"></i>
            <h3>120</h3>
            <p>Usuarios registrados</p>
        </div>
        <div class="card">
            <i class="fas fa-exchange-alt fa-2x"></i>
            <h3>58</h3>
            <p>Préstamos activos</p>
        </div>
        <div class="card">
            <i class="fas fa-clock fa-2x"></i>
            <h3>25</h3>
            <p>Reservas pendientes</p>
        </div>
    </div>

    <div class="footer">
        <div>USUARIO: <asp:Label ID="lblUsuario" runat="server" /></div>
        <div style="flex: 1; text-align: right; padding-right: 10px;">FECHA Y HORA: <span id="fechaHora"></span></div>
    </div>

    <script>
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
