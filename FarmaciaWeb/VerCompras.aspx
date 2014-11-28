<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerCompras.aspx.cs" Inherits="VerCompras" %>

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
    
        <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF" Font-Size="30pt" 
            Height="562px" Width="1094px">
            <asp:Label ID="Label1" runat="server" Text="Detalle compras"></asp:Label>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="folioCompra" 
                DataSourceID="SqlDataSource1" Visible="False">
                <ItemTemplate>
                    folioCompra:
                    <asp:Label ID="folioCompraLabel" runat="server" 
                        Text='<%# Eval("folioCompra") %>' />
                    <br />
                    nombreProveedor:
                    <asp:Label ID="nombreProveedorLabel" runat="server" 
                        Text='<%# Eval("nombreProveedor") %>' />
                    <br />
                    rfc:
                    <asp:Label ID="rfcLabel" runat="server" Text='<%# Eval("rfc") %>' />
                    <br />
                    articulo:
                    <asp:Label ID="articuloLabel" runat="server" Text='<%# Eval("articulo") %>' />
                    <br />
                    cantidad:
                    <asp:Label ID="cantidadLabel" runat="server" Text='<%# Eval("cantidad") %>' />
                    <br />
                    porcientoGanancia:
                    <asp:Label ID="porcientoGananciaLabel" runat="server" 
                        Text='<%# Eval("porcientoGanancia") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="folioCompra" DataSourceID="SqlDataSource1" Font-Size="15pt" 
                Width="1038px" class="table table-striped">
                <Columns>
                    <asp:BoundField DataField="folioCompra" HeaderText="folioCompra" 
                        InsertVisible="False" ReadOnly="True" SortExpression="folioCompra" />
                    <asp:BoundField DataField="nombreProveedor" HeaderText="nombreProveedor" 
                        SortExpression="nombreProveedor" />
                    <asp:BoundField DataField="rfc" HeaderText="rfc" SortExpression="rfc" />
                    <asp:BoundField DataField="articulo" HeaderText="articulo" 
                        SortExpression="articulo" />
                    <asp:BoundField DataField="cantidad" HeaderText="cantidad" 
                        SortExpression="cantidad" />
                    <asp:BoundField DataField="porcientoGanancia" HeaderText="porcientoGanancia" 
                        SortExpression="porcientoGanancia" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Conexion %>" 
                SelectCommand="SELECT compras.folioCompra, proveedores.nombre AS nombreProveedor, proveedores.rfc, articulos.nombre AS articulo, compras.cantidad, compras.porcientoGanancia FROM compras INNER JOIN proveedores ON compras.idProveedor = proveedores.idProveedor INNER JOIN articulos ON compras.idArticulo = articulos.idArticulo">
            </asp:SqlDataSource>
        </asp:Panel>
    
    </div>
    </form>
    </div>
    </div>
</body>
</html>
