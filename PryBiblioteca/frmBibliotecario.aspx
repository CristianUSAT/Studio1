<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmBibliotecario.aspx.vb" Inherits="PryBiblioteca.frmBibliotecario" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Nuevo Bibliotecario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .back-button {
            position: fixed;
            top: 20px;
            left: 20px;
            font-size: 20px;
            color: #00bcd4;
            text-decoration: none;
        }

            .back-button:hover {
                color: #007fa3;
            }

        .container {
            display: flex;
            flex-direction: row;
            width: 100%;
            max-width: 1200px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            margin-top: 20px;
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

            .sidebar .button {
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
                text-decoration: none;
            }

                .sidebar .button:hover {
                    background-color: #00a1b2;
                    color: #ffffff;
                }

                .sidebar .button i {
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
                color: #00bcd4;
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

        /* Estilos para el mensaje */
        .message {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: center;
        }

        /* Estilos para ocultar el botón y expandir el área clicable */
        .hidden-button a {
            display: block;
            width: 100%;
            height: 100%;
            text-decoration: none;
            color: inherit;
        }

        /* Ajustes responsivos */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar, .form-section {
                width: 100%;
            }

            .sidebar {
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: center;
            }

                .sidebar .button {
                    margin: 5px;
                    flex: 1 1 40%;
                }
        }
    </style>
</head>
<body>
    <!-- Botón de regresar fuera del formulario -->
    <a href="HomePage.aspx" class="back-button">
        <i class="fas fa-arrow-left"></i>Regresar
    </a>

    <form id="form1" runat="server">
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <asp:LinkButton ID="btnGuardar" runat="server" CssClass="button" OnClick="btnGuardar_Click">
                    <i class="fas fa-save"></i> GUARDAR
                </asp:LinkButton>
                <asp:LinkButton ID="btnModificar" runat="server" CssClass="button" OnClick="btnModificar_Click">
                    <i class="fas fa-edit"></i> MODIFICAR
                </asp:LinkButton>
                <asp:LinkButton ID="btnLimpiar" runat="server" CssClass="button" OnClick="btnLimpiar_Click">
                    <i class="fas fa-eraser"></i> LIMPIAR
                </asp:LinkButton>
                <asp:LinkButton ID="btnSalir" runat="server" CssClass="button" OnClick="btnSalir_Click">
                    <i class="fas fa-sign-out-alt"></i> SALIR
                </asp:LinkButton>
            </div>

            <!-- Formulario -->
            <div class="form-section">
                <h2>REGISTRAR NUEVO BIBLIOTECARIO</h2>

                <!-- Mensaje para el usuario -->
                <asp:Label ID="lblMessage" runat="server" CssClass="message" />

                <div class="form-group">
                    <label for="txtDNI">DNI:</label>
                    <asp:TextBox ID="txtDNI" runat="server" MaxLength="8" onkeypress="return isNumber(event)"></asp:TextBox>
                    <i class="fas fa-search" onclick="document.getElementById('<%= btnBuscar.ClientID %>').click()"></i>
                    <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" Style="display: none;" />
                </div>

                <div class="form-group">
                    <label for="txtNombres">Nombres:</label>
                    <asp:TextBox ID="txtNombres" runat="server" onkeypress="return isLetter(event)" />
                </div>

                <div class="form-group">
                    <label for="txtApellidoPat">Ap. Paterno:</label>
                    <asp:TextBox ID="txtApellidoPat" runat="server" onkeypress="return isLetter(event)" />
                </div>

                <div class="form-group">
                    <label for="txtApellidoMat">Ap. Materno:</label>
                    <asp:TextBox ID="txtApellidoMat" runat="server" onkeypress="return isLetter(event)" />
                </div>


                <div class="form-group">
                    <label for="cbxPregunta">Pregunta Secreta:</label>
                    <asp:DropDownList ID="cbxPregunta" runat="server" EnableViewState="True" />

                </div>

                <div class="form-group">
                    <label for="txtRespuesta">Respuesta:</label>
                    <asp:TextBox ID="txtRespuesta" runat="server" />
                </div>

                <div class="form-group">
                    <label for="txtPassword">Contraseña:</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                </div>

                <asp:GridView ID="dgvBibliotecario" runat="server" CssClass="data-table" AutoGenerateColumns="False"
                    DataKeyNames="id_pregunta,dni_bib" OnRowCommand="dgvBibliotecario_RowCommand"
                    OnRowDataBound="dgvBibliotecario_RowDataBound">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkSelect" runat="server" CommandName="Select" Text="" Style="display: none;"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="0px" CssClass="hidden-button" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="dni_bib" HeaderText="DNI" />
                        <asp:BoundField DataField="nombre_bib" HeaderText="Nombre" />
                        <asp:BoundField DataField="apellidopaterno_bib" HeaderText="Apellido Paterno" />
                        <asp:BoundField DataField="apellidomaterno_bib" HeaderText="Apellido Materno" />
                        <asp:BoundField DataField="pregunta" HeaderText="Pregunta" />
                        <asp:BoundField DataField="respuesta_pregunta" HeaderText="Respuesta" />
                        <asp:BoundField DataField="contraseña_bib" HeaderText="Contraseña" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
<script>
    function isNumber(event) {
        var charCode = (event.which) ? event.which : event.keyCode;
        // Permitir solo números (0-9)
        if (charCode < 48 || charCode > 57) {
            event.preventDefault();
            return false;
        }
        return true;
    }
    function isLetter(event) {
        var charCode = (event.which) ? event.which : event.keyCode;
        // Permitir solo letras (mayúsculas y minúsculas) y espacio
        if ((charCode >= 65 && charCode <= 90) || // Letras mayúsculas
            (charCode >= 97 && charCode <= 122) || // Letras minúsculas
            charCode === 32) { // Espacio
            return true;
        }
        event.preventDefault();
        return false;
    }
</script>
</html>
