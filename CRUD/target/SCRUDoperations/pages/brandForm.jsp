<%--
  Created by IntelliJ IDEA.
  User: jock2
  Date: 30.11.2018
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="${pageContext.request.contextPath}/webjars/bootstrap/3.1.0/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="/resources/css/basic.css" rel="stylesheet">

    <script src="<c:url value="${pageContext.request.contextPath}/webjars/jquery/1.9.0/jquery.min.js"  />"></script>
    <script src="<c:url value="${pageContext.request.contextPath}/webjars/bootstrap/3.1.0/js/bootstrap.js"  />"></script>

    <title>${title}</title>
</head>
<body>
<c:import url="page_components/header.jsp"></c:import>
<div class="container" >
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="text-center">
                        <h1>${action} brand <small>using ${title}</small></h1>
                    </div>
                </div>
                <div class="panel-body">
                    <form:form method="POST" modelAttribute="carBrand" class="form-horizontal">
                        <form:hidden path="idBrand"/>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">Brand name:</label>
                            <div class="col-sm-9">
                                <form:input path="name" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="foundedYear" class="col-sm-3 control-label">Founded year:</label>
                            <div class="col-sm-9">
                                <form:input path="foundedYear" class="form-control" type="number" min="1800" max="2050"  />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="headquarter" class="col-sm-3 control-label">Headquarter:</label>
                            <div class="col-sm-9">
                                <form:input path="headquarter" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


<style type="text/css">
    body {
        background-color: #43dfff;
        min-height: 100%;
        padding-top: 70px;
    }

    #index_jumbotron{
        background-color: white;
    }

    .cols .col-lg-4 {
        margin-bottom: 20px;
        text-align: center;
    }

    th{
        text-align: center;
    }

    h1 > small{
        color: white;
    }


    .sort {
        border:none;
        display:inline-block;
        color: #393939;
        text-decoration: none;
        background-color: transparent;
    }
    .sort:hover {
        text-decoration: none;
        background-color: transparent;
    }
    .sort:focus {
        outline:none;
    }
    .sort:after {
        display:inline-block;
    }
    .sort.asc:after {
        width: 0;
        height: 0;
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-top: 5px solid #393939;
        content:"";
        position: relative;
        top:4px;
        right:-5px;
    }
    .sort.desc:after {
        width: 0;
        height: 0;
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-bottom: 5px solid #393939;
        content:"";
        position: relative;
        top:-4px;
        right:-5px;
    }
</style>

