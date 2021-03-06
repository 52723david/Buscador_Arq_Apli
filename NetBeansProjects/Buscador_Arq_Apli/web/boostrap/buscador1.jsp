<!DOCTYPE html>
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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <!-- Custom CSS -->
        <link href="css/landing-page.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
        <script src=”//connect.facebook.net/en_US/all.js”></script>
        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="js/facebook.js" type="text/javascript"></script>

       
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
                        var contenido="<h2>Resultados de busqueda: "+data.response["numFound"]+"</h2><br><h2>Tiempo que tard� la busqueda: "+data.responseHeader["QTime"]+" mseg</h2>";
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
                                        contenido+="<th><h5>Palabras Clave</h5></th>";
                                        contenido+="<td><h6>"+" - "+contenido1[i]["keywords"]+"</h6></td>";
                                    contenido+="</tr>";
                                contenido+="</table>";
                                       contenido+="<a href=\"javascript: void(1);\" onclick=\"window.open('http://www.facebook.com/sharer.php?u="+urlquery+"','ventanacompartir', 'toolbar=0, status=0, width=70, height=450');\"><img src='img/compartir_facebook.png' width='80' height='35'/> </a>";   
                                     
                                    contenido+= "<IMG NAME='HTMLpoint' SRC='img/Favorito.jpeg' href='www.facebook.com' ALT='HTMLpoint' width='149' height='55' border='0'>";
                            contenido+="</vid>";
                        }
                        $("#resuldata").html(contenido);
                    }
                });
            }
        </script>
        <script>
            window.onload = function () {
                /* Función que comprueba el estado del usuario, si el usuario ya está conectado será redireccionado 
                 a la página de inicio index.html */
                FBLogin();
            }
        </script>
        
        
        <script>
        function busqueda(tiempo, urlquery, id){
            var fecha = new Date();
            var hora = fecha.getHours();
            var minuto = fecha.getMinutes();
            var segundo = fecha.getSeconds();
            if (hora < 10) {hora = "0" + hora}
            if (minuto < 10) {minuto = "0" + minuto}
            if (segundo < 10) {segundo = "0" + segundo}

            var hor = hora + ":" + minuto + ":" + segundo;
            var fec = fecha.getDate() + "/" + (fecha.getMonth() +1) + "/" + fecha.getFullYear();
            var navegador=navigator.appVersion;
            $.ajax({
                url: "http://localhost:8080/Buscador/webresources/controlador.busqueda",
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                //data: JSON.stringify({"FBus": fec, "HBus": hor, "TBus": tiempo, "idBus": 17, "idUsu":id, "navegador": navegador, "urlBus":urlquery}),
                data: JSON.stringify({"id_bus": 17, "url_bus":urlquery, "f_bus": fec, "h_bus": hor, "t_bus": tiempo,  "navegador": navegador, "id_usu":id}),                
                success: function (data, textStatus, jqXHR) {
                    //alert("Gracias por registrarse");
                    //window.location.href = url_after_login;
                },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("Tengo problemas para almacenar tus datos");
                        //window.location.href = url_after_login;
                    }
                });
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
                    <a class="navbar-brand topnav" href="buscador1.jsp"><img src="img/utpl.png" WIDTH="80" HEIGHT="38"></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="buscador1.jsp">Home</a>
                        </li>
                        <li>
                            <a href="#services">Servicios</a>
                        </li>
                        <li>
                            <a class="btn" data-toggle="modal" href="#myModal" id="btn">Registrar</a>
                        </li>
                        <li>
                            <div id="status"></div>
                            <button type="button" onclick="FBBtnLogin()" id="boton">Iniciar sesi�n con facebook</button> 
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Formulario de Registro</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row" id="registro">
                            <div class="col-md-12"></div>
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="page-header">
                                            <center><h3>Datos del Usuario</h3></center>
                                        </div>
                                        <center>
                                            <div>
                                                <form role="form" action="coneccion.jsp" method="post">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Nombres</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                            <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Nombre completo" name="nombre">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">C�dula</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                            <input type="number" class="form-control" id="exampleInputEmail1" placeholder="C�dula" name="cedula">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Email</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" name="email">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Tel�fono</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                                            <input type="tel" class="form-control" id="exampleInputEmail1" placeholder="Tel�fono o Celular" name="telefono">
                                                        </div>
                                                    </div>
                                                  

                                                    <button type="button" class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-arrow-left"></span> Atras</button>
                                                    <button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-lock" ></span> Guardar</button>

                                                    <p><br/></p>
                                                </form>
                                            </div>
                                        </center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>
        <!-- Header -->

        <!-- Header -->
        <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="low">
                <div class="col-lg-12">
                    <div class="intro-message">
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
                                        <button id="btn_busc" class="btn btn-default" onclick="buscar()" type="button">Buscar</button>
                                    </span>
                                    
                                </div>
                            </center>
<br>              
                        <ul id="btn_Social" class="list-inline intro-social-buttons">
                            <li>
                                <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                            </li>
                            <li>
                                <a href="https://github.com/52723david/Buscador_Arq_Apli/wiki/Buscador" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                            </li>
                            <li>
                                <a href="#" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Linkedin</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>

        <a  name="contact"></a>
       
        <a  name="services"></a>
        <div class="content-section-b">

            <div class="container">

                <div class="row">

                <div id="resuldata"></div> <!--RESULTADO DE LA BUSQUEDA-->
                </div>
            </div>
            <!-- /.container -->  
        </div>
        
        
<footer>
            <a  name="contact"></a>
    <div class="banner">

        <div class="container">

            <div class="row">
                <div class="col-lg-6">
                 <p class="copyright text-muted small">Copyright &copy; UTPL 2016. Todos los derechos reservados</p>

                </div>
                <div class="col-lg-6">
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
            </div>

        </div>
        <!-- /.container -->

    </div>
           
        </footer>

        <!-- jQuery -->
        <script src="js/jquery.js" type="text/javascript"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>

</html>