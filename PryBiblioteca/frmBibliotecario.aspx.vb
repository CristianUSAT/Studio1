Imports prjCapaNegocio

Public Class frmBibliotecario
    Inherits System.Web.UI.Page

    Dim objBib As New clsBibliotecario

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarPreguntas()
            CargarBibliotecarios()
        End If
    End Sub

    Private Sub CargarPreguntas()
        Try
            cbxPregunta.DataSource = objBib.ListaPreguntasGuardadas()
            cbxPregunta.DataTextField = "pregunta"
            cbxPregunta.DataBind()
        Catch ex As Exception
            lblMessage.Text = "Error al cargar preguntas: " & ex.Message
        End Try
    End Sub

    Private Sub CargarBibliotecarios()
        Try
            dgvBibliotecario.DataSource = objBib.listarBibliotecario()
            dgvBibliotecario.DataBind()
        Catch ex As Exception
            lblMessage.Text = "Error al cargar bibliotecarios: " & ex.Message
        End Try
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            Dim idPre = objBib.obtenerIdPregunta(cbxPregunta.SelectedItem.Text)
            objBib.registrarBibliotecario(txtDNI.Text, txtNombres.Text, txtApellidoPat.Text, txtApellidoMat.Text, txtPassword.Text, idPre, txtRespuesta.Text)
            lblMessage.Text = "Bibliotecario registrado correctamente."
            CargarBibliotecarios()
        Catch ex As Exception
            lblMessage.Text = "Error al guardar bibliotecario: " & ex.Message
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            Dim idPre = objBib.obtenerIdPregunta(cbxPregunta.SelectedItem.Text)
            objBib.modificarBibliotecario(txtDNI.Text, txtNombres.Text, txtApellidoPat.Text, txtApellidoMat.Text, txtPassword.Text, idPre, txtRespuesta.Text)
            lblMessage.Text = "Bibliotecario modificado correctamente."
            CargarBibliotecarios()
        Catch ex As Exception
            lblMessage.Text = "Error al modificar bibliotecario: " & ex.Message
        End Try
    End Sub
End Class
