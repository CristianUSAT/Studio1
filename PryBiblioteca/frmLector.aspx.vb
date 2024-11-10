Imports prjCapaNegocio ' Asegúrate de que el namespace está correcto

Public Class frmLector
    Inherits System.Web.UI.Page

    Dim objLector As New clsLector

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarLectores()
        End If
    End Sub

    Private Sub CargarLectores()
        Try
            gvLectores.DataSource = objLector.listarLectores() ' Obtener lista de lectores
            gvLectores.DataBind() ' Enlazar los datos al GridView
        Catch ex As Exception
            lblMessage.Text = "Error al cargar lectores: " & ex.Message
        End Try
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        If ValidarCampos() Then
            Try
                Dim sexo As Integer = Convert.ToInt32(ddlSexo.SelectedValue) ' Convertir el valor seleccionado a Integer
                objLector.registrarLector(txtDNI.Text, txtNombres.Text, txtApellidos.Text, txtFechaNacimiento.Text, txtTelefono.Text, txtEmail.Text, txtDireccion.Text, sexo, If(chkVigencia.Checked, 1, 0))
                lblMessage.Text = "Lector guardado con éxito."
                CargarLectores() ' Recargar la tabla para reflejar el nuevo registro
                LimpiarCampos() ' Limpiar los campos después de guardar
            Catch ex As Exception
                lblMessage.Text = "Error al guardar lector: " & ex.Message
            End Try
        End If
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        If ValidarCampos() Then
            Try
                ' Modificar el lector existente con los datos del formulario
                objLector.modificarLector(txtDNI.Text, txtNombres.Text, txtApellidos.Text, txtFechaNacimiento.Text, txtTelefono.Text, txtEmail.Text, txtDireccion.Text, ddlSexo.SelectedValue, If(chkVigencia.Checked, 1, 0))
                lblMessage.Text = "Lector modificado con éxito."
                CargarLectores() ' Recargar la tabla para reflejar los cambios
                LimpiarCampos() ' Limpiar los campos después de modificar
            Catch ex As Exception
                lblMessage.Text = "Error al modificar lector: " & ex.Message
            End Try
        End If
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        LimpiarCampos() ' Llamar al método para limpiar los campos
        lblMessage.Text = "Formulario limpiado."
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs)
        If String.IsNullOrEmpty(txtDNI.Text) Then
            lblMessage.Text = "Por favor, ingrese un DNI para buscar."
            Return
        End If

        Try
            Dim dt As DataTable = objLector.buscarLector(txtDNI.Text)
            If dt IsNot Nothing AndAlso dt.Rows.Count > 0 Then
                Dim row As DataRow = dt.Rows(0)
                txtNombres.Text = row("nombre").ToString()
                txtApellidos.Text = row("apellido").ToString()
                txtFechaNacimiento.Text = Convert.ToDateTime(row("fecha_nacimiento")).ToString("yyyy-MM-dd")
                txtTelefono.Text = row("telefono").ToString()
                txtEmail.Text = row("email").ToString()
                txtDireccion.Text = row("direccion").ToString()
                ddlSexo.SelectedValue = row("sexo").ToString()
                chkVigencia.Checked = (row("vigencia").ToString() = "1")
                lblMessage.Text = "Lector encontrado."
            Else
                lblMessage.Text = "No se encontró ningún lector con ese DNI."
                LimpiarCampos()
            End If
        Catch ex As Exception
            lblMessage.Text = "Error al buscar lector: " & ex.Message
        End Try
    End Sub

    Private Sub LimpiarCampos()
        txtDNI.Text = ""
        txtNombres.Text = ""
        txtApellidos.Text = ""
        txtFechaNacimiento.Text = ""
        txtTelefono.Text = ""
        txtEmail.Text = ""
        txtDireccion.Text = ""
        ddlSexo.SelectedIndex = 0
        chkVigencia.Checked = False
    End Sub

    Private Function ValidarCampos() As Boolean
        If String.IsNullOrEmpty(txtDNI.Text) Then
            lblMessage.Text = "El campo DNI es obligatorio."
            Return False
        ElseIf String.IsNullOrEmpty(txtNombres.Text) Then
            lblMessage.Text = "El campo Nombres es obligatorio."
            Return False
        ElseIf String.IsNullOrEmpty(txtApellidos.Text) Then
            lblMessage.Text = "El campo Apellidos es obligatorio."
            Return False
        ElseIf String.IsNullOrEmpty(txtFechaNacimiento.Text) Then
            lblMessage.Text = "El campo Fecha de Nacimiento es obligatorio."
            Return False
        ElseIf ddlSexo.SelectedValue = "0" Then
            lblMessage.Text = "Seleccione un valor para el campo Sexo."
            Return False
        End If
        ' Si todos los campos están completos, limpiar el mensaje y devolver True
        lblMessage.Text = ""
        Return True
    End Function

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs)
        Response.Redirect("HomePage.aspx")
    End Sub

End Class
