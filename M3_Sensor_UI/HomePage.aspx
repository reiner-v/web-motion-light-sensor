<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="M3_Sensor_UI.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ate Co. - Light Motion Sensor</title>
    <link rel="stylesheet" href="mystyle.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <asp:Button ID="btnlog" runat="server" Text="LOG" OnClientClick="window.open('LogPage.aspx','_blank')" />
            <asp:Image ID="Image1" runat="server" Height="168px" ImageUrl="~/Images/logo.png" Width="455px" />
        </div>
        <div>
            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="Mode Switch: " class="labeltxt"></asp:Label>
                        <asp:Label ID="modetxt" runat="server" Text="Automatic or Manual" class="statustxt"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="Light Status:" class="labeltxt"></asp:Label>
                        <asp:Label ID="powertxt" runat="server" Text="On or OFF" class="statustxt"></asp:Label>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="statusswitch" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Timer ID="statusswitch" runat="server" Interval="1000" OnTick="statusswitch_Tick"></asp:Timer>
        </div>
        <div>
            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label ID="alarmtxt" runat="server" Text="ALARM!" Visible="False"></asp:Label>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="alarmalert" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Timer ID="alarmalert" runat="server" Interval="1000" OnTick="alarmalert_Tick"></asp:Timer>
        </div>
        <div class="row pos">
            <div class="col-10">
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Label ID="Label8" runat="server" Text="Date:" class="labeltxt"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="timerdate" EventName="Tick" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:Timer ID="timerdate" runat="server" Interval="1000" OnTick="timerdate_Tick"></asp:Timer>
            </div>
            <div class="col-80">
                <div>
                    <asp:Label ID="mlslabel" runat="server" Text="Manual Light Sensor:" class="labeltxt"></asp:Label>
                </div>
                <div>
                    <asp:Button ID="btnon" runat="server" Text="ON" class="btnswitch" OnClick="btnon_Click" />
                    <asp:Button ID="btnoff" runat="server" Text="OFF" class="btnswitch" OnClick="btnoff_Click" />
                </div>
            </div>
            <div class="col-10">
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Label ID="Label9" runat="server" Text="Count:" class="labeltxt"></asp:Label>
                        <asp:TextBox ID="counttxt" runat="server" class="dispbox" ReadOnly="True" ForeColor="Black"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="timercount" EventName="Tick" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:Timer ID="timercount" runat="server" Interval="1000" OnTick="timercount_Tick"></asp:Timer>
            </div>
        </div>
        <asp:Image ID="pinkCloud" runat="server" ImageUrl="~/Images/pinkcloud.png" />
    </form>
</body>
</html>
