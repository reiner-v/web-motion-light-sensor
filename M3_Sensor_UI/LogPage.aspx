<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogPage.aspx.cs" Inherits="M3_Sensor_UI.LogPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ate Co.- Logs</title>
    <link rel="stylesheet" href="mystyle.css" />
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Scripts/ScrollableGridPlugin.js" type="text/javascript"></script>

<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        $('#<%=GridView1.ClientID %>').Scrollable();
}
)
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div>
            <asp:TextBox ID="fdatetxt" runat="server" TextMode="Date" class="filterbox"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Mode:" class="labeltxt"></asp:Label>
            <asp:DropDownList ID="fmodelist" runat="server" class="filterbox">
                <asp:ListItem Selected="True">All</asp:ListItem>
                <asp:ListItem Value="1">Automatic</asp:ListItem>
                <asp:ListItem Value="0">Manual</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label12" runat="server" Text="Alarm:" class="labeltxt"></asp:Label>
            <asp:DropDownList ID="falarmlist" runat="server" class="filterbox">
                <asp:ListItem Selected="True">All</asp:ListItem>
                <asp:ListItem Value="1">Alarm</asp:ListItem>
                <asp:ListItem Value="0">No Alarm</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnfilter" runat="server" Text="Filter" OnClick="btnfilter_Click" />
            <asp:Button ID="btnreset" runat="server" Text="Reset" OnClick="btnreset_Click" />
        
        </div>
        <div>
            
            <div id="scroll">
            <div class="col-cover">
                 <asp:Label ID="Label7" runat="server" Text="Date" class="col-label"></asp:Label>
                 <asp:Label ID="Label4" runat="server" Text="Time" class="col-label"></asp:Label>
                 <asp:Label ID="Label5" runat="server" Text="Mode" class="col-label"></asp:Label>
                 <asp:Label ID="Label6" runat="server" Text="Alarm" class="col-label"></asp:Label>
            </div>
            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" BorderColor="#FF0066" BorderStyle="Ridge" RowStyle-CssClass="rowgrid" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#E0218A" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#E0218A" Font-Bold="True" ForeColor="White" Cssclass="HeadSticky"/>
                        <PagerStyle BackColor="White" ForeColor="DeepPink" HorizontalAlign="Center" />
                        <RowStyle BackColor="#f7b3d5"  />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
             
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="timerlog" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
                   </div>
            <asp:Timer ID="timerlog" runat="server" Interval="1000" OnTick="timerlog_Tick"></asp:Timer>
        </div>
        <div>
            <asp:Button ID="btnlive" runat="server" Text="Stop Live" OnClick="btnlive_Click" />
        </div>
    </form>
</body>
</html>
