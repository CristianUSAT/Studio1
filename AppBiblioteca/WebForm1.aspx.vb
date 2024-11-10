Imports System.Data.SqlClient
Imports System.Configuration

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs)
        Try
            Dim connectionString As String = ConfigurationManager.ConnectionStrings("ConexionBDBibliotecaGrupo4").ConnectionString
            Dim query As String = "SELECT nombre_bib FROM usuarios_guardados WHERE dni = @DNI AND contraseña = @Contraseña"

            Using conn As New SqlConnection(connectionString)
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@DNI", txtUsuario.Text.Trim())
                    cmd.Parameters.AddWithValue("@Contraseña", txtContraseña.Text.Trim())

                    conn.Open()
                    Dim result As Object = cmd.ExecuteScalar()

                    If result IsNot Nothing Then
                        Dim nombre As String = result.ToString()
                        Session("NombreUsuario") = nombre
                        Session("DniUsuario") = txtUsuario.Text.Trim()
                        Response.Redirect("HomePage.aspx")
                    Else
                        lblMessage.Text = "Usuario o contraseña incorrectos."
                    End If
                End Using
            End Using
        Catch ex As Exception
            lblMessage.Text = "Error de conexión: " & ex.Message
        End Try
    End Sub
End Class
