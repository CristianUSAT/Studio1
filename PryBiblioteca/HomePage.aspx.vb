Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Verificar si el usuario ha iniciado sesión
            If Session("NombreUsuario") IsNot Nothing Then
                lblUsuario.Text = Session("NombreUsuario").ToString()
            Else
                ' Redirigir a la página de inicio de sesión si no hay sesión
                Response.Redirect("Login.aspx")
            End If
        End If
    End Sub

End Class
