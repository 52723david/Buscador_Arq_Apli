<!DOCTYPE HTML>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Buscador</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <!-- Bootstrap Core CSS -->
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <!-- Custom CSS -->
        <link href="css/landing-page.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
        <script src=â€//connect.facebook.net/en_US/all.jsâ€></script>
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="js/facebook.js" type="text/javascript"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- ========================   BUSCARDOR   =======================================-->
        <script>
            function buscar() {
                var qtext = document.getElementById("busc").value;
                //var ftest=document.getElementById("facet").value;
                //var numReg=document.getElementById("numRes").value;
                var urlquery = "http://j4loxa.com/serendipity/plan/browse";
                var para1 = "q=" + qtext;
                var para2 = "";
                var para3 = "wt=json";
                var para4 = "rows=10000";
                urlquery = urlquery + "?" + para1 + "&" + para3 + "&" + para4;
                //alert(urlquery);
                $.ajax({
                    type: "GET",
                    url: urlquery,
                    dataType: "json",
                    success: function (data) {
                        //var divresult = document.getElementById("resuldata");
                        //divresult.innerHTML = data;
                        var contenido="<h6>Resultados de busqueda: "+data.response["numFound"]+"</h6><br><h6>Tiempo que tard� la busqueda: "+data.responseHeader["QTime"]+"mseg</h6>";
                        var contenido1=data.response.docs;
                        for (i in contenido1) {
                            //contenido+=contenido1[i]["title"]+"<br>";
                            contenido+="<br><br>";
                            contenido+="<div class='cuadro'>";
                                contenido+="<table id='tabla'>";
                                    contenido+="<tr>";
                                        contenido+="<th><h3><img src='img/pdf.png' WIDTH='90' HEIGHT='60'></h3></th>";
                                        contenido+="<td><h2>"+contenido1[i]["title"]+"</h2></td>";
                                    contenido+="</tr>";
                                    contenido+="<tr>";
                                        contenido+="<th><h5>Tipo</h5></th>";
                                        contenido+="<td><h6>"+contenido1[i]["content_type"]+"</h6></td>";
                                    contenido+="</tr>";
                                    contenido+="<tr>";
                                        contenido+="<th><h5>Autor</h5></th>";
                                        contenido+="<td><h6>"+contenido1[i]["author"]+"</h6></td>";
                                    contenido+="</tr>";
                                    contenido+="<tr>";
                                        contenido+="<th><h5>Id</h5></th>";
                                        contenido+="<td><h6>"+contenido1[i]["id"]+"</h6></td>";
                                    contenido+="</tr>";
                                    contenido+="<tr>";
                                        contenido+="<th><h5></h5></th>";
                                        contenido+="<td><h6><a href='#'>a�adir a fovoritos</a></h6></td>";
                                    contenido+="</tr>";
                                    contenido+="<tr>";
                                        contenido+="<th><h5>Palabras Clave</h5></th>";
                                        contenido+="<td><h6>"+" - "+contenido1[i]["keywords"]+"</h6></td>";
                                    contenido+="</tr>";
                                contenido+="</table>";
                            contenido+="</div>";
                        }
                        $("#resuldata").html(contenido);
                    }
                });
            }
        </script>
        <script>
            function buscarpdf() {
                //var qtext = document.getElementById("busc").value;
                //var ftest=document.getElementById("facet").value;
                //var numReg=document.getElementById("numRes").value;
                var urlquery = "http://j4loxa.com/serendipity/plan/browse?qf=content_type:%20application/pdf&wt=json&rows=10000";
                //var para1 = "q=facet";
                //para2="fq=author_s:"+Ramiro+"%20"+Leonardo+"%20"+Ramirez+"%20"+Coronel;
                //var para2 = "fq=author_s: 'Ramiro Leonardo Ramirez Coronel'";
                //var para3 = "jwt=json";
                //var para4 = "rows=10000";
                //urlquery = urlquery + "?" + para2 + para3 + "&" + para4;
                //alert(urlquery);
                $.ajax({
                    type: "GET",
                    url: urlquery,
                    dataType: "json",
                    success: function (data) {
                        //var divresult = document.getElementById("resuldata");
                        //divresult.innerHTML = data;
                        var contenido="";
                        var contenido1=data.facet_counts.facet_fields;
                        for (i in contenido1){
                            contenido+="<br><br>";
                            contenido+="<div class='cuadro'>";
                                contenido+="<table>";
                                    contenido+="<tr>";
                                        contenido+="<th><h5>Tipo</h5></th>";
                                        contenido+="<td><h6>"+contenido1[i]["content_type"]+"</h6></td>";
                                    contenido+="</tr>";
                                contenido+="</table>";
                            contenido+="</div>";
                        }
                    }
                });
            }
        </script>
        <script>
            window.onload = function () {
                /* Comprueba el estado del usuario, incluye esta funciÃ³n en todas la pÃ¡ginas donde el usuario 
                 deba estar conectado */
                getStateFromUser();
            }
        </script>
    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation" id="nav">
            <div class="container topnav">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div id="status"></div>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="buscador2.jsp">Home</a>
                        </li>
                        <li>
                            <a href="#services">Servicios</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Autores <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li class="dropdown-header">Nav header</li>
                                <li><a href="#">Separated link</a></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Tipos <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><button onclick="buscarpdf()" type="button">Documentos pdf</button></li>
                            </ul>
                        </li>
                        <li>
                            <button type="button" onclick="FBBtnLogout()" id="boton">Cerrar sesi�n</button>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Header -->
        <a name="about"></a>
        <div class="intro-header">
            <div class="container" id="contenedor">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="intro-message">

                            <!-- ===========================================================================-->
                            <h1>Arquitectura de Aplicaciones</h1>
                            <h3>Escuela de Ciencias de la Computaci�n</h3>
                            <hr class="intro-divider">
                            <center>
                                <!--<div class="col-lg-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Buscar</button>
                                        </span>
                                    </div>
                                </div>-->
                                <div class="input-group">
                                    <label for="busc"></label>
                                    <input  id="busc" class="form-control" type="text" name="busc" placeholder="Ingrese busqueda" required title="Cadena de busqueda">      
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button" id="buscar" onclick="buscar()">Buscar</button>
                                    </span>
                                    <!--
                                    <label for="facet">Faceta:</label><br>
                                    <input id="facet" class="controlsclass" type="text" name="facet" placeholder="Ingrese faceta" required title="Cadena de faceta"> <br>
                                    <label for="numRes">Numero de registros:</label>
                                    <input id="numRes" class="controlsclass" type="number" name="numRes" max="100" min="1" step ="1" required> <br>
                                    -->
                                </div>
                            </center>

                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container -->

        </div>

        <a  name="contact"></a>
        <!--<div class="banner">

            <div class="container">

                <div class="row">
                    <div class="col-lg-6">
                        <h2>Connect to Start Bootstrap:</h2>
                    </div>
                    <div class="col-lg-6">
                        <ul class="list-inline banner-social-buttons">
                            <li>
                                <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                            </li>
                            <li>
                                <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                            </li>
                            <li>
                                <a href="#" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Linkedin</span></a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        <!-- /.container -->

        <!--</div>-->
        <!-- /.banner -->

        <!-- Footer -->
        <a  name="services"></a>
        <div class="content-section-b">

            <div class="container">

                <div class="row">

                    <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6" id="resultadot">

                    </div>
                    <div class="col-lg-5 col-sm-pull-6  col-sm-12">
                        <div id="resuldata"></div>
                        <hr class="section-heading-spacer">
                        <div class="clearfix"></div>
                        <h2 class="section-heading">-Resultados de la Busqueda-</h2>
                        <!--<p class="lead">Turn your 2D designs into high quality, 3D product shots in seconds using free Photoshop actions by <a target="_blank" href="http://www.psdcovers.com/">PSDCovers</a>! Visit their website to download some of their awesome, free photoshop actions!</p>-->
                    </div>
                    <div id="resuldata"></div> <!--RESULTADO DE LA BUSQUEDA-->

                </div>
                <ul class="list-inline intro-social-buttons">
                    <li>
                        <a href="https://www.facebook.com" class="btn btn-default btn-lg" id="a" target="_blank"><i class="fa fa-facebook fa-fw"></i> <span class="network-name"><img src="img/faceb.png" WIDTH="76" HEIGHT="30"></span></a>
                    </li>
                    <li>
                        <a href="https://twitter.com/?lang=en" class="btn btn-default btn-lg" id="a" target="_blank"><i class="fa fa-github fa-fw"></i> <span class="network-name"><img src="img/twiter.png" WIDTH="76" HEIGHT="30"></span></a>
                    </li>
                    <li>
                        <a href="http://utpl.edu.ec/" class="btn btn-default btn-lg" id="a" target="_blank"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name"><img src="img/utpl.png" WIDTH="76" HEIGHT="30"></span></a>
                    </li>
                </ul>

            </div>
            <!-- /.container -->  
        </div>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="list-inline">
                            <li>
                                <a href="buscador2.jsp">Home</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>
                            <li>
                                <a href="#about">About</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>
                            <li>
                                <a href="#services">Services</a>
                            </li>
                            <li class="footer-menu-divider">&sdot;</li>
                            <li>
                                <a href="#contact">Contact</a>
                            </li>
                        </ul>
                        <p class="copyright text-muted small">Copyright &copy; Universidad T�cnica Particular de Loja | 2016. Todos los derechos reservados</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- jQuery -->
        <script src="js/jquery.js" type="text/javascript"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>

</html>