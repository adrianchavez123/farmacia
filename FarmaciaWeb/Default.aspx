﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 171px;
        }
        .style2
        {
            width: 312px;
        }
        #Password1
        {
            width: 233px;
        }
        #password
        {
            width: 234px;
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
    
        <div class="col-sm-4 col-sm-offset-4">
        
    <form id="form1" runat="server" class="form-horizontal">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="XX-Large" Text="Farmacia"></asp:Label>
        <br />
        <br />
        <div class="form-group">
        
        <table style="width:50%;">
            <tr>
                <td class="style1">
                    UserName</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="236px" class="form-control"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="style1">
                    Password</td>
                <td class="style2">
                    <input id="Password1" type="password"  name="password" runat="server" class="form-control"/></td>
                
            </tr>
            <tr>
                <td class="style1">
                    <asp:Button ID="iniciar" runat="server" onclick="iniciar_Click" 
                        Text="Iniciar Sesion"  class="btn btn-primary btn-lg"/>
                </td>
                
                
            </tr>
        </table>
        </div>
    </div>
        
    </form>
    </div>
    </div>
</body>
</html>
