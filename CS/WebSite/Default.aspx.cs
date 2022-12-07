using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page {
    const string PanelIDsSessionKey = "6e2a506a-70cf-4792-a646-442722c3b461";

    protected List<string> PanelIDs {
        get {
            if(Session[PanelIDsSessionKey] == null)
                Session[PanelIDsSessionKey] = new List<string>();
            return Session[PanelIDsSessionKey] as List<string>;
        }
    }

    protected override void OnInit(EventArgs e) {
        base.OnInit(e);

        foreach(string panelID in PanelIDs)
            CreatePanelWithWrapper(panelID, !ASPxCallbackPanel1.IsCallback);
    }

    protected void ASPxCallbackPanel1_Callback(object sender, CallbackEventArgsBase e) {
        string panelID = Guid.NewGuid().ToString().Replace("-", "a");
        CreatePanelWithWrapper(panelID, true);
        PanelIDs.Add(panelID);
    }

    protected void CreatePanelWithWrapper(string panelID, bool visible) {
        const string WrapperIDPostfix = "_DPW";

        WebControl wrapperDiv = new WebControl(HtmlTextWriterTag.Div);
        wrapperDiv.ID = panelID + WrapperIDPostfix;
        wrapperDiv.Visible = visible;
        ASPxDockPanel panel = new ASPxDockPanel();
        panel.ID = panelID;
        panel.Visible = visible;
        panel.Text = "Example text";
        wrapperDiv.Controls.Add(panel);
        ASPxCallbackPanel1.Controls.Add(wrapperDiv);
    }
}

