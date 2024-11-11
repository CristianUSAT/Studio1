<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmAutor.aspx.vb" Inherits="PryBiblioteca.frmAutor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mantenimiento Autor</title>
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
            flex-direction: column;
            width: 90%;
            max-width: 1200px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            padding: 20px;
        }

        .header {
            background-color: #00bcd4;
            color: #ffffff;
            text-align: center;
            padding: 15px;
            font-size: 1.5em;
            font-weight: bold;
        }

        .content {
            display: flex;
            flex-direction: row;
            padding: 20px;
        }

        .form-section {
            flex: 1;
            display: flex;
            flex-direction: column;
            padding-right: 20px;
            border-right: 1px solid #ddd;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }

        .form-group label {
            width: 100px;
            color: #333;
            font-weight: bold;
            flex-shrink: 0;
            margin-right: 10px; /* Espacio entre label y el campo */
            text-align: right;
        }

        .form-group input[type="text"], .form-group div {
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

        .form-group .checkbox {
            display: flex;
            align-items: center;
        }

        .checkbox-label {
            margin-left: 5px;
            color: #333;
            font-weight: normal;
            font-size: 0.9em;
        }

        .sidebar {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background-color: #00bcd4;
            margin-top: 10px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .sidebar .btn {
            padding: 12px;
            font-size: 16px;
            background-color: #ffffff;
            color: #00bcd4;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            font-weight: bold;
            width: 120px;
            justify-content: center;
        }

        .sidebar .btn i {
            margin-right: 5px;
        }

        .sidebar .btn:hover {
            background-color: #00a1b2;
            color: #ffffff;
        }

        .message {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: center;
        }

        .data-table-container {
            flex: 2;
            margin-left: 20px;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">MANTENIMIENTO AUTOR</div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />

            <div class="content">
                <div class="form-section">
                    <div class="form-group">
                        <label for="txtCodigo">Códio:</label>
                        <asp:TextBox ID="txtCodigo" runat="server" MaxLength="50" Style="width: calc(100% - 30px);" />
                        <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" Style="display:none;" />
                        <i class="fas fa-search" style="cursor: pointer; margin-left: 10px; position: relative; top: 2px;" onclick="document.getElementById('<%= btnBuscar.ClientID %>').click()"></i>
                    </div>

                    <div class="form-group">
                        <label for="txtNombre">Nombre:</label>
                        <asp:TextBox ID="txtNombre" runat="server" MaxLength="50" />
                    </div>

                    <div class="form-group">
                        <label for="txtApellidos">Apellidos:</label>
                        <asp:TextBox ID="txtApellidos" runat="server" MaxLength="50" />
                    </div>

                    <div class="form-group checkbox">
                        <label>Vigencia:</label>
                        <asp:CheckBox ID="chkVigencia" runat="server" />
                        <asp:Label runat="server" Text="Vigente" CssClass="checkbox-label"></asp:Label>
                    </div>

                    <div class="sidebar">
                        <asp:LinkButton ID="btnNuevo" runat="server" CssClass="btn" OnClick="btnNuevo_Click">
                            <i class="fas fa-user-plus"></i> <asp:Literal ID="litNuevo" runat="server" Text="NUEVO"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnModificar" runat="server" CssClass="btn" OnClick="btnModificar_Click">
                            <i class="fas fa-edit"></i> MODIFICAR
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnDarBaja" runat="server" CssClass="btn" OnClick="btnDarBaja_Click">
                            <i class="fas fa-user-times"></i> DAR DE BAJA
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnLimpiar" runat="server" CssClass="btn" OnClick="btnLimpiar_Click">
                            <i class="fas fa-eraser"></i> LIMPIAR
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnSalir" runat="server" CssClass="btn" OnClick="btnSalir_Click">
                            <i class="fas fa-sign-out-alt"></i> SALIR
                        </asp:LinkButton>
                    </div>
                </div>

                <div class="data-table-container">
                    <asp:GridView ID="gvAutores" runat="server" CssClass="data-table" AutoGenerateColumns="False" OnSelectedIndexChanged="gvAutores_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="codautor" HeaderText="Código" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
                            <asp:CheckBoxField DataField="vigencia" HeaderText="Vigente" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
