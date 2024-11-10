<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmLibro.aspx.vb" Inherits="PryBiblioteca.frmLibro" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mantenimiento de Libro</title>
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
            width: 900px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            padding: 20px;
        }

        /* Layout for form and sidebar */
        .main-section {
            display: flex;
            justify-content: space-between;
        }

        /* Sidebar styles */
        .sidebar {
            width: 25%;
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
            padding-right: 20px;
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

        .form-group input[type="text"], .form-group select {
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
        .table-section {
            clear: both;
            padding-top: 20px;
        }

        .table-container {
            max-height: 200px; /* Limitar la altura de la tabla */
            overflow-y: auto; /* Añadir scroll vertical */
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-top: 10px;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th, .data-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .data-table th {
            background-color: #00bcd4;
            color: #ffffff;
            position: sticky;
            top: 0; /* Fijar la cabecera al hacer scroll */
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Main Section with Form and Sidebar -->
            <div class="main-section">
                <!-- Formulario -->
                <div class="form-section">
                    <h2>Mantenimiento de Libro</h2>

                    <div class="form-group">
                        <label for="txtISBN">ISBN:</label>
                        <asp:TextBox ID="txtISBN" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="txtTitulo">Título:</label>
                        <asp:TextBox ID="txtTitulo" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="txtAnioPub">Año Pub.:</label>
                        <asp:TextBox ID="txtAnioPub" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="chkEstado">Estado:</label>
                        <asp:CheckBox ID="chkEstado" runat="server" Text="Vigente" />
                    </div>

                    <div class="form-group">
                        <label for="cbxEditorial">Editorial:</label>
                        <asp:DropDownList ID="cbxEditorial" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="cbxAutor">Autor:</label>
                        <asp:DropDownList ID="cbxAutor" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="cbxGenero">Género:</label>
                        <asp:DropDownList ID="cbxGenero" runat="server" />
                    </div>

                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>

                <!-- Sidebar -->
                <div class="sidebar">
                    <i class="fas fa-book"></i>
                    <asp:Button ID="btnGuardar" runat="server" Text="GUARDAR" OnClick="btnGuardar_Click" CssClass="button" />
                    <asp:Button ID="btnModificar" runat="server" Text="MODIFICAR" OnClick="btnModificar_Click" CssClass="button" />
                    <asp:Button ID="btnDarBaja" runat="server" Text="DAR BAJA" OnClick="btnDarBaja_Click" CssClass="button" />
                    <asp:Button ID="btnLimpiar" runat="server" Text="LIMPIAR" OnClick="btnLimpiar_Click" CssClass="button" />
                </div>
            </div>

            <!-- Tabla de datos -->
            <div class="table-section">
                <h2>Lista de Libros</h2>
                <asp:GridView ID="dgvLibros" runat="server" AutoGenerateColumns="False" CssClass="data-table">
                    <Columns>
                        <asp:BoundField DataField="isbn" HeaderText="ISBN" />
                        <asp:BoundField DataField="titulo" HeaderText="Título" />
                        <asp:BoundField DataField="ano_publicacion" HeaderText="Año" />
                        <asp:BoundField DataField="nombreEditorial" HeaderText="Editorial" />
                        <asp:BoundField DataField="nombreAutor" HeaderText="Autor" />
                        <asp:BoundField DataField="nomgenero" HeaderText="Género" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
