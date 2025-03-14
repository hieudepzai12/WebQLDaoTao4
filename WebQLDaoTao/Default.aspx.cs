﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLDaoTao
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                if (Session["role"].ToString() == "SINHVIEN")
                {
                    Response.Write("<script> alert('Chức năng này chỉ dành cho cán bộ đào tạo!'); " +
                        "window.location='Default.aspx';</script>");
                }
            }
        }
    }
}