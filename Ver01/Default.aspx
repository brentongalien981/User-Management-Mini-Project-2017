<%@ Page Title="Default.aspx" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        h2 {
            color: red;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Default.aspx</h2>
    <p>
        Hello there Kate :)
    </p>

    <h1>Company News</h1>
    <p>We'll add some news later.</p>
    <h1>Company Events</h1>
    <p>We'll add company events later.</p>
</asp:Content>

