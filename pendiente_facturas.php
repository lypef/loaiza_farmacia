<?php
    include 'func/header.php';
?>
<div class="section-title-2 text-uppercase mb-40 text-center">
        <br>
        <h4>VENTAS PENDIENTES DE FACTURACION</h4>
    </div>
<!-- Start page content -->
        <section id="page-content" class="page-wrapper">
            <!-- Start Product List -->
            <div class="product-list-tab">
                <div class="container" style="width:99%; !important">
                    <div class="row">
                        <div class="product-list tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                <?php 
                                    echo table_fact_pd();
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
    echo table_fact_pd_sale();
?>