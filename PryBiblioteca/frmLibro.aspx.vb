Imports prjCapaNegocio

Public Class frmLibro
    Inherits System.Web.UI.Page

    Dim objLibro As New clsLibro
    Dim objAutor As New clsAutor
    Dim objEditorial As New clsEditorial
    Dim objGenero As New clsGenero

    ' Diccionarios para almacenar nombres de Editorial, Autor y Género por ID
    Private EditorialesDict As New Dictionary(Of Integer, String)
    Private AutoresDict As New Dictionary(Of Integer, String)
    Private GenerosDict As New Dictionary(Of Integer, String)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarEditoriales()
            CargarAutores()
            CargarGeneros()
            CargarLibros()
        End If
    End Sub

    Private Sub CargarEditoriales()
        Try
            Dim dt As DataTable = objEditorial.listarEditorial()
            cbxEditorial.DataSource = dt
            cbxEditorial.DataTextField = "nombre"
            cbxEditorial.DataValueField = "id_editorial"
            cbxEditorial.DataBind()

            ' Llenar el diccionario de editoriales
            For Each row As DataRow In dt.Rows
                EditorialesDict.Add(Convert.ToInt32(row("id_editorial")), row("nombre").ToString())
            Next
        Catch ex As Exception
            lblMessage.Text = "Error al cargar editoriales: " & ex.Message
        End Try
    End Sub

    Private Sub CargarAutores()
        Try
            Dim dt As DataTable = objAutor.listarAutor()
            cbxAutor.DataSource = dt
            cbxAutor.DataTextField = "nombreAutor"
            cbxAutor.DataValueField = "codautor"
            cbxAutor.DataBind()

            ' Llenar el diccionario de autores
            For Each row As DataRow In dt.Rows
                AutoresDict.Add(Convert.ToInt32(row("codautor")), row("nombreAutor").ToString())
            Next
        Catch ex As Exception
            lblMessage.Text = "Error al cargar autores: " & ex.Message
        End Try
    End Sub

    Private Sub CargarGeneros()
        Try
            Dim dt As DataTable = objGenero.listarGeneros()
            cbxGenero.DataSource = dt
            cbxGenero.DataTextField = "nomgenero"
            cbxGenero.DataValueField = "id_genero"
            cbxGenero.DataBind()

            ' Llenar el diccionario de géneros
            For Each row As DataRow In dt.Rows
                GenerosDict.Add(Convert.ToInt32(row("id_genero")), row("nomgenero").ToString())
            Next
        Catch ex As Exception
            lblMessage.Text = "Error al cargar géneros: " & ex.Message
        End Try
    End Sub

    Private Sub CargarLibros()
        Try
            dgvLibros.DataSource = objLibro.listarLibro()
            dgvLibros.DataBind()
        Catch ex As Exception
            lblMessage.Text = "Error al cargar libros: " & ex.Message
        End Try
    End Sub

    Protected Sub dgvLibros_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Convertir id_editorial a nombreEditorial
            Dim idEditorial As Integer = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id_editorial"))
            If EditorialesDict.ContainsKey(idEditorial) Then
                e.Row.Cells(3).Text = EditorialesDict(idEditorial)
            Else
                e.Row.Cells(3).Text = "Desconocido"
            End If

            ' Convertir codautor a nombreAutor
            Dim idAutor As Integer = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "codautor"))
            If AutoresDict.ContainsKey(idAutor) Then
                e.Row.Cells(4).Text = AutoresDict(idAutor)
            Else
                e.Row.Cells(4).Text = "Desconocido"
            End If

            ' Convertir id_genero a nomgenero
            Dim idGenero As Integer = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id_genero"))
            If GenerosDict.ContainsKey(idGenero) Then
                e.Row.Cells(5).Text = GenerosDict(idGenero)
            Else
                e.Row.Cells(5).Text = "Desconocido"
            End If
        End If
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Try
            objLibro.registrarLibro(txtISBN.Text, txtTitulo.Text, Integer.Parse(txtAnioPub.Text), chkEstado.Checked, Integer.Parse(cbxEditorial.SelectedValue), New List(Of Tuple(Of Integer, String)) From {Tuple.Create(Integer.Parse(cbxAutor.SelectedValue), cbxAutor.SelectedItem.Text)}, New List(Of Tuple(Of Integer, String)) From {Tuple.Create(Integer.Parse(cbxGenero.SelectedValue), cbxGenero.SelectedItem.Text)})
            lblMessage.Text = "Libro registrado correctamente."
            CargarLibros()
        Catch ex As Exception
            lblMessage.Text = "Error al guardar libro: " & ex.Message
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs)
        Try
            objLibro.modificarLibro(txtISBN.Text, txtTitulo.Text, Integer.Parse(txtAnioPub.Text), chkEstado.Checked, Integer.Parse(cbxEditorial.SelectedValue), New List(Of Tuple(Of Integer, String)) From {Tuple.Create(Integer.Parse(cbxAutor.SelectedValue), cbxAutor.SelectedItem.Text)}, New List(Of Tuple(Of Integer, String)) From {Tuple.Create(Integer.Parse(cbxGenero.SelectedValue), cbxGenero.SelectedItem.Text)})
            lblMessage.Text = "Libro modificado correctamente."
            CargarLibros()
        Catch ex As Exception
            lblMessage.Text = "Error al modificar libro: " & ex.Message
        End Try
    End Sub

    Protected Sub btnDarBaja_Click(sender As Object, e As EventArgs)
        Try
            objLibro.darBajaLibro(txtISBN.Text)
            lblMessage.Text = "Libro dado de baja correctamente."
            CargarLibros()
        Catch ex As Exception
            lblMessage.Text = "Error al dar de baja el libro: " & ex.Message
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs)
        txtISBN.Text = ""
        txtTitulo.Text = ""
        txtAnioPub.Text = ""
        chkEstado.Checked = False
        cbxEditorial.ClearSelection()
        cbxAutor.ClearSelection()
        cbxGenero.ClearSelection()
        lblMessage.Text = ""
    End Sub
End Class
