<%@page import="aiwa.model.MainModel"%>
<%@page import="aiwa.entity.Main"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DetailView</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: lightblue;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <button class="btn btn-primary mb-3" onclick="window.history.length > 1 ? history.back() : window.location.href='defaultPage.jsp'">
                <i class="bi bi-skip-backward-circle"></i> 戻る
            </button>
        </div>
    </div>
    <%
        String mainid = request.getParameter("mainid");
        Main m = null;
        try {
            if (mainid != null) {
                MainModel mm = new MainModel();
                m = mm.findById(getServletContext(), Integer.parseInt(mainid));
            }
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Invalid or missing ID</div>");
        }

        if (m != null) {
    %>
           
       
        
            <h2>No: <%= m.getMainId() %></h2>
            <h2>Name: <%= m.getMainName() %></h2>
            <h2>Detail: <%= m.getDetail() %></h2>
             <img class="img-fluid" src="<%= m.getImage() %>" alt="<%= m.getMainName() %>">
        
    <% } else { %>
    <div class="alert alert-warning">No data found for the given ID</div>
    <% } %>
</div>
</body>
</html>
