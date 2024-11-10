Imports prjCapaNegocio ' Asegúrate de importar la capa de negocio

Public Class WebForm1
    Inherits System.Web.UI.Page

    Private objUsuario As New clsUsuario ' Instancia de la clase clsUsuario

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs)
        Try
            ' Llama al método login de clsUsuario para verificar credenciales
            Dim dni As String = objUsuario.login(txtUsuario.Text.Trim(), txtContraseña.Text.Trim())

            If dni <> "" Then
                ' Si el login es exitoso, guardamos el dni y nombre del usuario en la sesión
                Session("NombreUsuario") = dni ' Aquí puedes almacenar el DNI u obtener el nombre completo en otra consulta si es necesario
                Session("DniUsuario") = dni
                Response.Redirect("HomePage.aspx")
            Else
                lblMessage.Text = "Usuario o contraseña incorrectos."
            End If

        Catch ex As Exception
            lblMessage.Text = "Error de conexión: " & ex.Message
        End Try
    End Sub
End Class
