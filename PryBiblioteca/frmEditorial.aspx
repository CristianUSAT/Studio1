<%@ Page Language="vb" AutoEventWireup="false" CodeFile="frmEditorial.aspx.vb" Inherits="frmEditorial" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mantenimiento Editorial del Libro</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;
        }

        body, html {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f4f4f9;
        }

        .container {
            display: flex;
            width: 90%;
            max-width: 1200px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }

        .sidebar {
            width: 200px;
            background-color: #00bcd4;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .sidebar i {
            font-size: 50px;
            margin-bottom: 15px;
        }

        .sidebar .btn {
            width: 100%;
            margin: 8px 0;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            background-color: #ffffff;
            color: #00bcd4;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
        }

        .sidebar .btn:hover {
            background-color: #00a1b2;
            color: #ffffff;
        }

        .content {
            display: flex;
            width: 100%;
            padding: 20px;
        }

        .form-section {
            width: 50%;
            padding-right: 20px;
        }

        .form-section h2 {
            text-align: center;
            color: #00796b;
            margin-bottom: 20px;
            font-size: 1.8em;
            font-weight: bold;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-group label {
            width: 100px;
            color: #333;
            font-weight: bold;
        }

        .form-group input[type="text"] {
            flex: 1;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group i {
            font-size: 18px;
            margin-left: 10px;
            cursor: pointer;
            color: #00796b;
        }

        .form-group .checkbox-label {
            margin-left: 5px;
            color: #333;
            font-size: 0.9em;
        }

        .display-section {
            width: 50%;
            max-height: 400px; /* Limita la altura para permitir el scroll */
            overflow-y: auto;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        .data-table th, .data-table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .data-table th {
            background-color: #00bcd4;
            color: #ffffff;
        }

        .data-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .data-table tr:hover {
            background-color: #f1f1f1;
        }

        /* Responsividad */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                width: 95%;
            }

            .sidebar {
                width: 100%;
                flex-direction: row;
                justify-content: space-around;
            }

            .content {
                flex-direction: column;
            }

            .form-group label {
                width: 100%;
            }

            .form-group {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="container">
            <!-- Sidebar con botones -->
            <div class="sidebar">
                <i class="fas fa-book"></i>
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn" OnClick="btnGuardar_Click" Text="GUARDAR" />
                <asp:Button ID="btnModificar" runat="server" CssClass="btn" OnClick="btnModificar_Click" Text="MODIFICAR" />
                <asp:Button ID="btnDarBaja" runat="server" CssClass="btn" OnClick="btnDarBaja_Click" Text="DAR DE BAJA" />
                <asp:Button ID="btnLimpiar" runat="server" CssClass="btn" OnClick="btnLimpiar_Click" Text="LIMPIAR" />
                <asp:Button ID="btnSalir" runat="server" CssClass="btn" OnClick="btnSalir_Click" Text="SALIR" />
            </div>

            <!-- Sección del contenido principal -->
            <div class="content">
                <!-- Sección del formulario -->
                <div class="form-section">
                    <h2>Mantenimiento Editorial del Libro</h2>
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                    <div class="form-group">
                        <label for="txtCodigo">Código:</label>
                        <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
                        <asp:Button ID="btnBuscar" runat="server" Style="display:none;" OnClick="btnBuscar_Click" />
                        <i class="fas fa-search" onclick="__doPostBack('<%= btnBuscar.ClientID %>', '');"></i>
                    </div>

                    <div class="form-group">
                        <label for="txtNombre">Nombre:</label>
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtDireccion">Dirección:</label>
                        <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="txtTelefono">Teléfono:</label>
                        <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Vigencia:</label>
                        <asp:CheckBox ID="chkVigencia" runat="server"></asp:CheckBox>
                        <label class="checkbox-label" for="chkVigencia">Vigente</label>
                    </div>
                </div>

                <!-- Sección de visualización de la tabla -->
                <div class="display-section">
                    <asp:GridView ID="gvEditoriales" runat="server" CssClass="data-table" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="id_editorial" HeaderText="Código" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                            <asp:BoundField DataField="telefono" HeaderText="Teléfono" />
                            <asp:CheckBoxField DataField="vigencia" HeaderText="Vigente" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
