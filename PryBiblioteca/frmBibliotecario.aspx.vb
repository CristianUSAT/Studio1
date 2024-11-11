Imports prjCapaNegocio

Public Class frmBibliotecario
    Inherits System.Web.UI.Page

    Dim objBib As New clsBibliotecario

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                CargarPreguntas()
                CargarBibliotecarios()
            Catch ex As Exception
                lblMessage.Text = "Error al cargar datos: " & ex.Message
            End Try
        End If
    End Sub



    Private Sub CargarPreguntas()
        Try
            Dim objMan As New prjCapaDatos.clsMantenimiento
            Dim strSQL As String = "SELECT id_pregunta, pregunta FROM pregunta_secreta ORDER BY pregunta"
            Dim dtPreguntas As DataTable = objMan.listarComando(strSQL)

            ' Validación adicional para asegurar que los valores sean enteros
            For Each row As DataRow In dtPreguntas.Rows
                If Not Integer.TryParse(row("id_pregunta").ToString().Trim(), New Integer) Then
                    lblMessage.Text = "Error en los datos: El campo id_pregunta contiene un valor no válido."
                    Return
                End If
            Next

            cbxPregunta.DataSource = dtPreguntas
            cbxPregunta.DataTextField = "pregunta"
            cbxPregunta.DataValueField = "id_pregunta"
            cbxPregunta.DataBind()

            ' Agregar un elemento por defecto
            cbxPregunta.Items.Insert(0, New ListItem("Seleccione una pregunta", "0"))
        Catch ex As Exception
            lblMessage.Text = "Error al cargar preguntas: " & ex.Message
        End Try
    End Sub




    Private Sub CargarBibliotecarios()
        Try
            Dim dtBibliotecarios As DataTable = objBib.listarBibliotecario()

            ' Asegurarse de que el DataTable incluye la columna id_pregunta
            If Not dtBibliotecarios.Columns.Contains("id_pregunta") Then
                dtBibliotecarios.Columns.Add("id_pregunta", GetType(Integer))
            End If

            ' Obtener el diccionario de id_pregunta y pregunta
            Dim objMan As New prjCapaDatos.clsMantenimiento
            Dim strSQL As String = "SELECT id_pregunta, pregunta FROM pregunta_secreta"
            Dim dtPreguntas As DataTable = objMan.listarComando(strSQL)
            Dim dictPreguntas As New Dictionary(Of Integer, String)
            For Each row As DataRow In dtPreguntas.Rows
                dictPreguntas(Convert.ToInt32(row("id_pregunta"))) = row("pregunta").ToString()
            Next

            ' Añadir columna de pregunta al DataTable
            If Not dtBibliotecarios.Columns.Contains("pregunta") Then
                dtBibliotecarios.Columns.Add("pregunta", GetType(String))
            End If

            For Each row As DataRow In dtBibliotecarios.Rows
                Dim idPregunta As Integer = Convert.ToInt32(row("id_pregunta"))
                If dictPreguntas.ContainsKey(idPregunta) Then
                    row("pregunta") = dictPreguntas(idPregunta)
                Else
                    row("pregunta") = ""
                End If
            Next

            dgvBibliotecario.DataSource = dtBibliotecarios
            dgvBibliotecario.DataBind()
        Catch ex As Exception
            lblMessage.Text = "Error al cargar bibliotecarios: " & ex.Message
        End Try
    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs)
        If String.IsNullOrEmpty(txtDNI.Text) Then
            lblMessage.Text = "Por favor, ingrese un DNI para buscar."
            Return
        End If

        Try
            Dim dt As DataTable = objBib.buscarBibliotecario(txtDNI.Text)
            If dt IsNot Nothing AndAlso dt.Rows.Count > 0 Then
                Dim row As DataRow = dt.Rows(0)
                txtNombres.Text = row("nombre_bib").ToString()
                txtApellidoPat.Text = row("apellidopaterno_bib").ToString()
                txtApellidoMat.Text = row("apellidomaterno_bib").ToString()
                txtRespuesta.Text = row("respuesta_pregunta").ToString()
                cbxPregunta.SelectedValue = row("id_pregunta").ToString()

                ' Asignar la contraseña al atributo value
                txtPassword.Attributes("value") = row("contraseña_bib").ToString()

                lblMessage.Text = "Bibliotecario encontrado."
            Else
                lblMessage.Text = "No se encontró ningún bibliotecario con ese DNI."
                LimpiarCampos()
            End If
        Catch ex As Exception
            lblMessage.Text = "Error al buscar bibliotecario: " & ex.Message
        End Try
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            Dim idPre As Integer = Convert.ToInt32(cbxPregunta.SelectedValue)

            ' Validar que se haya seleccionado una pregunta válida
            If idPre = 0 Then
                lblMessage.Text = "Por favor, seleccione una pregunta secreta válida."
                Return
            End If

            objBib.registrarBibliotecario(
                txtDNI.Text,
                txtNombres.Text,
                txtApellidoPat.Text,
                txtApellidoMat.Text,
                txtPassword.Text,
                idPre,
                txtRespuesta.Text
            )
            lblMessage.Text = "Bibliotecario registrado correctamente."
            CargarBibliotecarios()
            LimpiarCampos()
        Catch ex As Exception
            lblMessage.Text = "Error al guardar bibliotecario: " & ex.Message
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            ' Validar que txtDNI.Text sea numérico
            Dim dniBib As Integer
            If Not Integer.TryParse(txtDNI.Text.Trim(), dniBib) Then
                lblMessage.Text = "Error: El DNI debe ser un número válido."
                Return
            End If

            ' Verificar el valor de SelectedValue
            lblMessage.Text = "SelectedValue de cbxPregunta: " & cbxPregunta.SelectedValue

            ' Convertir el valor de la pregunta secreta
            Dim idPre As Integer
            If Not Integer.TryParse(cbxPregunta.SelectedValue.Trim(), idPre) Then
                lblMessage.Text &= " Error: Por favor, seleccione una pregunta secreta válida."
                Return
            End If

            lblMessage.Text &= " idPre = " & idPre

            ' Continuar con la modificación si la validación es exitosa
            objBib.modificarBibliotecario(
            txtDNI.Text,
            txtNombres.Text,
            txtApellidoPat.Text,
            txtApellidoMat.Text,
            txtPassword.Text,
            idPre,
            txtRespuesta.Text
        )

            lblMessage.Text = "Bibliotecario modificado correctamente."
            CargarBibliotecarios()
            LimpiarCampos()
        Catch ex As Exception
            lblMessage.Text = "Error al modificar bibliotecario: " & ex.Message
        End Try
    End Sub









    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        LimpiarCampos()
        lblMessage.Text = "Formulario limpiado."
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs)
        Response.Redirect("HomePage.aspx")
    End Sub

    Private Sub LimpiarCampos()
        txtDNI.Text = ""
        txtNombres.Text = ""
        txtApellidoPat.Text = ""
        txtApellidoMat.Text = ""
        txtPassword.Text = ""
        cbxPregunta.SelectedIndex = 0
        txtRespuesta.Text = ""
        txtPassword.Text = ""
    End Sub

    Protected Sub dgvBibliotecario_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles dgvBibliotecario.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Encontrar el control LinkButton dentro del TemplateField
            Dim btn As LinkButton = CType(e.Row.FindControl("lnkSelect"), LinkButton)
            btn.CommandArgument = e.Row.RowIndex.ToString()

            ' Hacer que toda la fila sea clicable
            e.Row.Attributes("onclick") = Page.ClientScript.GetPostBackClientHyperlink(btn, "")
            e.Row.Attributes("style") = "cursor:pointer"
        End If
    End Sub

    Protected Overrides Sub Render(writer As HtmlTextWriter)
        For Each row As GridViewRow In dgvBibliotecario.Rows
            If row.RowType = DataControlRowType.DataRow Then
                Dim btn As LinkButton = CType(row.FindControl("lnkSelect"), LinkButton)
                Page.ClientScript.RegisterForEventValidation(btn.UniqueID)
            End If
        Next
        MyBase.Render(writer)
    End Sub

    Protected Sub dgvBibliotecario_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles dgvBibliotecario.RowCommand
        If e.CommandName = "Select" Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim row As GridViewRow = dgvBibliotecario.Rows(index)

            ' Obtener el valor de id_pregunta desde DataKeys
            Dim idPregunta As String = dgvBibliotecario.DataKeys(index).Values("id_pregunta").ToString()

            ' Verificar si idPregunta es válido
            If Not String.IsNullOrEmpty(idPregunta) AndAlso cbxPregunta.Items.FindByValue(idPregunta) IsNot Nothing Then
                cbxPregunta.SelectedValue = idPregunta
            Else
                lblMessage.Text = "Error: La pregunta secreta seleccionada no es válida."
                cbxPregunta.SelectedIndex = 0 ' Seleccionar el primer elemento
            End If

            ' Asignar otros valores
            txtDNI.Text = row.Cells(1).Text
            txtNombres.Text = row.Cells(2).Text
            txtApellidoPat.Text = row.Cells(3).Text
            txtApellidoMat.Text = row.Cells(4).Text
            txtRespuesta.Text = row.Cells(6).Text

            ' Asignar la contraseña al atributo value
            txtPassword.Attributes("value") = row.Cells(7).Text

            lblMessage.Text = "Bibliotecario seleccionado."
        End If
    End Sub


End Class
