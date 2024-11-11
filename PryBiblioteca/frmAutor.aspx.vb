Imports prjCapaNegocio
Public Class frmAutor
    Inherits System.Web.UI.Page
    Dim objAut As New clsAutor
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cargarAutores()
            chkVigencia.Checked = True
        End If
    End Sub
    Private Sub cargarAutores()
        gvAutores.DataSource = objAut.listarAutor()
        gvAutores.DataBind()
    End Sub
    Protected Sub btnNuevo_Click(ByVal sender As Object, ByVal e As EventArgs)
        Try
            If litNuevo.Text = "NUEVO" Then
                GenerarNuevoID()
                litNuevo.Text = "GUARDAR" '
                lblMessage.Text = "Ingrese los datos y presione Guardar para registrar el nuevo autor."
                lblMessage.ForeColor = System.Drawing.Color.Blue

                habilitarBotones(False)
                txtNombre.Text = ""
                txtApellidos.Text = ""
                chkVigencia.Checked = True
            ElseIf litNuevo.Text = "GUARDAR" Then
                If ValidarCampos() Then
                    Try
                        objAut.registrarAutor(CInt(txtCodigo.Text), txtNombre.Text, txtApellidos.Text, chkVigencia.Checked)

                        lblMessage.Text = "Autor registrado exitosamente."
                        lblMessage.ForeColor = System.Drawing.Color.Green

                        litNuevo.Text = "NUEVO" ' Cambiar el texto del Literal de vuelta a "NUEVO"
                        habilitarBotones(True)

                        ' Limpiar los campos de entrada y actualizar la tabla de autores
                        limpiarControles()
                        cargarAutores()
                    Catch ex As Exception
                        lblMessage.Text = "Error al registrar autor: " & ex.Message
                        lblMessage.ForeColor = System.Drawing.Color.Red
                    End Try
                End If
            End If
        Catch ex As Exception
            lblMessage.Text = ex.Message
            lblMessage.ForeColor = System.Drawing.Color.Red
        End Try
    End Sub
    Private Sub GenerarNuevoID()
        Try
            Dim nuevoCodigo As Integer = objAut.generarIdAutor()
            txtCodigo.Text = nuevoCodigo.ToString()
            txtCodigo.ReadOnly = True

            ' Mensaje de verificación
            lblMessage.Text = "ID generado automáticamente: " & nuevoCodigo.ToString()
            lblMessage.ForeColor = System.Drawing.Color.Blue
        Catch ex As Exception
            lblMessage.Text = "Error al generar un nuevo ID: " & ex.Message
            lblMessage.ForeColor = System.Drawing.Color.Red
        End Try
    End Sub
    Private Function ValidarCampos() As Boolean
        If String.IsNullOrEmpty(txtNombre.Text) Or String.IsNullOrEmpty(txtApellidos.Text) Then
            lblMessage.Text = "Por favor, complete todos los campos obligatorios."
            lblMessage.ForeColor = System.Drawing.Color.Red
            Return False
        End If
        Return True
    End Function
    Private Sub habilitarBotones(est As Boolean)
        btnBuscar.Enabled = est
        btnDarBaja.Enabled = est
        btnModificar.Enabled = est
        btnLimpiar.Enabled = est
    End Sub
    Private Sub limpiarControles()
        txtCodigo.Text = ""
        txtNombre.Text = ""
        txtApellidos.Text = ""
        chkVigencia.Checked = True
    End Sub
    Protected Sub btnModificar_Click(ByVal sender As Object, ByVal e As EventArgs)
        Try
            Dim response = MsgBox("¿Está seguro de modificar el autor: " & txtNombre.Text, MsgBoxStyle.OkCancel, "SCP")
            If response = MsgBoxResult.Ok Then
                objAut.modificarAutor(CInt(txtCodigo.Text), txtNombre.Text, txtApellidos.Text, chkVigencia.Checked)
                cargarAutores()
                limpiarControles()
            End If
        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub
    Protected Sub btnDarBaja_Click(ByVal sender As Object, ByVal e As EventArgs)
        Try
            If Not String.IsNullOrEmpty(txtCodigo.Text) Then
                Dim response = MsgBox("¿Está seguro de dar de baja al autor: " & txtNombre.Text & "?", MsgBoxStyle.OkCancel, "SCP")
                If response = MsgBoxResult.Ok Then
                    objAut.darBajaAutor(CInt(txtCodigo.Text))
                    cargarAutores()

                    lblMessage.Text = "Autor dado de baja exitosamente"
                    lblMessage.ForeColor = System.Drawing.Color.Green

                    limpiarControles()
                End If
            Else
                lblMessage.Text = "Seleccione un autor válido para dar de baja"
                lblMessage.ForeColor = System.Drawing.Color.Red
            End If
        Catch ex As Exception
            lblMessage.Text = ex.Message
            lblMessage.ForeColor = System.Drawing.Color.Red
        End Try
    End Sub
    Protected Sub btnLimpiar_Click(ByVal sender As Object, ByVal e As EventArgs)
        limpiarControles()
    End Sub
    Protected Sub btnSalir_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("HomePage.aspx")
    End Sub
    Protected Sub btnBuscar_Click(ByVal sender As Object, ByVal e As EventArgs)
        If txtCodigo.Text <> "" Then
            Dim dataTP As DataTable
            Try
                dataTP = objAut.buscarAutor(CInt(txtCodigo.Text))
                If dataTP.Rows.Count > 0 Then
                    txtCodigo.Text = dataTP.Rows(0).Item("codautor").ToString()
                    txtNombre.Text = dataTP.Rows(0).Item("nombre").ToString()
                    txtApellidos.Text = dataTP.Rows(0).Item("apellidos").ToString()
                    chkVigencia.Checked = Convert.ToBoolean(dataTP.Rows(0).Item("vigencia"))
                Else
                    lblMessage.Text = "Autor no encontrado"
                End If
            Catch ex As Exception
                lblMessage.Text = ex.Message
            End Try
        Else
            lblMessage.Text = "Ingrese un código válido"
        End If
    End Sub
    Protected Sub gvAutores_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim selectedRow As GridViewRow = gvAutores.SelectedRow
        txtCodigo.Text = selectedRow.Cells(1).Text
        txtNombre.Text = selectedRow.Cells(2).Text
        txtApellidos.Text = selectedRow.Cells(3).Text
        chkVigencia.Checked = Convert.ToBoolean(selectedRow.Cells(4).Text)
    End Sub

End Class