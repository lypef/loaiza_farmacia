<?php
    include 'db.php';
    db_sessionValidarNO();
    
    $unidades = $_POST['unidades'];
    $product = $_POST['product'];
    $folio = $_POST['folio'];
    $url = $_POST['url'];
    $precio = $_POST['costo'];

    $_precio = $_POST['_precio'];
    $ancho = $_POST['ancho'];
    $alto = $_POST['alto'];
    $largo = $_POST['largo'];
    $peso = $_POST['peso'];

    $url = str_replace("&add_product_sale=true", "", $url);
    $url = str_replace("?add_product_sale=true", "", $url);
    $url = str_replace("&noadd_product_sale=true", "", $url);
    $url = str_replace("?noadd_product_sale=true", "", $url);

    $con = db_conectar();  
  
    if ($_precio >0 && $ancho >0 && $alto >0 && $largo >0 && $peso >0)
    {
        // Producto con medidas exactas
        mysqli_query($con,"INSERT INTO `product_pedido` (`folio_venta`, `product`, `unidades`, `precio`, `ancho`, `alto`, `largo`, `peso`) VALUES ('$folio', '$product', '$unidades', '$_precio', '$ancho', '$alto', '$largo', '$peso');");
    }else
    {
        mysqli_query($con,"INSERT INTO `product_pedido` (`folio_venta`, `product`, `unidades`, `precio`) VALUES ('$folio', '$product', '$unidades', '$precio');");
    }
    
    

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "'.$url.'&add_product_sale=true"</script>';
    }else
    {
        echo '<script>location.href = "'.$url.'&noadd_product_sale=true"</script>';
    }
?>