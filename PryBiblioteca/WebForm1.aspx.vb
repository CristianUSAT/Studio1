Imports prjCapaNegocio

Public Class WebForm1
    Inherits System.Web.UI.Page

    Dim objUsuario As New clsUsuario
    Dim objBib As New clsBibliotecario

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs)
        Try
            ' Llama al método login de clsUsuario para verificar credenciales
            Dim dni As String = objUsuario.login(txtUsuario.Text.Trim(), txtContraseña.Text.Trim())

            If dni <> "" Then
                ' Si el login es exitoso, obtenemos el nombre del bibliotecario
                Dim nombreBibliotecario As String = objBib.ObtenerNombresBibliotecario(dni)

                ' Guardamos el nombre y el DNI en la sesión
                Session("NombreUsuario") = nombreBibliotecario
                Session("DniUsuario") = dni

                ' Redirigimos al usuario a la página principal (HomePage.aspx) después de iniciar sesión
                Response.Redirect("HomePage.aspx")
            Else
                lblMessage.Text = "Usuario o contraseña incorrectos."
            End If

        Catch ex As Exception
            lblMessage.Text = "Error de conexión: " & ex.Message
        End Try
    End Sub
End Class
