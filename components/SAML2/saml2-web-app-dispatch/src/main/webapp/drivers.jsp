<!--
~ Copyright (c) WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
~
~ WSO2 Inc. licenses this file to you under the Apache License,
~ Version 2.0 (the "License"); you may not use this file except
~ in compliance with the License.
~ You may obtain a copy of the License at
~
~    http://www.apache.org/licenses/LICENSE-2.0
~
~ Unless required by applicable law or agreed to in writing,
~ software distributed under the License is distributed on an
~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
~ KIND, either express or implied.  See the License for the
~ specific language governing permissions and limitations
~ under the License.
-->
<%@ page import="org.wso2.carbon.identity.sso.agent.bean.LoggedInSessionBean" %>
<%@ page import="org.wso2.carbon.identity.sso.agent.util.SSOAgentConstants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Stylish Portfolio - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
          rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<%
    String subjectId = null;

    final String SAML_SSO_URL = "samlsso";
    final String SAML_LOGOUT_URL = "logout";

    // if web-browser session is there but no session bean set,
    // invalidate session and direct back to login page
    if (request.getSession(false) != null
            && request.getSession(false).getAttribute(SSOAgentConstants.SESSION_BEAN_NAME) == null) {
        request.getSession().invalidate();
%>
<script type="text/javascript">
    location.href = <%=SAML_SSO_URL%>;
</script>
<%
        return;
    }
    LoggedInSessionBean sessionBean = (LoggedInSessionBean) session.getAttribute(SSOAgentConstants.SESSION_BEAN_NAME);

    if (sessionBean != null && sessionBean.getSAML2SSO() != null) {
        subjectId = sessionBean.getSAML2SSO().getSubjectId();
    } else {
%>
<script type="text/javascript">
    location.href = <%=SAML_SSO_URL%>;
</script>
<%
        return;
    }
%>

<body class="swift">

<nav id="top" class="navbar navbar-inverse navbar-custom-swift">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="img/logo.png" height="30"/> Swift</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <!--<li><button class="btn btn-dark custom-primary-swift btn-login"><strong>Login</strong></button></li>-->
                <li class="dropdown user-name">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img class="img-circle" height="30" width=30" src="img/Admin-icon.jpg"> <span
                            class="user-name"><%=subjectId%>@pickup.com <i class="fa fa-chevron-down"></i></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href=<%=SAML_LOGOUT_URL%>>Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- About -->
<section id="about" class="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2><strong>PickUp Swift</strong></h2>
                <p class="lead">Management Application</p>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->
</section>
<div class="container">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1 bhoechie-tab-container">
            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-3 bhoechie-tab-menu">
                <div class="list-group">
                    <a href="overview.jsp" class="list-group-item text-center">
                        <h4 class="fa fa-desktop"></h4><br/>Overview
                    </a>
                    <a href="drivers.jsp" class="list-group-item active text-center">
                        <h4 class="fa fa-users"></h4><br/>Drivers
                    </a>
                    <a href="vehicles.jsp" class="list-group-item text-center">
                        <h4 class="fa fa-cab"></h4><br/>Vehicles
                    </a>
                    <a href="bookings.jsp" class="list-group-item text-center">
                        <h4 class="fa fa-book"></h4><br/>Bookings
                    </a>
                    <a href="finance.jsp" class="list-group-item text-center">
                        <h4 class="fa fa-money"></h4><br/>Finance
                    </a>
                </div>
            </div>
            <div class="col-lg-11 col-md-11 col-sm-11 col-xs-9 bhoechie-tab">
                <!-- Drivers section -->
                <div class="bhoechie-tab-content active">
                    <h4 class="text-left"><strong>Drivers</strong></h4>
                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Driver ID</th>
                                <th>Name</th>
                                <th>Age</th>
                                <th>Registration date</th>
                                <th>Salary</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>0023</td>
                                <td>Tiger Nixon</td>
                                <td>40</td>
                                <td>2011/04/25</td>
                                <td>$120,800</td>
                                <td><i class="fa fa-trash"></i></td>
                            </tr>
                            <tr>
                                <td>0056</td>
                                <td>Garrett Winters</td>
                                <td>63</td>
                                <td>2011/07/25</td>
                                <td>$170,750</td>
                                <td><i class="fa fa-trash"></i></td>
                            </tr>
                            <tr>
                                <td>0012</td>
                                <td>Ashton Cox</td>
                                <td>23</td>
                                <td>2009/01/12</td>
                                <td>$86,000</td>
                                <td><i class="fa fa-trash"></i></td>
                            </tr>
                            <tr>
                                <td>0087</td>
                                <td>Cedric Kelly</td>
                                <td>22</td>
                                <td>2012/03/29</td>
                                <td>$133,060</td>
                                <td><i class="fa fa-trash"></i></td>
                            </tr>
                            <tr>
                                <td>0045</td>
                                <td>Airi Satou</td>
                                <td>33</td>
                                <td>2008/11/28</td>
                                <td>$162,700</td>
                                <td><i class="fa fa-trash"></i></td>
                            </tr>
                            <tr>
                                <td>0046</td>
                                <td>Brielle Williamson</td>
                                <td>34</td>
                                <td>2012/12/02</td>
                                <td>$172,000</td>
                                <td><i class="fa fa-trash"></i></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class=" add-padding-bottom-3x">
                        <a href="javascript:;" class="btn btn-default"><i class="fa fa-plus"></i> Add</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <a href="http://wso2.com/" target="_blank"><img src="img/wso2logo.svg" height="20"/></a>
                <p>Copyright &copy; <a href="http://wso2.com/" target="_blank">WSO2</a> 2017</p>
            </div>
        </div>
    </div>
</footer>


<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>