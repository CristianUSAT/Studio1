<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmLector.aspx.vb" Inherits="PryBiblioteca.frmLector" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mantenimiento De Lectores</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style type="text/css">
        * {
            box-sizing: border-box;
        }

        body, html {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            flex-direction: row;
            width: 100%;
            height: 100vh;
            max-width: 1400px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .sidebar {
            width: 250px;
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

        .sidebar .btn {
            width: 100%;
            margin-bottom: 10px;
            padding: 12px;
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
            text-align: left;
        }

        .sidebar .btn i {
            margin-right: 10px;
            font-size: 18px;
        }

        .sidebar .btn:hover {
            background-color: #00a1b2;
            color: #ffffff;
        }

        .form-section {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            overflow-y: auto;
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
            margin-bottom: 15px;
            flex-wrap: wrap;
        }

        .form-group label {
            width: 120px;
            color: #333;
            font-weight: bold;
            flex-shrink: 0;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="date"],
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

        .data-table-container {
            margin-top: 20px;
            overflow-x: auto;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            font-size: 14px;
        }

        .data-table th, .data-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .data-table th {
            background-color: #00bcd4;
            color: #ffffff;
            font-weight: bold;
            text-align: center;
        }

        .data-table tr:hover {
            background-color: #f1f4f9;
        }
       .data-table input[type="checkbox"] {
    transform: scale(1.5); /* Aumenta el tamaño del checkbox */
    accent-color: #000000; /* Cambia el color a negro */
}


        .message {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: center;
        }
        .checkbox-label {
    margin-left: 5px;
    color: #333;
    font-weight: normal;
    font-size: 0.9em;
}


        /* Responsividad */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                height: auto;
            }

            .sidebar {
                width: 100%;
                flex-direction: row;
                justify-content: space-around;
            }

            .form-group label {
                width: 100%;
                margin-bottom: 5px;
            }

            .form-group {
                flex-direction: column;
            }

            .data-table th, .data-table td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Sidebar con botones -->
            <div class="sidebar">
                <i class="fas fa-user"></i>
                <asp:LinkButton ID="btnGuardar" runat="server" CssClass="btn" OnClick="btnGuardar_Click">
                    <i class="fas fa-save"></i> GUARDAR
                </asp:LinkButton>
                <asp:LinkButton ID="btnModificar" runat="server" CssClass="btn" OnClick="btnModificar_Click">
                    <i class="fas fa-edit"></i> MODIFICAR
                </asp:LinkButton>
                <asp:LinkButton ID="btnLimpiar" runat="server" CssClass="btn" OnClick="btnLimpiar_Click">
                    <i class="fas fa-eraser"></i> LIMPIAR
                </asp:LinkButton>
                <asp:LinkButton ID="btnSalir" runat="server" CssClass="btn" OnClick="btnSalir_Click">
                    <i class="fas fa-sign-out-alt"></i> SALIR
                </asp:LinkButton>
            </div>

            <!-- Sección del formulario -->
            <div class="form-section">
                <h2>Registrar Nuevo Lector</h2>

                <!-- Mensaje para el usuario -->
                <asp:Label ID="lblMessage" runat="server" CssClass="message" />

                <div class="form-group">
                    <label for="txtDNI">DNI:</label>
                    <asp:TextBox ID="txtDNI" runat="server" />
                    <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" Style="display:none;" />
                    <i class="fas fa-search" onclick="document.getElementById('<%= btnBuscar.ClientID %>').click()"></i>
                </div>
                <div class="form-group">
                    <label for="txtNombres">Nombres:</label>
                    <asp:TextBox ID="txtNombres" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtApellidos">Apellidos:</label>
                    <asp:TextBox ID="txtApellidos" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtFechaNacimiento">Fecha de Nacimiento:</label>
                    <asp:TextBox ID="txtFechaNacimiento" runat="server" TextMode="Date" />
                </div>

                <div class="form-group">
                    <label for="txtTelefono">Teléfono:</label>
                    <asp:TextBox ID="txtTelefono" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
                </div>

                <div class="form-group">
                    <label for="txtDireccion">Dirección:</label>
                    <asp:TextBox ID="txtDireccion" runat="server" />
                </div>

                <div class="form-group">
                    <label for="ddlSexo">Sexo:</label>
                    <asp:DropDownList ID="ddlSexo" runat="server">
                        <asp:ListItem Text="-- Seleccione --" Value="0" />
                        <asp:ListItem Text="Masculino" Value="1" />
                        <asp:ListItem Text="Femenino" Value="2" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
    <label>Vigencia:</label>
    <asp:CheckBox ID="chkVigencia" runat="server" />
    <asp:Label runat="server" Text="(vigencia)" CssClass="checkbox-label"></asp:Label>
</div>


                <!-- Contenedor de la tabla de datos registrados -->
                <div class="data-table-container">
                    <asp:GridView ID="gvLectores" runat="server" CssClass="data-table" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="DNI" HeaderText="DNI" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="Apellido" HeaderText="Apellido Paterno" />
                            <asp:BoundField DataField="fecha_nacimiento" HeaderText="Fecha Nacimiento" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                            <asp:BoundField DataField="Sexo" HeaderText="Sexo" />
                            <asp:CheckBoxField DataField="Vigencia" HeaderText="Vigente" />
                            <asp:BoundField DataField="fecha_deregistro" HeaderText="Fecha de Registro" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                            <asp:BoundField DataField="fecha_debaja" HeaderText="Fecha de Baja" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
