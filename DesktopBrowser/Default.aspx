﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="DesktopBrowser.Default" CodeBehind="~/Default.aspx.cs" %>

<%@ OutputCache Duration="20" VaryByParam="*" %>
<%Response.BufferOutput = false; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <link href="res/bootstrap-3.1.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="res/bootstrap-3.1.0/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="res/Site.css" rel="stylesheet" type="text/css" />
    <title><%=file.Name%> - Desktop Browser v0.95</title>
    <script>var Data = {};</script>
</head>
<body>
    <%if (!file.IsFolder)
        { %>
    <script>window.setTimeout(function () { window.close(); }, 3);</script>
    <%}
      else{%>
    <uc:NavBar runat="server" />
    <div>
    <div class="Panel row row-full">
        <div class="col-md-12">
        <input type="text" id="tbFilename" value="<%=file.Name %>" readonly />
            </div>
    </div>
    <form method="get" action="Default.aspx" class="form-horizontal">
    <div class="form-group row-full">
        <div class="col-md-11"><input class="form-control"  type="text" id="tbFolder" value="<%=req.Path.ToHtmlAttributeValue() %>" onkeydown="tbFolder_keydown(event);" name="p" /></div>
        <div class="col-md-1"><input class="form-control btn btn-default"  type="submit" value="Go" /></div>
    </div>
    <%if (req.KeepView)
      {
          foreach (var pair in req.Serialize().Where(t => t.Key != "p"))
          {
    %>
    <input type="hidden" name="<%=pair.Key %>" value="<%=pair.Value.ToHtmlAttributeValue() %>" />
    <%}
      } %>
    </form>
    <div class="Panel">
        <uc:FilesGrid ID="FilesGrid1" runat="server" />
    </div>
    <%if (req.View == "ImageList")
      { %>
    <div class="Panel">
        <uc:FilesImageList ID="FilesImageList1" runat="server" />
    </div>
    <%}%>
    <%} %>
    <div class="Footer">
        <p><a href="http://desktopbrowser.googlecode.com" target="_blank">DesktopBrowser</a> by Dan-el (Copyright &copy; all rights reserved 2011)</p>
        <p><a href="http://code.google.com/p/desktopbrowser/downloads/list?can=3">Check for new version</a></p>
    </div>
    </div>
    <script src="res/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="res/bootstrap-3.1.0/js/bootstrap.min.js"></script>
    <script src="res/all.js" type="text/javascript"></script>
    <script>        $(DefaultClient_Load);</script>
</body>
</html>
