<?php
    include 'func/header.php';
?>
<!-- Start page content -->
        <section id="page-content" class="page-wrapper">
            <!-- Start Product List -->
            <div class="product-list-tab">
                <div class="container">
                    <div class="row">
                        <div class="product-list tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                <?php 
                                    if ($_GET["search"])
                                    {
                                        echo _getProductsFinanceProductsSearch($_GET["search"],$_GET["pagina"]);
                                    }
                                    else
                                    {
                                        echo _getProductsFinanceProducts($_GET["pagina"]);
                                    }
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
        
