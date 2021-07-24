<?php
  error_reporting(0);
  include 'func/db.php';
  LoadValuesOfflineEmpresa();
  $departamentos = mysqli_query(db_conectar(),"SELECT id, nombre FROM departamentos");
  $departamentos_ = mysqli_query(db_conectar(),"SELECT id, nombre FROM departamentos");
  ValidateAnnuities();
?>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><?php echo $_SESSION['empresa_nombre'] ?></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

    <!-- All css files are included here -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="css/custom.css">

    <!-- Style customizer (Remove these two lines please) -->
    <link rel="stylesheet" href="css/color/skin-default.css">


    <!-- Modernizr JS -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
    <style type="text/css">
    body {
        overflow: hidden;
    }
    /* preloader */
    #preloader {
        position: fixed;
        top:0; left:0;
        right:0; bottom:0;
        background: #000;
        z-index: 100;
    }
    #loader {
        width: 100px;
        height: 100px;
        position: absolute;
        left:50%; top:50%;
        background: url(images/_loader.gif) no-repeat center 0;
        margin:-50px 0 0 -50px;
    }
    </style>
<body>
    <div id="preloader">
        <div id="loader"></div>
    </div>
    <div id="main">
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!-- Body main wrapper start -->
    <div class="wrapper">
        <!-- Start of header area -->
        <header>
            <div class="header-top-bar white-bg ptb-20">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="header-top">
                                <ul>
                                <li class="lh-50">
                                    <a href="#" class="pr-20"><i class="zmdi zmdi-search"></i></a>
                                    <div class="header-bottom-search header-top-down header-top-hover lh-35">
                                        <form action="index.php" class="header-search-box" action="index.php">
                                            <div>
                                                <input type="text" placeholder="Buscar" name="search" autocomplete="off">
                                                <button class="btn btn-search" type="submit">
                                                    <i class="zmdi zmdi-search"></i>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </li>
                                <li class="lh-50">
                                    <a href="#" class="prl-20 text-uppercase">DEPARTAMENTOS</a>
                                    <div class="header-top-down header-top-hover header-top-down-lang pl-15 lh-35 lh-35">
                                        <ul>
                                            <?php
                                            while($row = mysqli_fetch_array($departamentos))
                                            {
                                                echo '<li><a href=index.php?pagina='.$_GET["pagina"].'&department='.$row[0].'>'.$row[1].'</a></li>';
                                            }
                                            ?>
                                        </ul>
                                    </div>
                                </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="col-md-4 hidden-sm hidden-xs">
                            <div class="middle text-center">
                                <ul>
                                    <li class="mr-30 lh-50">
                                        <a href="/index.php"><strong><i class="zmdi zmdi-store"></i></strong> <?php echo EmpresaNombre() ;?></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="header-top header-top-right">
                                <ul>
                                <li class="lh-50">
                                        <a href="login.php" class="prl-20 text-uppercase">Login</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="sticky-header" class="header-area header-wrapper transparent-header">
                <div class="header-middle-area black-bg">
                    <div class="container">
                        <div class="full-width-mega-dropdown">
                            <div class="row">
                                <div class="col-md-12">
                                    <nav id="primary-menu">
                                        <ul class="main-menu text-center">
                                            <li class="mega-parent"><a href="#"><i class="zmdi zmdi-equalizer"></i> Ofertas</a>
                                                <div class="mega-menu-area header-top-hover p-30">
                                                    <?php
                                                        echo ReturnProductsOferta();
                                                    ?>

                                                </div>
                                            </li>
                                            <li class="mega-parent"><a href="#"><i class="zmdi zmdi-plus"></i> Lo mas nuevo</a>
                                                <div class="mega-menu-area header-top-hover p-30">
                                                    
                                                <?php
                                                    while($row = mysqli_fetch_array($departamentos_))
                                                    {
                                                        echo '
                                                        <ul class="single-mega-item">
                                                        <li>
                                                        <a href="departamento.php/?id='.$row[0].'"><h2 class="mega-menu-title mb-15">'.$row[1].'</h2></a>
                                                        </li>
                                                        '.returnproducts($row[0]).'
                                                        </ul>';
                                                    }
                                                ?>
                                                    
                                                </div>
                                            </li>
                                            <li><a href="index.php">Productos</a></li>
                                            <li><a href="#" data-toggle="modal" data-target="#como">Como comprar? </a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu Start -->
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="mobile-menu">
                                <nav id="dropdown">
                                    <ul>
                                        <li><a href="/">Home</a></li>
                                        <li><a href="/login.php">Login</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile Menu End -->
        </header>
        <!-- End of header area -->
        <!-- Start page content -->
        <section id="page-content" class="page-wrapper">
            <br><br>
            <!-- Start Product List -->
            <div class="product-list-tab">
                <div class="container">
                    <div class="row">
                        <!--Contenido-->
<!-- Start page content -->
<div id="message"></div>
<script>

function getUrlVars() {
var vars = {};
var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
vars[key] = value.replace(/%20/g, " ");
});
return vars;
}

