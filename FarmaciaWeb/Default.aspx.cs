using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }




    protected void iniciar_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(TextBox1.Text) && !String.IsNullOrEmpty(Password1.Value))
        {
            //Response.Write("<script>alert('"+TextBox1.Text+" "+Password1.Value+"')</script>");
            Conexion c = new Conexion();
            string []usuario =c.iniciarSesion(TextBox1.Text, Password1.Value);

             if (usuario == null || String.IsNullOrEmpty(usuario[0]))
             {
                 Response.Write("<script>alert('No existe ese registro')</script>");
             }
             else if (usuario[0] == "admin")
             {

                 Session["puesto"] = "admin";
                 Response.Write("<script>alert('" + usuario[1] + "')</script>");
                 Session["id"] = usuario[1];
                 Console.WriteLine(usuario[1]);
                 //Response.Write("<script>alert('" +Session["id"]+ "')</script>");
                 Response.Redirect("Articulos.aspx");
             }
             else if (usuario[0] == "cajero")
             {
                 Session["puesto"] = "cajero";
                    Session["id"] = usuario[1];
                    Console.WriteLine(usuario[1]);
                    Response.Redirect("Venta.aspx");
             }

            //Session["puesto"] = "cajero";
        }
    }
}