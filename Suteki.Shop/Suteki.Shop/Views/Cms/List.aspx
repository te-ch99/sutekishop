﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CmsSubMenu.master" Inherits="Suteki.Shop.ViewPage<CmsViewData>" %>
<%@ Import Namespace="Suteki.Common.Repositories"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

<h1><%= ViewData.Model.Menu.Name%></h1>
<div class="message"><%= TempData["message"] %></div>
<p>
    <%= Html.ActionLink<CmsController>(c => c.Add(ViewData.Model.Menu.ContentId), "New Page")%>&nbsp;
    <%= Html.ActionLink<MenuController>(c => c.New(ViewData.Model.Menu.ContentId), "New Menu")%>
</p>

<table>
    <tr>
        <th class="thin">&nbsp;</th>
        <th class="thin">&nbsp;</th>
        <th class="thin">&nbsp;</th>
        <th class="thin">&nbsp;</th>
        <th class="thin">&nbsp;</th>
        <th class="thin">&nbsp;</th>
        <th class="thin">&nbsp;</th>
    </tr>
<% foreach (var content in ViewData.Model.Menu.Contents.InOrder())
   { %>
    <tr>
        <td><%= content.Type %></td>
        <td><%= content.Link(Html) %></td>
        <td><%= content.EditLink(Html) %></td>
        <td><%= Html.Tick(content.IsActive) %></td>
        <td>
            <%= Html.UpArrowLink<CmsController>(c => c.MoveUp(content.ContentId)) %>
            &nbsp;<%= Html.DownArrowLink<CmsController>(c => c.MoveDown(content.ContentId))%>
        </td>
        
        <% if (content.IsMenu) { %>
            <td><%= Html.ActionLink<CmsController>(c => c.Add(content.ContentId), "New Page") %></td>
            <td><%= Html.ActionLink<MenuController>(c => c.New(content.ContentId), "New Menu")%></td>
        <% } else { %>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        <% } %>
    </tr>
<% } %>
</table>

</asp:Content>
