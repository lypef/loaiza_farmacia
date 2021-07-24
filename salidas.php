<?php
    include 'func/header.php';
?>
<body>

<div class="col-md-12">
    <?php 
        if ($_GET["search"])
        {
            echo table_exit_search($_GET["search"]); 
        }else
        {
            echo table_salidas($_GET["pagina"],$_GET["search"], $_GET["desde"], $_GET["hasta"]); 
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

        window.location.href = "/salidas.php?pagina=1&desde="+inicio+"&hasta="+finaliza+"&search="+search;
    }

    if (getUrlVars()["sale_ok"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>Finalizado!</strong> La orden de salida se finalizo con exito";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
    if (getUrlVars()["nosale_ok"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>ERROR!</strong> La salida no tubo exito";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }

</script>
<?php
    include 'func/footer.php';
    echo table_exit_modal($_GET["desde"], $_GET["hasta"]);
    
    if ($_GET["folio_exit"])
    {
        echo '<meta http-equiv="refresh" content="0; url=/sale_exit_report.php?folio='.$_GET["folio_exit"].'">';
    }
?>