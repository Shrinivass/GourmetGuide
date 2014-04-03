﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class Account_Restaurants : System.Web.UI.Page
{
    DataSet tbl = new DataSet();
    public string str;
    public string str1;
    public string rName;
    public string rid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["sortOrder"] = "";
            bindGridView("", "");
        }
        if (Request.QueryString["restaurant"] != null)
        {
            rid = Request.QueryString["restaurant"];
            System.Diagnostics.Debug.WriteLine("Helkko " + rid);
            string ConnectionString = "Provider=OraOLEDB.Oracle; DATA SOURCE=oracle.cise.ufl.edu:1521/ORCL;PASSWORD=kart1234;USER ID=kshantar";
            string cmd = "SELECT NAME, DESCRIPTION, OPENTIME, CLOSETIME,ADDRESS1, ADDRESS2, CITY, STATE, ZIP, RESTAURANTID FROM SRAJAGOP.RESTAURANT WHERE RESTAURANTID = " +rid;
            string cmd1 = "SELECT DISTINCT SRAJAGOP.FOOD.NAME, SRAJAGOP.FDPRICECATALOG.PRICE FROM SRAJAGOP.FOOD INNER JOIN SRAJAGOP.FDPRICECATALOG ON SRAJAGOP.FOOD.FOODID = SRAJAGOP.FDPRICECATALOG.FOODID INNER JOIN SRAJAGOP.RESTAURANT ON SRAJAGOP.RESTAURANT.RESTAURANTID = SRAJAGOP.FDPRICECATALOG.RESTAURANTID WHERE SRAJAGOP.RESTAURANT.RESTAURANTID =" + rid;
            OleDbConnection conn = new OleDbConnection(ConnectionString);
            conn.Open();
            OleDbCommand name = new OleDbCommand(cmd, conn);
            OleDbDataReader oReader = name.ExecuteReader();
            oReader.Read();
            str = oReader[0].ToString();
            str1 = oReader[1].ToString();
       
            OleDbCommand select_search = new OleDbCommand(cmd1, conn);
            OleDbDataAdapter oAdapter = new OleDbDataAdapter(select_search);
            oAdapter.Fill(tbl);
            //RestaurantRepeater.DataSource = oReader;
            //RestaurantRepeater.DataBind();
            GridView1.DataSource = tbl.Tables[0];
            GridView1.DataBind();
            GridView1.PagerSettings.Mode = PagerButtons.Numeric;
            conn.Close();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.DataSource = tbl.Tables[0];
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        bindGridView(e.SortExpression, sortOrder);
    }
    public string sortOrder
    {
        get
        {
            if (ViewState["sortOrder"].ToString() == "desc")
            {
                ViewState["sortOrder"] = "asc";
            }
            else
            {
                ViewState["sortOrder"] = "desc";
            }

            return ViewState["sortOrder"].ToString();
        }
        set
        {
            ViewState["sortOrder"] = value;
        }
    }
    public void bindGridView(string sortExp, string sortDir)
    {
        if (Request.QueryString["restaurant"] != null)
        {
            rid = Request.QueryString["restaurant"].ToUpper();
            string ConnectionString = "Provider=OraOLEDB.Oracle; DATA SOURCE=oracle.cise.ufl.edu:1521/ORCL;PASSWORD=kart1234;USER ID=kshantar";
            string cmd1 = "SELECT DISTINCT SRAJAGOP.FOOD.NAME, SRAJAGOP.FDPRICECATALOG.PRICE FROM SRAJAGOP.FOOD INNER JOIN SRAJAGOP.FDPRICECATALOG ON SRAJAGOP.FOOD.FOODID = SRAJAGOP.FDPRICECATALOG.FOODID INNER JOIN SRAJAGOP.RESTAURANT ON SRAJAGOP.RESTAURANT.RESTAURANTID = SRAJAGOP.FDPRICECATALOG.RESTAURANTID WHERE SRAJAGOP.RESTAURANT.RESTAURANTID =" + rid;
            OleDbConnection conn = new OleDbConnection(ConnectionString);
            conn.Open();
            OleDbCommand select_search = new OleDbCommand(cmd1, conn);
            OleDbDataAdapter oAdapter = new OleDbDataAdapter(select_search);
            oAdapter.Fill(tbl);
            DataView myDataView = new DataView();
            myDataView = tbl.Tables[0].DefaultView;
            if (sortExp != string.Empty)
            {
                myDataView.Sort = string.Format("{0} {1}", sortExp, sortDir);
            }

            GridView1.DataSource = myDataView;
            GridView1.DataBind();
            conn.Close();
        }
    }
    protected void TableReserve_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Reserve?restaurant=" + rid);
    }
}