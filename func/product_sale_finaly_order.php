<?php
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $folio = $_POST['folio'];
    $estrategia = $_POST['estrategia'];
    $fecha_venta = date("Y-m-d H:i:s");

    if ($_POST['facturar'])
    {
        $facturar = 1;
    }else
    {
        $facturar = 0;
    }
    
    $total = 0;
    $descuento = Sale_Descuento($folio);
    

    $Lproducts = mysqli_query($con,"SELECT product, unidades, precio, p_generico FROM `product_pedido` where folio_venta = '$folio';");
    while($row = mysqli_fetch_array($Lproducts))
    {
        if ($row[3] == "")
        {
            $total = $total + ($row[1] * $row[2]);
        }
    }

    $genericos = mysqli_query($con,"SELECT unidades, p_generico, precio, id FROM product_pedido v WHERE p_generico != '' and folio_venta = '$folio'");
    while($row = mysqli_fetch_array($genericos))
    {
        $total = $total + ($row[0] * $row[2]);
    }

    $total = $total - ($total * ($descuento / 100));
    
    $abonos = mysqli_query($con,"SELECT cobrado FROM folio_venta WHERE folio_venta_ini = '$folio'");

    while($row = mysqli_fetch_array($abonos))
    {
        $t_abonos = $t_abonos + $row[0];
    }
    
    $adeudo = $total - $t_abonos;

    
    if ($adeudo <= 0)
    {
        mysqli_query($con,"UPDATE `folio_venta` SET `open` = '0', `facturar` = '$facturar', `estrategia` = '$estrategia', `fecha_venta` = '$fecha_venta' WHERE folio = $folio;");
        if (!mysqli_error($con))
        {
            // Agendar instalacion

            if ($_POST['agendar_instalacion']) {  if ($_SESSION['install'] == 1) { $agendar_instalacion = 1;  } }
            else { $agendar_instalacion = 0; }

            if ($agendar_instalacion == 1)
            {
                echo '<script>location.href = "/schedule.php?folio='.$folio.'&folio_edit=0"</script>';
            }else
            {
                echo '<script>location.href = "/orders.php?folio='.$folio.'&sale_finaly=true"</script>';
            }
        }else
        {
            echo '<script>location.href = "/sale_order.php?folio='.$folio.'&nosale_finaly=true"</script>';
        }
    }else
    {
        echo '<script>location.href = "/sale_order.php?folio='.$folio.'&nopay=true"</script>';
    }
?>