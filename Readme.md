<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxDocking - How to create panels (ASPxDockPanel) dynamically via callback


<p>This example illustrates how to create panels (ASPxDockPanel) dynamically via callback by using the ASPxCallbackPanel control.</p>


<h3>Description</h3>

<p>The ASPxCallbackPanel control is used for creating ASPxDockPanel instances.</p><p>Once the required number of ASPxDockPanel instances is created within the ASPxCallbackPanel’s content, it is necessary to store the content rendered via callback within the static &lt;div&gt; container. This approach will allow not overriding the ASPxDockPanel’s content during the next callback that should create another instance of ASPxDockPanel.</p><p>Once any of  ASPxDockPanel instances has been created via callback, it is necessary to restore the page’s controls hierarchy during the Page_Init stage (IDs of dynamically created ASPxDockPanel instances are stored within the Session state).</p><p>The state of ASPxDockPanel instances is stored automatically by ASPxDockManager within browser cookies.</p>

<br/>


