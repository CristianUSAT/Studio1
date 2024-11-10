<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmBibliotecario.aspx.vb" Inherits="PryBiblioteca.frmBibliotecario" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Nuevo Bibliotecario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .container {
            display: flex;
            width: 800px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        /* Sidebar styles */
        .sidebar {
            width: 30%;
            background-color: #00bcd4;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .sidebar i {
            font-size: 40px;
            margin-bottom: 20px;
        }

        .sidebar button {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            font-size: 16px;
            background-color: #ffffff;
            color: #00bcd4;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .sidebar button:hover {
            background-color: #00a1b2;
            color: #ffffff;
        }

        .sidebar button i {
            margin-right: 10px;
        }

        /* Form styles */
        .form-section {
            width: 70%;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        .form-section h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-group label {
            width: 120px;
            color: #333;
        }

        .form-group input[type="text"], 
        .form-group input[type="password"],
        .form-group select {
            flex: 1;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group i {
            font-size: 18px;
            margin-left: 10px;
            cursor: pointer;
        }

        /* Table styles */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .data-table th, .data-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .data-table th {
            background-color: #00bcd4;
            color: #ffffff;
        }
        
        /* Styles for message label */
        .message {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <i class="fas fa-user"></i>
                <button type="button" onclick="guardarBibliotecario()">
                    <i class="fas fa-save"></i> GUARDAR
                </button>
                <button type="button" onclick="modificarBibliotecario()">
                    <i class="fas fa-edit"></i> MODIFICAR
                </button>
                <button type="button" onclick="limpiarFormulario()">
                    <i class="fas fa-eraser"></i> LIMPIAR
                </button>
                <button type="button" onclick="cerrarFormulario()">
                    <i class="fas fa-sign-out-alt"></i> SALIR
                </button>
            </div>

            <!-- Formulario -->
            <div class="form-section">
                <h2>REGISTRAR NUEVO BIBLIOTECARIO</h2>

                <!-- Label for messages -->
                <asp:Label ID="lblMessage" runat="server" CssClass="message" />

                <div class="form-group">
                    <label for="txtDNI">DNI:</label>
                    <asp:TextBox ID="txtDNI" runat="server" />
                    <i class="fas fa-search" onclick="buscarBibliotecario()"></i>
                </div>

                <div class="form-group">
                    <label for="txtNombres">Nombres:</label>
                    <asp:TextBox ID="txtNombres" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtApellidoPat">Ap. Paterno:</label>
                    <asp:TextBox ID="txtApellidoPat" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtApellidoMat">Ap. Materno:</label>
                    <asp:TextBox ID="txtApellidoMat" runat="server" />
                </div>

                <div class="form-group">
                    <label for="cbxPregunta">Pregunta Secreta:</label>
                    <asp:DropDownList ID="cbxPregunta" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtRespuesta">Respuesta:</label>
                    <asp:TextBox ID="txtRespuesta" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtPassword">Contraseña:</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                </div>

                <!-- Data Table -->
                <asp:GridView ID="dgvBibliotecario" runat="server" CssClass="data-table" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="dni_bib" HeaderText="DNI" />
                        <asp:BoundField DataField="nombre_bib" HeaderText="Nombre" />
                        <asp:BoundField DataField="apellidopaterno_bib" HeaderText="Apellido Paterno" />
                        <asp:BoundField DataField="apellidomaterno_bib" HeaderText="Apellido Materno" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <script>
        function guardarBibliotecario() { /* ... */ }
        function modificarBibliotecario() { /* ... */ }
        function limpiarFormulario() { /* ... */ }
        function cerrarFormulario() { window.close(); }
        function buscarBibliotecario() { /* ... */ }
    </script>
</body>
</html>
