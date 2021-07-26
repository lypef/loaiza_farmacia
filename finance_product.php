<?php
    include 'func/header.php';
?>
    <div class="row">
            
        <div class="col-md-3 text-center">
        <center>
        <a href="report_products_gen_xls.php?inicio=<?php echo $_GET["inicio"]?>&finaliza=<?php echo $_GET["finaliza"]?>&product=<?php echo $_GET["product"]?>"style="
        width: 100%;
        background-color: #58ACFA;
        border: none;
        color: white;
        padding: 18px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 20px;
        margin: 4px 2px;
        cursor: pointer;
        ">Generar XLS</a>
        </center>        
        </div>
        
        <div class="col-md-3 text-center">
            <label>Fecha de inicio</label><br>
            <input type="date" id="inicio" name="inicio" value="<?php echo $_GET["inicio"]; ?>" style="text-align: center; height:40px; border: 2px solid #D9D7D7;" onchange="change_date();">
        </div>
        
        

        <div class="col-md-3 text-center">
            <label>Fecha de finalizacion</label><br>
            <input type="date" id="finaliza" name="finaliza" value="<?php echo $_GET["finaliza"]; ?>" style="text-align: center; height:40px; border: 2px solid #D9D7D7;" onchange="change_date();">
        </div>

        <div class="col-md-3 text-center">
        <center>
            <a href="report_products_gen.php?inicio=<?php echo $_GET["inicio"]?>&finaliza=<?php echo $_GET["finaliza"]?>&product=<?php echo $_GET["product"]?>"style="
            width: 100%;
            background-color: #58ACFA;
            border: none;
            color: white;
            padding: 18px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            margin: 4px 2px;
            cursor: pointer;
            ">Generar PDF</a>
        </center>
        </div>

    </div>
    
<script>
function change_date ()
  {
    var product = <?php echo $_GET["product"]; ?>;
    var inicio = document.getElementById("inicio").value;
    var finaliza = document.getElementById("finaliza").value;
    
    window.location.href = "/finance_product.php?inicio="+inicio+"&finaliza="+finaliza+"&product="+product;
  }
</script>

<!-- Start page content -->
        <section id="page-content" class="page-wrapper">
            <!-- Start Product List -->
            <div class="product-list-tab">
                <div class="row" style="padding: 20px;">
                        <div class="product-list tab-content">
                            <div class="section-title-2 text-uppercase mb-40 text-center">
                                <h4>HISTORIA DE VENTAS</h4>
                            </div>
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                <div id="areaImprimir">    
                                <?php 
                                    echo table_finance_product($_GET["inicio"],$_GET["finaliza"],$_GET["product"]);
                                ?>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </section>
        <!-- End page content -->
<?php
    include 'func/footer.php';
?>
        
