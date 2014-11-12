<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verVentas.aspx.cs" Inherits="verVentas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap.js"> </script>
    <link href="bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-theme.css" rel="stylesheet" type="text/css" />
</head>
<body>
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
    
        <div class="col-sm-10 col-xs-offset-1">

    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" BackColor="#0066CC" Height="700px" 
            Width="1128px">
            <asp:Label ID="Label1" runat="server" Text="Detalle Ventas" Font-Size="30pt"></asp:Label>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="folio" 
                DataSourceID="SqlDataSource1" Visible="False">
                <ItemTemplate>
                    folio:
                    <asp:Label ID="folioLabel" runat="server" Text='<%# Eval("folio") %>' />
                    <br />
                    nombre:
                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                    <br />
                    precio:
                    <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                    <br />
                    cantidad:
                    <asp:Label ID="cantidadLabel" runat="server" Text='<%# Eval("cantidad") %>' />
                    <br />
                    empleado:
                    <asp:Label ID="empleadoLabel" runat="server" Text='<%# Eval("empleado") %>' />
                    <br />
                    fecha:
                    <asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Conexion %>" 
                SelectCommand="SELECT ventas.folioVenta AS folio, articulos.nombre, articulos.precioVenta AS precio, detalleVentas.cantidad, empleados.nombre AS empleado, ventas.fecha FROM detalleVentas INNER JOIN ventas ON detalleVentas.folioVenta = ventas.folioVenta INNER JOIN articulos ON detalleVentas.idArticulo = articulos.idArticulo INNER JOIN empleados ON ventas.idEmpleado = empleados.idEmpleado">
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="folio" DataSourceID="SqlDataSource1" Width="1057px" class="table table-striped">
                <Columns>
                    <asp:BoundField DataField="folio" HeaderText="folio" InsertVisible="False" 
                        ReadOnly="True" SortExpression="folio" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" 
                        SortExpression="nombre" />
                    <asp:BoundField DataField="precio" HeaderText="precio" 
                        SortExpression="precio" />
                    <asp:BoundField DataField="cantidad" HeaderText="cantidad" 
                        SortExpression="cantidad" />
                    <asp:BoundField DataField="empleado" HeaderText="empleado" 
                        SortExpression="empleado" />
                    <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
    
    </div>
    </form>
    </div>
    </div>
</body>
</html>
