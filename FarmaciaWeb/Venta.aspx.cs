using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

public partial class Venta : System.Web.UI.Page
{
    Conexion con;
    String []productos;
    TextBox []cantidad;
    Label[] nombre,precion,existencia;
    string[] idarticulo;
    double suma = 0;
    Label lblTotal = new Label();
    string[] productosnombre;
    string[] cantidadproducto;
    string[] precioproducto;
    string[] nombreArticulo;
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
        existencia = new Label[productos.Length];
        idarticulo = new String[productos.Length];

        lblTotal.Text = "Total :";
        lblTotal.ID = "Total";
        lblTotal.Font.Size = FontUnit.Point(30);

        int x = 100;
        int y = 0;
        int cont = 0;
        for (int i = 0; i < productos.Length; i++)
        {
            cantidad[i] = new TextBox();
            nombre[i] = new Label();
            precion[i] = new Label();
            existencia[i] = new Label();
            
            cantidad[i].ID = "TextBox" + (i + 1);
            nombre[i].ID = "Nombre" + (i + 1);
            precion[i].ID = "Precio" + (i + 1);
            existencia[i].ID = "Existencia" + (i + 1);
            cantidad[i].Style["Position"] = "Absolute";
            existencia[i].Style["Position"] = "Absolute";
            precion[i].Style["Position"] = "Absolute";
            nombre[i].Style["Position"] = "Absolute";

            cantidad[i].Style["Top"] = x + "px";
            nombre[i].Style["Top"] = x + "px";
            precion[i].Style["Top"] = x + "px";
            existencia[i].Style["Top"] = x + "px";

            cantidad[i].Width = 60;
            cantidad[i].Style["Left"] = (y+130)+"px";
            nombre[i].Style["Left"] = (y+30)+"px";
            precion[i].Style["Left"] = (y+220)+"px";
            existencia[i].Style["Left"] = (y+320)+"px";
            string[] info = productos[i].Split('¬');
            nombre[i].Text = info[0];
            existencia[i].Text = "Existencia "+info[1];
            precion[i].Text = "Precio "+ info[2];
            idarticulo[i] = info[3];
            form1.Controls.Add(cantidad[i]);
            form1.Controls.Add(nombre[i]);
            form1.Controls.Add(precion[i]);
            form1.Controls.Add(existencia[i]);

            cont++;
            x += 50;
            if (cont == 11)
            {
                y += 500;
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
        realizar.Click += new EventHandler(venta);
        form1.Controls.Add(realizar);
    }

    void test(object sender, EventArgs e)
    {
        calc();
    }

    void venta(object sender, EventArgs e)
    {
        calc();
        

        String id = (String)Session["id"];

        bool venta = con.realizarventa(productosnombre, cantidadproducto, id);

        generarPdf();
        descargar();
        limpiar();
        Response.Write("<script>alert('Venta exitosa.')</script>");
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
                    string[] x = precion[i].Text.Split(' ');
                    double pre = double.Parse(x[1]);
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
        precioproducto = new String[xx];
        nombreArticulo = new String[xx];
        int y = 0;
        for (int i = 0; i < productos.Length; i++)
        {
            if (!String.IsNullOrEmpty(cantidad[i].Text))
            {
                productosnombre[y] = idarticulo[i];
                cantidadproducto[y] = cantidad[i].Text;
                precioproducto[y] = precion[i].Text;
                nombreArticulo[y] = nombre[i].Text;
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
        }

        lblTotal.Text = "Total";
    }

    void generarPdf()
    {
        
        Document doc = new Document(new Rectangle(200f, 500f));
        PdfWriter.GetInstance(doc, new FileStream(Server.MapPath("ticket") + "\\ticket.pdf", FileMode.Create));
        doc.Open();
        iTextSharp.text.Font _Font = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 12, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);

        iTextSharp.text.Font _standardFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);

        doc.Add(new Paragraph("Farmacia",_Font));
        doc.Add(new Paragraph("Mi domicilio",_standardFont));
        doc.Add(new Paragraph("Uruapan", _standardFont));
        doc.Add(new Paragraph("Michoacan", _standardFont));
        doc.Add(new Paragraph("Telefono", _standardFont));
        doc.Add(new Paragraph("cp 60133", _standardFont));
        doc.Add(Chunk.NEWLINE);
        PdfPTable tblPrueba = new PdfPTable(3);
        tblPrueba.WidthPercentage = 100;

        // Configuramos el título de las columnas de la tabla
        PdfPCell clNombre = new PdfPCell(new Phrase("Articulo", _standardFont));
        clNombre.BorderWidth = 0;
        clNombre.BorderWidthBottom = 0.75f;

        PdfPCell clApellido = new PdfPCell(new Phrase("Precio", _standardFont));
        clApellido.BorderWidth = 0;
        clApellido.BorderWidthBottom = 0.75f;

        PdfPCell clPais = new PdfPCell(new Phrase("Cantidad", _standardFont));
        clPais.BorderWidth = 0;
        clPais.BorderWidthBottom = 0.75f;

        tblPrueba.AddCell(clNombre);
        tblPrueba.AddCell(clApellido);
        tblPrueba.AddCell(clPais);

        for (int i = 0; i < productosnombre.Length; i++)
        {
            clNombre = new PdfPCell(new Phrase(nombreArticulo[i], _standardFont));
            clNombre.BorderWidth = 0;

            clApellido = new PdfPCell(new Phrase(precioproducto[i], _standardFont));
            clApellido.BorderWidth = 0;

            clPais = new PdfPCell(new Phrase(cantidadproducto[i], _standardFont));
            clPais.BorderWidth = 0;

            
            tblPrueba.AddCell(clNombre);
            tblPrueba.AddCell(clApellido);
            tblPrueba.AddCell(clPais);
        }
        doc.Add(tblPrueba);
        doc.Add(Chunk.NEWLINE);
        doc.Add(new Paragraph(lblTotal.Text, _Font));
        
        doc.Close();
    }

    void descargar()
    {
        string nombre = "ticket.pdf";
        string ruta = "ticket/";
        Response.Clear();
        Response.ContentType = "application/pdf";
        Response.AddHeader("Content-Disposition", "attachment; filename=" + nombre);
        Response.WriteFile(ruta + nombre);
        Response.End();
    }
}