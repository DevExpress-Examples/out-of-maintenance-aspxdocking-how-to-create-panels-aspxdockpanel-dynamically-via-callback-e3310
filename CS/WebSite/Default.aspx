<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDocking" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <script type="text/javascript">
        function MovePanelsToContainer() {
            var content = cbPanel.GetMainElement();
            var panelsDiv = document.getElementById('panelContainer');
            while (content.childNodes.length != 0)
                panelsDiv.appendChild(content.childNodes[0]);
        }

        function OnControlsInitialized(s, e) {
            if (!e.isCallback)
                MovePanelsToContainer();
        }

        function OnAddBtnClick() {
            cbPanel.PerformCallback();
        }
    </script>

    <form id="form1" runat="server">
        <dx:ASPxButton ID="btnAdd" runat="server" Text="Add Dock" AutoPostBack="False">
            <ClientSideEvents Click="OnAddBtnClick" />
        </dx:ASPxButton>
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="do PostBack">
        </dx:ASPxButton>
        <dx:ASPxDockZone ID="zone1" ClientInstanceName="zone1" runat="server" BackColor="LightBlue"
            Width="350px">
        </dx:ASPxDockZone>
        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="200px" ClientInstanceName="cbPanel"
            OnCallback="ASPxCallbackPanel1_Callback">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server">
                </dx:PanelContent>
            </PanelCollection>
            <ClientSideEvents EndCallback="MovePanelsToContainer" />
        </dx:ASPxCallbackPanel>
        <div id="panelContainer">
        </div>
        <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
            <ClientSideEvents ControlsInitialized="OnControlsInitialized" />
        </dx:ASPxGlobalEvents>
        <dx:ASPxDockManager ID="ASPxDockManager1" runat="server" SaveStateToCookies="true"
            SaveStateToCookiesID="panelCookie">
        </dx:ASPxDockManager>
    </form>
</body>
</html>