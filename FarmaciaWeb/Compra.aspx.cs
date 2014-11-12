using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Compra : System.Web.UI.Page
{
    Conexion con;
    String[] productos;
    TextBox[] cantidad, existencia,porcientoTxt;
    Label[] nombre, precion,porcientoLbl;
    string[] idarticulo;
    double suma = 0;
    Label lblTotal = new Label();
    string[] productosnombre;
    string[] cantidadproducto;
    string[] preciocompra;
    string[] porciento;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new Conexion();
        if ((String)Session["puesto"] == null)
        {
            Response.Write("<script>alert('Para acceder a este contenido debes iniciar sesion')</script>");
            Response.Redirect("Default.aspx");
        }
        productos = con.getArticulos();
        cantidad = new TextBox[productos.Length];
        nombre = new Label[productos.Length];
        precion = new Label[productos.Length];
        existencia = new TextBox[productos.Length];
        porcientoLbl = new Label[productos.Length];
        porcientoTxt = new TextBox[productos.Length];
        idarticulo = new String[productos.Length];

        lblTotal.Text = "Total :";
        lblTotal.ID = "Total";
        lblTotal.Font.Size = FontUnit.Point(30);

        int x = 100;
        int y = 10;
        int cont = 0;
        for (int i = 0; i < productos.Length; i++)
        {
            cantidad[i] = new TextBox();
            nombre[i] = new Label();
            precion[i] = new Label();
            existencia[i] = new TextBox();
            porcientoLbl[i] = new Label();
            porcientoTxt[i] = new TextBox();

            cantidad[i].ID = "TextBox" + (i + 1);
            nombre[i].ID = "Nombre" + (i + 1);
            precion[i].ID = "Precio" + (i + 1);
            existencia[i].ID = "Existencia" + (i + 1);
            porcientoTxt[i].ID = "PorcientoText" + (i + 1);
            porcientoLbl[i].ID = "Porciento" + (i + 1);


            cantidad[i].Style["Position"] = "Absolute";
            existencia[i].Style["Position"] = "Absolute";
            precion[i].Style["Position"] = "Absolute";
            nombre[i].Style["Position"] = "Absolute";
            porcientoLbl[i].Style["Position"] = "Absolute";
            porcientoTxt[i].Style["Position"] = "Absolute";

            cantidad[i].Style["Top"] = x + "px";
            nombre[i].Style["Top"] = x + "px";
            precion[i].Style["Top"] = x + "px";
            existencia[i].Style["Top"] = x + "px";
            porcientoTxt[i].Style["Top"] = x + "px";
            porcientoLbl[i].Style["Top"] = x + "px";


            cantidad[i].Width = 60;
            existencia[i].Width = 60;
            porcientoTxt[i].Width = 60;
            cantidad[i].Style["Left"] = (y + 110) + "px";
            nombre[i].Style["Left"] = (y + 10) + "px";
            precion[i].Style["Left"] = (y + 190) + "px";
            existencia[i].Style["Left"] = (y + 300) + "px";
            porcientoLbl[i].Style["Left"] = (y + 370) + "px";
            porcientoTxt[i].Style["Left"] = (y + 430) + "px";

            string[] info = productos[i].Split('¬');
            nombre[i].Text = info[0];
            precion[i].Text = "Precio compra";
            porcientoLbl[i].Text = "Pociento";
            idarticulo[i] = info[3];
            form1.Controls.Add(cantidad[i]);
            form1.Controls.Add(nombre[i]);
            form1.Controls.Add(precion[i]);
            form1.Controls.Add(existencia[i]);
            form1.Controls.Add(porcientoTxt[i]);
            form1.Controls.Add(porcientoLbl[i]);

            cont++;
            x += 50;
            if (cont == 11)
            {
                y += 700;
                x = 100;
                cont = 0;
            }
            Console.Write(productos[i]);
        }

        Button calcular = new Button();

        calcular.Text = "Calcular";
        calcular.ID = "Calcular";
        calcular.Font.Size = FontUnit.Point(30);
        //calcular.ControlStyle.CssClass = "button";
        calcular.Click += new EventHandler(test);
        //calcular.Style["Top"] = "800px";
        //calcular.Style["Left"] = "600px";
        form1.Controls.Add(calcular);
        lblTotal.Style["Top"] = "800px";
        lblTotal.Style["Left"] = "600px";
        form1.Controls.Add(lblTotal);


        Button realizar = new Button();

        realizar.Text = "Realizar";
        realizar.ID = "Realizar";
        realizar.Font.Size = FontUnit.Point(30);
        //calcular.ControlStyle.CssClass = "button";
        realizar.Click += new EventHandler(compra);
        form1.Controls.Add(realizar);

    }

     void test(object sender, EventArgs e)
    {
        calc();
    }

     void compra(object sender, EventArgs e)
     {
         calc();
         string s = DropDownList1.SelectedValue;
         bool compra = con.realizarcompra(productosnombre, cantidadproducto,preciocompra,porciento,s);

         limpiar();
         Response.Write("<script>alert('Compra exitosa.')</script>");
     }

     void calc()
     {
         int xx = 0;
         for (int i = 0; i < productos.Length; i++)
         {
             if (!String.IsNullOrEmpty(cantidad[i].Text))
             {
                 try
                 {
                     double cant = double.Parse(cantidad[i].Text);
                     
                     double pre = double.Parse(existencia[i].Text);
                     pre *= cant;
                     suma += pre;


                 }
                 catch (Exception ex)
                 {
                     Response.Write("<script>alert('Ocurrio un error.')</script>");

                 }
                 xx++;
             }
         }

         productosnombre = new String[xx];
         cantidadproducto = new String[xx];
         preciocompra = new String[xx];
         porciento = new String[xx];
         int y = 0;
         for (int i = 0; i < productos.Length; i++)
         {
             if (!String.IsNullOrEmpty(cantidad[i].Text))
             {
                 productosnombre[y] = idarticulo[i];
                 cantidadproducto[y] = cantidad[i].Text;
                 preciocompra[y] = existencia[i].Text;
                 porciento[y] = porcientoTxt[i].Text;
                 y++;
             }

         }


         lblTotal.Text = "Total: " + suma;
     }

     void limpiar()
     {
         for (int i = 0; i < cantidad.Length; i++)
         {
             cantidad[i].Text = "";
             existencia[i].Text = "";
             porcientoTxt[i].Text = "";

         }

         lblTotal.Text = "Total";
     }
}