if (getUrlVars()["data_no"])
{
    var body = "<div class='alert alert-warning alert-dismissible show' role='alert'>";
    body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
    body +="<span aria-hidden='true'>&times;</span>";
    body +="</button>";
    body +="<strong>Campos vacios! </strong> Recibimos informacion vacia, <b>Intente de nuevo</b>.";
    body +="</div>";
    document.getElementById("message").innerHTML = body;
}
</script>
<div class="col-md-12">
  <div class="message-box box-shadow white-bg">
          <div class="row">
              <div class="col-md-12">
                  <div class="section-title text-uppercase mb-40">
                      <h4>TE CUMPLIMOS CON EL TIEMPO DE ENTREGA?</h4>
                  </div>
              </div>
              <div class="col-md-12">
                <div class="btn-group btn-group-justified">
                    <a class="btn btn-default" onclick="cumplimos(1);">1</a>
                    <a class="btn btn-default" onclick="cumplimos(2);">2</a>
                    <a class="btn btn-default" onclick="cumplimos(3);">3</a>
                    <a class="btn btn-default" onclick="cumplimos(4);">4</a>
                    <a class="btn btn-default" onclick="cumplimos(5);">5</a>
                    <a class="btn btn-default" onclick="cumplimos(6);">6</a>
                    <a class="btn btn-default" onclick="cumplimos(7);">7</a>
                    <a class="btn btn-default" onclick="cumplimos(8);">8</a>
                    <a class="btn btn-default" onclick="cumplimos(9);">9</a>
                    <a class="btn btn-default" onclick="cumplimos(10);">10</a>
                </div>

                <div class="col-md-4">
                    <center><label>Malo</label></center>
                </div>

                <div class="col-md-4">
                    <center><label>Regular</label></center>
                </div>

                <div class="col-md-4">
                    <center><label>Bueno</label></center>
                </div>

              </div>

              <div class="col-md-12">
              <br><br><br><br><br>
                  <div class="section-title text-uppercase mb-40">
                      <h4>EL TRABAJO QUE TE REALIZAMOS, CUMPLIO TUS ESPECTATIVAS ?</h4>
                  </div>
              </div>
              <div class="col-md-12">
                <div class="btn-group btn-group-justified">
                    <a class="btn btn-default" onclick="realizamos(1);">1</a>
                    <a class="btn btn-default" onclick="realizamos(2);">2</a>
                    <a class="btn btn-default" onclick="realizamos(3);">3</a>
                    <a class="btn btn-default" onclick="realizamos(4);">4</a>
                    <a class="btn btn-default" onclick="realizamos(5);">5</a>
                    <a class="btn btn-default" onclick="realizamos(6);">6</a>
                    <a class="btn btn-default" onclick="realizamos(7);">7</a>
                    <a class="btn btn-default" onclick="realizamos(8);">8</a>
                    <a class="btn btn-default" onclick="realizamos(9);">9</a>
                    <a class="btn btn-default" onclick="realizamos(10);">10</a>
                </div>

                <div class="col-md-4">
                    <center><label>Malo</label></center>
                </div>

                <div class="col-md-4">
                    <center><label>Regular</label></center>
                </div>

                <div class="col-md-4">
                    <center><label>Bueno</label></center>
                </div>

              </div>
              
              
              <div class="col-md-12">
              <br><br><br><br><br>
                  <div class="section-title text-uppercase mb-40">
                      <h4>COMO ES LA ATENCION DE NUESTRO PERSONAL?</h4>
                  </div>
              </div>
              <div class="col-md-12">
                
                <div class="btn-group btn-group-justified">
                    <a class="btn btn-default" onclick="atendimos(1);">1</a>
                    <a class="btn btn-default" onclick="atendimos(2);">2</a>
                    <a class="btn btn-default" onclick="atendimos(3);">3</a>
                    <a class="btn btn-default" onclick="atendimos(4);">4</a>
                    <a class="btn btn-default" onclick="atendimos(5);">5</a>
                    <a class="btn btn-default" onclick="atendimos(6);">6</a>
                    <a class="btn btn-default" onclick="atendimos(7);">7</a>
                    <a class="btn btn-default" onclick="atendimos(8);">8</a>
                    <a class="btn btn-default" onclick="atendimos(9);">9</a>
                    <a class="btn btn-default" onclick="atendimos(10);">10</a>
                </div>

                <div class="col-md-4">
                    <center><label>Malo</label></center>
                </div>

                <div class="col-md-4">
                    <center><label>Regular</label></center>
                </div>

                <div class="col-md-4">
                    <center><label>Bueno</label></center>
                </div>

              </div>

              <div class="col-md-12">
              <br><br><br><br><br>
                  <div class="section-title text-uppercase mb-40">
                      <h4>QUEJAS Y SUGERENCIAS</h4>
                  </div>
              </div>
              <div class="col-md-12">
                <form id="contact-form" action="func/suervey_add.php" method="post">
                <textarea name="quejas" id="quejas" cols="30" rows="4" placeholder="Escriba aqui"></textarea>
              </div>
              
            <div class="country-select shop-select col-md-12">
                <input type="hidden" id="folio" name="folio" value="<?php echo $_GET['folio']; ?>">
                <input type="hidden" id="cumplimos" name="cumplimos">
                <input type="hidden" id="realizamos" name="realizamos">
                <input type="hidden" id="atendimos" name="atendimos">
                <div id="message"></div>
                <br><button style="width: 100%;" class="submit-btn btn-primary mt-20" type="submit">Enviar encuesta</button>
            </form>
            </div>

          </div>
  </div>
