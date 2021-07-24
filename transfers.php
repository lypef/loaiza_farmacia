<?php
    include 'func/header.php';
?>
<body>

<div class="col-md-12">
    <?php 
        if ($_GET["search"])
        {
            echo table_trasnfers_search($_GET["search"]); 
        }else
        {
            echo table_tranfers($_GET["pagina"],$_GET["search"], $_GET["desde"], $_GET["hasta"]); 
        }
    ?>
</div>  
<br>
<hr>


<script>

    function change_date ()
    {
        // inicio, finaliza
        var inicio = document.getElementById("inicio").value;
        var finaliza = document.getElementById("finaliza").value;
        var search = document.getElementById("search").value;

        window.location.href = "/transfers.php?pagina=1&desde="+inicio+"&hasta="+finaliza+"&search="+search;
    }

    if (getUrlVars()["sale_finaly"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>Finalizado!</strong> El pedido se finalizo con exito";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    if (getUrlVars()["abono"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>HECHO!</strong> Abono realizado correctamente.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }

</script>
<?php
    include 'func/footer.php';
    echo table_tranfers_modal();

    if ($_GET["transfer"])
    {
        echo '<meta http-equiv="refresh" content="0; url=transfer_ticket.php?folio='.$_GET["transfer"].'">';
    }
?>