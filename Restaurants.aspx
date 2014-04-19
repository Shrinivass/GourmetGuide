﻿<%@ Page Title="Restaurant Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="Restaurants.aspx.cs" Inherits="Account_Restaurants" %>


<%--   <div id="Restaurant Name">
     <%=str%>
    </div>--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Gourmet Guide</h1>
        <p class="lead">Your one stop guide from searching a restaurant to ordering food is here.</p>
    </div>
    <div class="Restaurant details">
        <h4>
            <asp:TableCell runat="server" Font-Bold="True" Text=" "><b>Restaurant Name : </b></asp:TableCell><%=rName%></h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="True" Text=" "><b>Cuisine : </b></asp:TableCell><%=cuisine%></h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="true" Text=" "><b>Restaurant Address : </b></asp:TableCell><%=location %>
        </h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="true" Text=" "><b>Working Hours : </b></asp:TableCell><%=workingHours %>
        </h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="true" Text=" "><b>Restaurant Holidays : </b></asp:TableCell><%=holiday %>
        </h4>
        <h4>
            <asp:TableCell runat="server" Font-Bold="true" Text=" "><b>Restaurant Address : </b></asp:TableCell><%=tName %>
        </h4>
        
    </div>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src='<%=gUrl%>'>
    </script>
    <script type="text/javascript">
        /*
         * Call googleMaps api to show the location on Map
         */
        function gMaps() {
            var Lat = '<% =Lat%>';
            var lng = '<% =lng%>';
            var latlng = new google.maps.LatLng(Lat, lng);
                var myOptions = {
                    zoom: 70,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.HYBRID
                }
                map = new google.maps.Map(document.getElementById("map"), myOptions);
                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    title: 'Restaurant'
                });        
            
            }
        
    </script>
    <!-- Tourist spots-->
     <div class="right-col">
            
    <div class="row">
        <div class="col-md-5" id="NoResult" runat="server" visible="false">
            <h4> 

                <p class="text-danger">
                    We're sorry. We don't have the details of Food Items available at the restaurant. Kindly contact the restaurant to obtain more information 
                </p>
            </h4>

        </div>
        <div class="col-md-5">
            <p>
                <asp:GridView CssClass="GridViewStyle" ID="GridView1" runat="server" PageSize="25" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" AllowSorting="True" OnSorting="GridView1_Sorting" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" HorizontalAlign="Center">
             
                    <Columns>
                        <asp:TemplateField HeaderText="Name" SortExpression="NAME">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAME") %>'></asp:TextBox>
                            </EditItemTemplate>
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
            <p>"you are my darling"
                <asp:GridView CssClass="GridViewStyle" ID="GridView2" runat="server" PageSize="25" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" HorizontalAlign="Center">
                        <Columns>
                        <asp:BoundField DataField="Name" HeaderText="NAME" />
                        <asp:BoundField DataField="Distance" HeaderText="Distance" />
                        
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
</asp:Content>
