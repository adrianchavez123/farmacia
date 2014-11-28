<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Venta.aspx.cs" Inherits="Venta" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap.js"> </script>
    <link href="bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-theme.css" rel="stylesheet" type="text/css" />
</head>
<body style="height: 744px">
<div class="navbar-wrapper">
  <div class="container">
    <div class="navbar navbar-inverse navbar-fixed-top">
      
        <div class="navbar-header">
	    <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </a>
        <a class="navbar-brand" href="#">Farmacia</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="Default.aspx">Iniciar sesion</a></li>
            <li><a href="Clientes.aspx">Clientes</a></li>
            <li><a href="Proveedores.aspx">Proveedores</a></li>
            <li><a href="Empleados.aspx">Empleados</a></li>
            <li><a href="Articulos.aspx">Articulos</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Ventas <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="Venta.aspx">Ventas</a></li>
                <li><a href="verVentas.aspx">Detalles Ventas</a></li>
                
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Compras <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="Compra.aspx">Compras</a></li>
                <li><a href="VerCompras.aspx">Detalles Compras</a></li>
              
              </ul>
            </li>
            <li><a href="CerrarSesion.aspx">Cerrar Sesión</a>
            </li> 
          </ul>
        </div>

    </div>
  </div><!-- /container -->
</div><!-- /navbar wrapper -->
    <br />
    <br />
    <br />
    <br />
     <div class="row">
    
        <div class="col-sm-10 col-sm-offset-1">
   

    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:Panel ID="Panel1" runat="server" BackColor="#6699FF" Height="640px" 
        Width="1088px">
        <asp:Label ID="ventas" runat="server" Text="Ventas" Font-Bold="True" 
            Font-Size="30pt"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Producto"></asp:Label>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="idArticulo" 
            DataSourceID="SqlDataSource1" Visible="False">
            <ItemTemplate>
                idArticulo:
                <asp:Label ID="idArticuloLabel" runat="server" 
                    Text='<%# Eval("idArticulo") %>' />
                <br />
                nombre:
                <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="nombre" 
            DataValueField="idArticulo">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Conexion %>" 
            SelectCommand="SELECT [idArticulo], [nombre] FROM [articulos]">
        </asp:SqlDataSource>
        <asp:Label Text="Cantidad" runat="server"/>
        <input type="text" id="cantidad" name="cantidad" value="1" class=""/>
       <input id="Agregar" class="btn btn-lg btn-primary"type="button" value="Agregar Producto" />
        <table id="kart" class="table table-striped table-condensed"style="width:100%;">
            <tr>
                <th>Producto</th>
                <th>Precio Unitario</th>
                <th>cantidad</th>
            </tr>
           
           
            
        </table>
        <h1 id="total">Total:
        </h1><input id="ok" class="btn btn-lg btn-success"type="button" value="Realizar Venta" />
        <asp:Button class="btn btn-lg btn-warning" ID="Button1" runat="server" 
            onclick="Button1_Click" Text="Descargar" />
    </asp:Panel>
    </form>
    </div>
    </div>
</body>
</html>

<script language="javascript">


    $(document).ready(function () {
        $("#Agregar").click(function () {
            //alert('entro');
            producto = $("#DropDownList1").val();
            cantidad = $("#cantidad").val();
            $.ajax({
                type: "POST",
                url: "Venta.aspx/getProducto",
                data: "{producto:" + producto + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {

                    string = msg.d.split('¬');
                    yaEsta = false;

                    $('#kart tr').each(function () {
                        var prod = $(this).find("td:first").html();
                        if (prod == string[1]) {

                            var can = $(this).find("td:nth-child(3)").html();
                            console.log(can + " +" + cantidad);

                            $(this).find("td:nth-child(3)").text(parseInt(can) + parseInt(cantidad));
                            yaEsta = true;
                        }
                    });
                    if (!yaEsta) {
                        $("#kart").append('<tr><td>' + string[1] + '</td><td>' + string[0] + '</td><td>' + cantidad + '</td></tr>');
                    }
                    console.log(msg);
                    calcular();
                    //alert(msg.d);
                }
            });
        });

        $('#ok').click(function () {

            j = 0;
            $('#kart tr').each(function () {
                j++;
            });
            i = 0;
            arregloProductos = new Array(j - 1);
            arregloPrecio = new Array(j - 1);
            arregloCantidad = new Array(j - 1);

            $('#kart tr').each(function () {

                if (i > 0) {
                    var prod = $(this).find("td:nth-child(1)").html();
                    var p = $(this).find("td:nth-child(2)").html();
                    var c = $(this).find("td:nth-child(3)").html();
                    arregloProductos[i - 1] = prod;
                    arregloPrecio[i - 1] = p;
                    arregloCantidad[i - 1] = c;
                    console.log(arregloProductos[i - 1] + "  " + arregloCantidad[i - 1]);

                }
                i++;
            });

            /*$.post("Venta.aspx/crearVenta", { data: arregloProductos }, function (data) {
            console.log(data);
            });*/
            var myarray = [1, 2, 3, 4, 5];
            $.ajax({
                type: "POST",
                url: "Venta.aspx/crearVenta",
                //data: '{"data":"' + myarray + '" }',
                data: '{"arregloProductos":"' + arregloProductos + '","arregloPrecio" :"'+arregloPrecio+'","arregloCantidad" : "'+arregloCantidad+'" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {


                    alert(msg.d);
                }
            });
        });

        function calcular() {
            total = 0;
            i = 0;
            $('#kart tr').each(function () {

                if (i > 0) {
                    var p = $(this).find("td:nth-child(2)").html();
                    var c = $(this).find("td:nth-child(3)").html();

                    temp = parseFloat(p) * parseFloat(c);
                    console.log(p + "  + " + c + "  =" + temp);
                    total += temp;
                }
                i++;
            });

            $('#total').text("Total: " + total);
        }

    });  
  </script>
