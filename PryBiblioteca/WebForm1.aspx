<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="PryBiblioteca.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio de Sesión</title>
    <style type="text/css">
        body {
            font-family: "Trebuchet MS", Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('biblioteca.jpg'); /* Ruta de la imagen de fondo */
            background-size: cover;
            background-position: center;
        }
        
        .container {
            display: flex;
            width: 800px;
            background-color: rgba(244, 244, 249, 0.9); /* Color de fondo semitransparente para que el fondo se vea detrás */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .image-section {
            width: 50%;
            background-color: #00bcd4;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .image-section img {
            max-width: 100%;
            height: auto;
        }

        .form-section {
            width: 50%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-section h2 {
            color: #333;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .form-section label {
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
        }

        .form-section input[type="text"],
        .form-section input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-section .forgot-password {
            color: #007bff;
            font-size: 12px;
            text-decoration: none;
            margin-bottom: 20px;
        }

        .form-section .forgot-password:hover {
            text-decoration: underline;
        }

        /* Estilo para el botón LOGIN */
        .form-section button, .form-section input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(45deg, #00bcd4, #0097a7); /* Gradiente de color */
            border: none;
            color: #ffffff;
            font-size: 16px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Sombra */
            transition: all 0.3s ease;
        }

        .form-section button:hover, .form-section input[type="submit"]:hover {
            background: linear-gradient(45deg, #0097a7, #00796b); /* Cambio de color al pasar el mouse */
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3); /* Mayor sombra al hacer hover */
            transform: translateY(-2px); /* Efecto de "levantarse" al hacer hover */
        }
    </style>
</head>
<body>
 <form id="form1" runat="server">
        <div class="container">
            <!-- Sección de la imagen -->
            <div class="image-section">
                <img src="login.png" alt="Imagen de inicio de sesión" />
            </div>
            <!-- Sección del formulario -->
            <div class="form-section">
                <h2>LOGIN</h2>

                <!-- Mensaje de Error o Confirmación -->
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="lbl-message" />

                <label for="txtUsuario">DNI Usuario</label>
                <asp:TextBox runat="server" ID="txtUsuario" />

                <label for="txtContraseña">Contraseña</label>
                <asp:TextBox runat="server" ID="txtContraseña" TextMode="Password" />

                <a href="#" class="forgot-password">¿Olvidaste tu contraseña?</a>

                <!-- Botón LOGIN con el nuevo estilo -->
                <asp:Button runat="server" Text="LOGIN" ID="btnAceptar" OnClick="btnAceptar_Click" CssClass="btn-login" />
            </div>
        </div>
    </form>
</body>
</html>