</div>
<script>
    function cumplimos (value)
    {
        document.getElementById("cumplimos").value = value;
    }

    function realizamos (value)
    {
        document.getElementById("realizamos").value = value;
    }

    function atendimos (value)
    {
        document.getElementById("atendimos").value = value;
    }
</script>
                    </div>
                </div>
            </div>
            <!-- End of Product List -->
            <br>
            <br>
            <br>
        </section>
        <!-- End page content -->
        
        <!-- Start footer area -->
        <footer id="footer" class="footer-area">
            <div class="footer-top-area gray-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="footer-widget">
                                <div class="footer-widget-img pb-30">
                                    <a href="#">
                                        <img src="images/logo/logo-2.png" alt="">
                                    </a>
                                </div>
                                <ul class="toggle-footer text-white">
                                    <li class="mb-30 pl-45">
                                        <i class="zmdi zmdi-pin"></i>
                                        <p><?php echo $_SESSION['empresa_direccion'];?></p>
                                    </li>
                                    <li class="mb-30 pl-45">
                                        <i class="zmdi zmdi-email"></i>
                                        <a href="mailto:<?php echo $_SESSION['empresa_correo']?>">
                                        <p><?php echo before ('@', $_SESSION['empresa_correo']); ?>@</p>
                                        <p><?php echo after ('@', $_SESSION['empresa_correo']); ?></p>
                                        </a>
                                    </li>
                                    <li class="pl-45">
                                        <i class="zmdi zmdi-phone"></i>
                                        <p><?php echo $_SESSION['empresa_telefono']; ?></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-white footer-about-us">
                                <h4 class="pb-40 m-0 text-uppercase">Mision</h4>
                                <p><?php echo $_SESSION['empresa_mision'];?></p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-white footer-about-us">
                                <h4 class="pb-40 m-0 text-uppercase">Vision</h4>
                                <p><?php echo $_SESSION['empresa_vision'];?></p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-white footer-about-us">
                                <h4 class="pb-40 m-0 text-uppercase">Contacto</h4>
                                <p><?php echo $_SESSION['empresa_contacto'];?></p>
                                <ul class="footer-social-icon">
                                    <li><a target="_blank" href="<?php echo $_SESSION['empresa_fb'];?>"><i class="zmdi zmdi-facebook"></i></a></li>
                                    <li><a target="_blank" href="<?php echo $_SESSION['empresa_yt'];?>"><i class="zmdi zmdi-instagram"></i></a></li>
                                    <li><a target="_blank" href="<?php echo $_SESSION['empresa_tw'];?>"><i class="zmdi zmdi-twitter"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom black-bg ptb-15">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="copyright text-white">
                                <p>Desarrollado por <a target="_blank" href="https://www.cyberchoapas.com"> CLTA DESARROLLO & DISTRIBUCION DE SOFTWARE</a>.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="footer-img">
                                <img src="images/payment.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End footer area -->
        
    </div>
    <!-- Body main wrapper end -->

    <!-- Placed js at the end of the document so the pages load faster -->

    <!-- jquery latest version -->
    <script src="js/vendor/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Particles js -->
    <script src="js/particles.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="js/plugins.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="js/main.js"></script>
</body>

</html>
<?php
    
    if ($_GET["department"])
    {
        echo _getProductsModalDepartment($_GET["department"], $_GET["pagina"]);
    }
    elseif ($_GET["search"])
    {
        echo _getProductsModalSearch($_GET["search"],$_GET["pagina"]);
    }
    else
    {
        echo _getProductsModal($_GET["pagina"]);
    }
?>

    
<!-- Como -->
<div id="como" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Instrucciones para realizar proceso de compra</h4>
      </div>
      <div class="modal-body">
      <p>
      1.- Nos proporciona nombre y correo electrónico (datos de facturación en caso que requiera factura + Iva )
      <br><br>
      2.- Se genera su cotización.  (Su cotización trae los métodos de pago por transferencias, Oxxo, PayPal, MercadoPago o depósitos en ventanilla)
      <br><br>
      3.-  Una vez generada en cuanto realice su pago, remisionamos o facturamos su compra. 
      <br><br>
      4.- En ese momento el sistema genera licencia y le proporcionamos su sistema para que ustedes lo instalen o nos dan acceso para que nosotros lo instalemos.
      </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>

  </div>
</div>
</div>
<script>
function hideMenuVarMobile() 
{
    jQuery('.mean-nav ul:first').slideUp();
    jQuery(".meanmenu-reveal.meanclose").toggleClass("meanclose").html("<span /><span /><span />");
    this.menuOn = false;
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
$(window).load(function() {
	$('#preloader').fadeOut('slow');
	$('body').css({'overflow':'visible'});
})
</script>