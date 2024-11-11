Imports prjCapaNegocio ' Asegúrate de que el namespace está correcto
Imports System.Data ' Importa System.Data para que DataTable esté disponible

Public Class frmEditorial
    Inherits System.Web.UI.Page

    Dim objEditorial As New clsEditorial ' Instancia de la clase clsEditorial
    Private isNuevo As Boolean = True ' Variable para controlar el estado del botón

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarEditoriales()
            btnAccion.Text = "NUEVO"
        End If
    End Sub

    Private Sub CargarEditoriales()
        Try
            gvEditoriales.DataSource = objEditorial.listarEditorial() ' Obtener lista de editoriales
            gvEditoriales.DataBind() ' Enlazar los datos al GridView
        Catch ex As Exception
            lblMessage.Text = "Error al cargar editoriales: " & ex.Message
        End Try
    End Sub

    Protected Sub btnAccion_Click(sender As Object, e As EventArgs)
        If isNuevo Then
            ' Lógica para el botón "Nuevo"
            Try
                Dim idEditorial As Integer = objEditorial.generarIdEditorial()
                txtCodigo.Text = idEditorial.ToString()

                txtNombre.Text = ""
                txtDireccion.Text = ""
                txtTelefono.Text = ""
                chkVigencia.Checked = False

                lblMessage.Text = "Nuevo código generado. Complete los campos."
                btnAccion.Text = "GUARDAR" ' Cambiar el texto a "Guardar"
                isNuevo = False ' Cambiar el estado a Guardar
            Catch ex As Exception
                lblMessage.Text = "Error al generar nuevo código: " & ex.Message
            End Try
        Else
            ' Lógica para el botón "Guardar"
            If ValidarCampos() Then
                Try
                    Dim idEditorial As Integer = Convert.ToInt32(txtCodigo.Text)
                    objEditorial.registrarEditorial(idEditorial, txtNombre.Text, txtDireccion.Text, txtTelefono.Text, chkVigencia.Checked)

                    lblMessage.Text = "Editorial guardada con éxito."
                    CargarEditoriales() ' Recargar la tabla
                    LimpiarCampos() ' Limpiar los campos después de guardar
                    btnAccion.Text = "NUEVO" ' Cambiar el texto a "Nuevo"
                    isNuevo = True ' Cambiar el estado a Nuevo
                Catch ex As Exception
                    lblMessage.Text = "Error al guardar editorial: " & ex.Message
                End Try
            End If
        End If
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        If String.IsNullOrEmpty(txtCodigo.Text) Then
            lblMessage.Text = "Por favor, ingrese un código para modificar."
            Return
        End If

        If ValidarCampos() Then
            Try
                objEditorial.modificarEditorial(Convert.ToInt32(txtCodigo.Text), txtNombre.Text, txtDireccion.Text, txtTelefono.Text, chkVigencia.Checked)
                lblMessage.Text = "Editorial modificada con éxito."
                CargarEditoriales() ' Recargar la tabla para reflejar los cambios
                LimpiarCampos() ' Limpiar los campos después de modificar
            Catch ex As Exception
                lblMessage.Text = "Error al modificar editorial: " & ex.Message
            End Try
        End If
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        LimpiarCampos() ' Llamar al método para limpiar los campos
        lblMessage.Text = "Formulario limpiado."
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs)
        If String.IsNullOrEmpty(txtCodigo.Text) Then
            lblMessage.Text = "Por favor, ingrese un código para buscar."
            Return
        End If

        Try
            Dim dt As DataTable = objEditorial.buscarEditorial(Convert.ToInt32(txtCodigo.Text))
            If dt IsNot Nothing AndAlso dt.Rows.Count > 0 Then
                Dim row As DataRow = dt.Rows(0)
                txtNombre.Text = row("nombre").ToString()
                txtDireccion.Text = row("direccion").ToString()
                txtTelefono.Text = row("telefono").ToString()

                ' Manejo de la columna vigencia
                Dim vigenciaValue = row("vigencia").ToString().ToLower()
                chkVigencia.Checked = (vigenciaValue = "1" OrElse vigenciaValue = "true")

                lblMessage.Text = "Editorial encontrada."
            Else
                lblMessage.Text = "No se encontró ninguna editorial con ese código."
                LimpiarCampos()
            End If
        Catch ex As Exception
            lblMessage.Text = "Error al buscar editorial: " & ex.Message
        End Try
    End Sub


    Protected Sub btnDarBaja_Click(sender As Object, e As EventArgs)
        If String.IsNullOrEmpty(txtCodigo.Text) Then
            lblMessage.Text = "Por favor, ingrese un código para dar de baja."
            Return
        End If

        Try
            objEditorial.darBajaEditorial(Convert.ToInt32(txtCodigo.Text))
            lblMessage.Text = "Editorial dada de baja con éxito."
            CargarEditoriales() ' Recargar la tabla para reflejar los cambios
            LimpiarCampos() ' Limpiar los campos después de dar de baja
        Catch ex As Exception
            lblMessage.Text = "Error al dar de baja la editorial: " & ex.Message
        End Try
    End Sub

    Private Sub LimpiarCampos()
        txtCodigo.Text = ""
        txtNombre.Text = ""
        txtDireccion.Text = ""
        txtTelefono.Text = ""
        chkVigencia.Checked = False
        btnAccion.Text = "NUEVO" ' Reiniciar el botón a "Nuevo"
        isNuevo = True ' Reiniciar el estado a Nuevo
    End Sub

    Private Function ValidarCampos() As Boolean
        If String.IsNullOrEmpty(txtNombre.Text) Then
            lblMessage.Text = "El campo Nombre es obligatorio."
            Return False
        ElseIf String.IsNullOrEmpty(txtDireccion.Text) Then
            lblMessage.Text = "El campo Dirección es obligatorio."
            Return False
        ElseIf String.IsNullOrEmpty(txtTelefono.Text) Then
            lblMessage.Text = "El campo Teléfono es obligatorio."
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
