<?php
    include 'func/header.php';
?>
<div class="col-md-12">
    <div class="section-title-2 text-uppercase mb-40 text-center">
            <h4>SELECCIONE CONTACTO PARA REALIZAR PEDIDO</h4>
    </div>
    <?php 
        if ($_GET["search"])
        {
            echo create_sale_SelectClientSearchOrder($_GET["search"],$_GET["pagina"]);
        }else
        {
            echo create_sale_SelectClientOrder($_GET["pagina"]);
        }
    ?>
</div>  
<script>
if (getUrlVars()["clientreturn"])
    {
        var body = "<div class='alert alert-warning alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>Error!</strong> La venta no fue creada.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
</script>
<?php
    include 'func/footer.php';
    if ($_GET["search"])
    {
        echo select_client_sale_modal_search_order($_GET["search"],$_GET["pagina"]);
    }else
    {
        echo select_client_sale_modal_order($_GET["pagina"]);
    }
?>
        
