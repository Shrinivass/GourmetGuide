﻿<%@ Page Title="Restaurant Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="Restaurants.aspx.cs" Inherits="Account_Restaurants" %>


<%--   <div id="Restaurant Name">
     <%=str%>
    </div>--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class ="row">
    <div id ="detailsdiv" class="col-md-5" style="background-color: #333333; color: #ffffff;">
        <h4>
            <asp:TableCell runat="server" Font-Bold="True" Text=" "><b>Restaurant Name : </b></asp:TableCell><%=rName%></h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="True" Text=" "><b>Cuisine : </b></asp:TableCell><%=cuisine %></h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="true" Text=" "><b>Restaurant Address : </b></asp:TableCell><%=location %>
        </h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="true" Text=" "><b>Working Hours : </b></asp:TableCell><%=workingHours %>
        </h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="true" Text=" "><b>Web Site : <asp:HyperLink ID="webAddr" runat="server" Target="_blank"></asp:HyperLink></b></asp:TableCell><%=addressStr %>
            
        </h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="true" Text=" "><b>Telephone : </b></asp:TableCell><%=contact %>
            
        </h4>
        </div>
 
    <div class="col-md-5">
        
        <asp:Table ID="Table1" runat="server" BackColor="#333333" ForeColor="White" Height="184px" Width="100%" Font-Bold="True" Font-Overline="False">
            <asp:TableRow ID="Row1" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell   runat="server">Price-Range:</asp:TableCell>
                <asp:TableCell   runat="server">Rating:</asp:TableCell>
                <asp:TableCell   runat="server">Cash Only:</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow1" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell ID="price" runat="server"></asp:TableCell>
                <asp:TableCell ID="rating" runat="server"></asp:TableCell>
                <asp:TableCell ID="cashonly" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell   runat="server">Parking:</asp:TableCell>
                <asp:TableCell   runat="server">Smoking:</asp:TableCell>
                <asp:TableCell   runat="server">Alcohol: </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow2" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell ID="parking" runat="server"></asp:TableCell>
                <asp:TableCell ID="smoking" runat="server"></asp:TableCell>
                <asp:TableCell ID="alcohol" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell   runat="server">WiFi: </asp:TableCell>
                <asp:TableCell   runat="server">Private Dining: </asp:TableCell>
                <asp:TableCell   runat="server">Restaurant Hoiday: </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TableRow3" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell ID="wifi" runat="server"></asp:TableCell>
                <asp:TableCell ID="privatedining" runat="server"></asp:TableCell>
                <asp:TableCell ID="holiday" runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
           <br />
           </div>
    </div>
    <script src="Scripts/jquery-1.10.2.js">
    </script>

    <script src='<%=gUrl%>'>
    </script>

    <script type="text/javascript">
        /*
         * Call googleMaps api to show the location on Map
         */
        function gMaps() {
            var Lat = '<% =Lat%>';
            var lng = '<% =lng%>';
            var markers = JSON.parse('<% =ConvertDatatoString(dt1)%>');
            var latlng = new google.maps.LatLng(Lat, lng);
                var myOptions = {
                    zoom: 12,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.HYBRID
                }
                map = new google.maps.Map(document.getElementById("map"), myOptions);
                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    title: "<% =rName%>"
                });
                var pinColor = "00FF00";
                var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
                new google.maps.Size(21, 34),
                new google.maps.Point(0, 0),
                new google.maps.Point(10, 34));
                for(i=0;i<markers.length;i++)
                {
                    var data = markers[i];
                    var name = data.Name;
                    var mylatLng = new google.maps.LatLng(data.Latitude, data.Longitude);
                    var myMarker = new google.maps.Marker({
                        position: mylatLng,
                        map: map,
                        title:name,
                        icon: pinImage                       
                    })
                }            
            }
        
    </script>
    
    <!-- Tourist spots-->
     <div class="right-col">
            
    <div class="row">
        <div class="col-md-5" id="NoResult" runat="server" visible="false">
            <h4 class="text-danger"> 

                
                    We're sorry. We don't have the details of Food Items available at the restaurant. Kindly contact the restaurant to obtain more information 
                
            </h4>

        </div>
        <div class="col-md-5">
            <p>
                <asp:GridView CssClass="GridViewStyle" ID="GridView1" runat="server" PageSize="25" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" AllowSorting="True" OnSorting="GridView1_Sorting" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" HorizontalAlign="Center">
             
                    <Columns>
                        <asp:TemplateField HeaderText="Name" SortExpression="NAME">
                            <%--<EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAME") %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE" />
                        
                    </Columns>
                    <RowStyle CssClass="RowStyle" />
    <EmptyDataRowStyle CssClass="EmptyRowStyle" />
    <PagerStyle CssClass="PagerStyle" />
    <SelectedRowStyle CssClass="SelectedRowStyle" />
    <EditRowStyle CssClass="EditRowStyle" />
    <AlternatingRowStyle CssClass="AltRowStyle" />
    <SortedAscendingHeaderStyle CssClass="sortasc" />
    <SortedDescendingHeaderStyle CssClass="sortdesc" />
                </asp:GridView>
            </p>
        </div>
        <div class="col-md-5">
        <div class="row-md-5" id="map" style="width: 500px; height: 500px;">
        </div>
        <div class ="row-md-5">
            <p>
                <asp:GridView CssClass="GridViewStyle" ID="GridView2" runat="server" PageSize="25" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" HorizontalAlign="Center">
                        <Columns>
                        <asp:TemplateField HeaderStyle-Font-Underline="false" HeaderText="Name">
                            <ItemTemplate>
                                <asp:HyperLink ID="Label1" runat="server" Text='<%# Bind("NAME") %>' Target="_blank" NavigateUrl='<%#Bind("Website") %>' ></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Distance" HeaderText="Distance" HeaderStyle-Font-Underline="false"/>
                        
                    </Columns>
                    <RowStyle CssClass="RowStyle" />
    <EmptyDataRowStyle CssClass="EmptyRowStyle" />
    <PagerStyle CssClass="PagerStyle" />
    <SelectedRowStyle CssClass="SelectedRowStyle" />
    <EditRowStyle CssClass="EditRowStyle" />
    <AlternatingRowStyle CssClass="AltRowStyle" />
    <SortedAscendingHeaderStyle CssClass="sortasc" />
    <SortedDescendingHeaderStyle CssClass="sortdesc" />
                </asp:GridView>
            </p>
        </div>
        </div> 
        
    </div>

    <div class="row" style="align-content: center">
        <p>
            <asp:Button ID="TableReserve" Text="Table Reserve" OnClick="TableReserve_Click" runat="server" CssClass="btn btn-default" />
            <asp:Button ID="FoodReserve" Text="Order food" OnClick="FoodReserve_Click" runat="server" CssClass="btn btn-default" />
        </p>
    </div>
    </div>
</asp:Content>
