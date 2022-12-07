Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web
Imports System.Web.UI.HtmlControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private Const PanelIDsSessionKey As String = "6e2a506a-70cf-4792-a646-442722c3b461"

	Protected ReadOnly Property PanelIDs() As List(Of String)
		Get
			If Session(PanelIDsSessionKey) Is Nothing Then
				Session(PanelIDsSessionKey) = New List(Of String)()
			End If
			Return TryCast(Session(PanelIDsSessionKey), List(Of String))
		End Get
	End Property

	Protected Overrides Sub OnInit(ByVal e As EventArgs)
		MyBase.OnInit(e)

		For Each panelID As String In PanelIDs
			CreatePanelWithWrapper(panelID, (Not ASPxCallbackPanel1.IsCallback))
		Next panelID
	End Sub

	Protected Sub ASPxCallbackPanel1_Callback(ByVal sender As Object, ByVal e As CallbackEventArgsBase)
		Dim panelID As String = Guid.NewGuid().ToString().Replace("-", "a")
		CreatePanelWithWrapper(panelID, True)
		PanelIDs.Add(panelID)
	End Sub

	Protected Sub CreatePanelWithWrapper(ByVal panelID As String, ByVal visible As Boolean)
		Const WrapperIDPostfix As String = "_DPW"

		Dim wrapperDiv As New WebControl(HtmlTextWriterTag.Div)
		wrapperDiv.ID = panelID & WrapperIDPostfix
		wrapperDiv.Visible = visible
		Dim panel As New ASPxDockPanel()
		panel.ID = panelID
		panel.Visible = visible
		panel.Text = "Example text"
		wrapperDiv.Controls.Add(panel)
		ASPxCallbackPanel1.Controls.Add(wrapperDiv)
	End Sub
End Class

