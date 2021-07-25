<?php
    include 'db.php';
    
    $folio = $_POST['folio'];
    
    $con = db_conectar();  

    $data = mysqli_query($con,"SELECT product, hijo, pedir FROM order_buy_products where folio = '$folio' ");

    while($row = mysqli_fetch_array($data))
    {
        
        if ($row[0] > 0)
        {
            $id = $row[0];
            $unidades = $row[2];
            mysqli_query($con,"UPDATE `productos` SET stock = stock + '$unidades' WHERE id = $id;");
        }

        if ($row[1] > 0)
        {
            $id = $row[1];
            $unidades = $row[2];
            mysqli_query($con,"UPDATE `productos_sub` SET stock = stock + '$unidades' WHERE id = $id;");
        }
        
    }

    mysqli_query($con,"UPDATE `order_buy` SET `estatus` = '1' WHERE folio = '$folio';");

    echo '<script>location.href = "/ordens_compra.php?pagina=1&process_yes=true"</script>';
    
?>