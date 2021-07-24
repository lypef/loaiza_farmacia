<?php
    include 'db.php';
    db_sessionValidarNO();
    session_start();
        
    $con = db_conectar();
    
    $folio = $_POST['folio'];

    if ($_SESSION['traspasos'] == 1)
    {
        $data = mysqli_query(db_conectar(),"SELECT product, unidades, product_sub, almacen_destino FROM product_trasnfer WHERE folio_tranfer = '$folio';");

        while($row = mysqli_fetch_array($data))
        {
            $product = $row[0];
            $unidades = $row[1];
            $hijo = $row[2];
            $almacen_destino = $row[3];

            if ($hijo > 0)
            {
                // hacer operaciones con producto hijo
                $padre = mysqli_query($con,"SELECT stock FROM productos WHERE id = '$product' and almacen = '$almacen_destino';");
                if($padre_row = mysqli_fetch_array($padre))
                {
                    $aumentar = $padre_row[0] + $unidades;
                    mysqli_query($con,"UPDATE `productos` SET `stock` = '$aumentar' WHERE `productos`.`id` = '$product';");
                    mysqli_query($con,"UPDATE `productos_sub` SET stock = (stock - '$unidades') WHERE `productos_sub`.`id` = '$hijo';");
                }else
                {
                    $hijos = mysqli_query($con,"SELECT stock, id FROM productos_sub WHERE padre = '$product' and almacen = '$almacen_destino';");
                    if($hijos_row = mysqli_fetch_array($hijos))
                    {
                        $aumentar = $hijos_row[0] + $unidades;
                        $id = $hijos_row[1];
                        mysqli_query($con,"UPDATE `productos_sub` SET `stock` = '$aumentar' WHERE `productos_sub`.`id` = '$id';");
                        mysqli_query($con,"UPDATE `productos_sub` SET stock = (stock - '$unidades') WHERE `productos_sub`.`id` = '$hijo';");
                    }else
                    {
                        mysqli_query($con,"INSERT INTO `productos_sub` (`padre`, `almacen`, `stock`, `ubicacion`, `max`, `min`) VALUES ('$product', '$almacen_destino', '$unidades', '', '$unidades', '1');");
                        mysqli_query($con,"UPDATE `productos_sub` SET stock = (stock - '$unidades') WHERE `productos_sub`.`id` = '$hijo';");
                    }
                }
            }else
            {
                // Operacion si el producto fue padre
                $hijos = mysqli_query($con,"SELECT stock, id FROM productos_sub WHERE padre = '$product' and almacen = '$almacen_destino';");
                if($hijos_row = mysqli_fetch_array($hijos))
                {
                    $id = $hijos_row[1];
                    mysqli_query($con,"UPDATE `productos_sub` SET `stock` = (stock + '$unidades') WHERE `productos_sub`.`id` = '$id';");
                    mysqli_query($con,"UPDATE `productos` SET stock = (stock - '$unidades') WHERE id = '$product';");
                }else
                {
                    mysqli_query($con,"INSERT INTO `productos_sub` (`padre`, `almacen`, `stock`, `ubicacion`, `max`, `min`) VALUES ('$product', '$almacen_destino', '$unidades', '', '$unidades', '1');");
                    mysqli_query($con,"UPDATE `productos` SET stock = (stock - '$unidades') WHERE id = '$product';");
                }
            }
        }
        // Se finaliza el traspaso
        mysqli_query($con,"UPDATE `traspasos` SET `open` = '0' WHERE `traspasos`.`folio` = '$folio';");
        echo '<script>location.href = "/transfers.php?add_product_sale=true&transfer='.$folio.'"</script>';
    }
?>