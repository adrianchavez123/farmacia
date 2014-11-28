﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Clientes.aspx.cs" Inherits="Clientes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 161px;
        }
    </style>
    <script type="text/javascript" src="jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap.js"> </script>
    <link href="bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-theme.css" rel="stylesheet" type="text/css" />

</head>
<body bgcolor="#c0c0c0">
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
            <li ><a href="Default.aspx">Iniciar sesion</a></li>
            <li class="active"><a href="Clientes.aspx">Clientes</a></li>
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
    
        <div class="col-sm-8 col-sm-offset-2">

    <form id="form1" runat="server" class="form-horizontal">
    <div>
    
        

            <asp:LinkButton ID="LinkAgregar" runat="server" onclick="LinkAgregar_Click" class="btn btn-default">Agregar</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="LinkEliminar" runat="server" onclick="LinkEliminar_Click" class="btn btn-default">Eliminar</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="LinkModificar" runat="server" onclick="LinkModificar_Click" class="btn btn-default">Modificar</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="LinkBuscar" runat="server" onclick="LinkBuscar_Click" class="btn btn-default">Buscar</asp:LinkButton>

        <asp:Panel ID="Panel1" runat="server" Height="351px" Width="441px" 
            BackColor="#6699FF">
            
            <p></p>
            <p>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Agregar Cliente"></asp:Label>
            </p>
            <table style="width: 54%; height: 284px;">
                <tr>
                    <td class="style1">
                        Nombre</td>
                    <td>
                        <asp:TextBox ID="textBoxNombre" runat="server" Width="242px" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Domicilio</td>
                    <td>
                        <asp:TextBox ID="textBoxDomicilio" runat="server" Width="240px" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Colonia</td>
                    <td>
                        <asp:TextBox ID="textBoxColonia" runat="server" Width="240px" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td  class="style1">
                        Telefono</td>
                    <td>
                        <asp:TextBox ID="textBoxTelefono" runat="server" Width="240px" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Celular</td>
                    <td>
                        <asp:TextBox ID="textBoxCelular" runat="server" Width="240px" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Email</td>
                    <td>
                        <asp:TextBox ID="textBoxEmail" runat="server" Width="240px" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Codigo Postal</td>
                    <td>
                        <asp:TextBox ID="textBoxCp" runat="server" Width="240px" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Municipio</td>
                    <td>
                        <asp:TextBox ID="textBoxMunicipio" runat="server" Width="240px" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Estado</td>
                    <td>
                        <asp:TextBox ID="textBoxEstado" runat="server" Width="240px" class="form-control"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                <td><asp:Button ID="ButtonRegistrar" runat="server" onclick="Button1_Click" 
                            Text="Registrar" class="btn btn-success"/>
                </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    <p>
        &nbsp;</p>
    <asp:Panel ID="panelEliminar" runat="server" BackColor="#3333FF" Height="167px" 
        Width="441px">
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" 
            Text="Eliminar Cliente"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="idCliente" class="form-control">
        </asp:DropDownList>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="idCliente" 
            DataSourceID="SqlDataSource2" Visible="False">
            <ItemTemplate>
                idCliente:
                <asp:Label ID="idClienteLabel" runat="server" Text='<%# Eval("idCliente") %>' />
                <br />
                nombre:
                <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Conexion %>" 
            
            SelectCommand="SELECT [idCliente], [nombre] FROM [clientes] WHERE ([activo] = @activo)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="ButtonEliminar" runat="server" onclick="ButtonEliminar_Click" 
            Text="Eliminar" class="btn btn-danger"/>
       
    </asp:Panel>
     <asp:Panel ID="panelMostrar" runat="server" BackColor="#009999" Height="734px" 
            Width="755px">
            <p>
            </p>
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" 
                Text="Registros"></asp:Label>
            <br />
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSourceMostrar" 
                Visible="False">
                <ItemTemplate>
                    nombre:
                    <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                    <br />
                    domicilio:
                    <asp:Label ID="domicilioLabel" runat="server" Text='<%# Eval("domicilio") %>' />
                    <br />
                    colonia:
                    <asp:Label ID="coloniaLabel" runat="server" Text='<%# Eval("colonia") %>' />
                    <br />
                    telefono:
                    <asp:Label ID="telefonoLabel" runat="server" Text='<%# Eval("telefono") %>' />
                    <br />
                    celular:
                    <asp:Label ID="celularLabel" runat="server" Text='<%# Eval("celular") %>' />
                    <br />
                    email:
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    <br />
                    cp:
                    <asp:Label ID="cpLabel" runat="server" Text='<%# Eval("cp") %>' />
                    <br />
                    municipio:
                    <asp:Label ID="municipioLabel" runat="server" Text='<%# Eval("municipio") %>' />
                    <br />
                    estado:
                    <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSourceMostrar" Width="636px" class="table table-striped">
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="nombre" 
                        SortExpression="nombre" />
                    <asp:BoundField DataField="domicilio" HeaderText="domicilio" 
                        SortExpression="domicilio" />
                    <asp:BoundField DataField="colonia" HeaderText="colonia" 
                        SortExpression="colonia" />
                    <asp:BoundField DataField="telefono" HeaderText="telefono" 
                        SortExpression="telefono" />
                    <asp:BoundField DataField="celular" HeaderText="celular" 
                        SortExpression="celular" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="cp" HeaderText="cp" SortExpression="cp" />
                    <asp:BoundField DataField="municipio" HeaderText="municipio" 
                        SortExpression="municipio" />
                    <asp:BoundField DataField="estado" HeaderText="estado" 
                        SortExpression="estado" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceMostrar" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Conexion %>" 
                SelectCommand="SELECT [nombre], [domicilio], [colonia], [telefono], [celular], [email], [cp], [municipio], [estado] FROM [clientes] WHERE ([activo] = @activo)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="activo" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    
    <asp:Panel ID="PanelModificar" runat="server" BackColor="#9999FF" 
        Height="385px" Width="674px">
        <p></p>
        <p>
            
        </p>

        <table style="width: 54%; height: 284px;">
            
            <tr>
                <td class="style1">
                   Nombre</td>
                <td>
                   <asp:DropDownList ID="DropDownList2" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="idCliente" 
                        AutoPostBack="True" onselectedindexchanged="DropDownList2_SelectedIndexChanged" class="form-control">
            </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Domicilio</td>
                <td>
                    <asp:TextBox ID="textBoxDomicilioModif" runat="server" Width="240px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Colonia</td>
                <td>
                    <asp:TextBox ID="textBoxColoniaModif" runat="server" Width="240px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td  class="style1">
                    Telefono</td>
                <td>
                    <asp:TextBox ID="textBoxTelefonoModif" runat="server" Width="240px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Celular</td>
                <td>
                    <asp:TextBox ID="textBoxCelularModif" runat="server" Width="240px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Email</td>
                <td>
                    <asp:TextBox ID="textBoxEmailModif" runat="server" Width="240px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Codigo Postal</td>
                <td>
                    <asp:TextBox ID="textBoxCpModif" runat="server" Width="240px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Municipio</td>
                <td>
                    <asp:TextBox ID="textBoxMunicipioModif" runat="server" Width="240px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Estado</td>
                <td>
                    <asp:TextBox ID="textBoxEstado0" runat="server" Width="240px" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ButtonModificar" runat="server"  
                        Text="Modificar" onclick="ButtonModificar_Click" class="btn btn-warning"/>
                </td>
            </tr>
        </table>

    </asp:Panel>
    </form>
    </div>
    </div>
    <p>
        &nbsp;</p>
</body>
</html>
