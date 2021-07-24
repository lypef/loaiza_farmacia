<?php
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $folio = $_POST['folio'];
    
    $Lproducts = mysqli_query($con,"SELECT p.product, p.unidades, p.precio, p.product_sub FROM salidas_product p where p.folio_salida = '$folio';");
    
    while($row = mysqli_fetch_array($Lproducts))
    {
        if ($row[3])
        {
            DescontarProductosStock_hijo($row[3], $row[1]);
        }else
        {
            DescontarProductosStock($row[0], $row[1]);
        }
    }

    if (!mysqli_error($con))
    {
        mysqli_query($con,"UPDATE `salidas` SET `open` = '0' WHERE folio = $folio;");
        echo '<script>location.href = "/salidas.php?pagina=1&desde='.date("Y-m-d").'&hasta='.date("Y-m-d").'&sale_ok=true&folio_exit='.$folio.'"</script>';
    }else
    {
        echo '<script>location.href = "/salidas.php?pagina=1&desde='.date("Y-m-d").'&hasta='.date("Y-m-d").'&nosale_ok=true"</script>';
    }
?>