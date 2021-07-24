<?php
    include 'db.php';
    db_sessionValidarNO();
    
    $unidades = $_POST['unidades'];
    $product = $_POST['product'];
    $folio = $_POST['folio'];
    $url = $_POST['url'];
    $hijo = $_POST['hijo'];
    $sucursal = $_POST['sucursal'];

    $url = str_replace("&add_product_sale=true", "", $url);
    $url = str_replace("?add_product_sale=true", "", $url);
    $url = str_replace("&noadd_product_sale=true", "", $url);
    $url = str_replace("?noadd_product_sale=true", "", $url);
    $url = str_replace("&nostock=true", "", $url);
    $url = str_replace("?nostock=true", "", $url);

    if ($sucursal > 0)
    {
        $con = db_conectar();  
    
        if ($hijo > 0)
        {
            // hacer operaciones con producto hijo
            mysqli_query($con,"INSERT INTO `product_trasnfer` (`folio_tranfer`, `product`, `unidades`, `product_sub`, `almacen_destino`) VALUES ('$folio', '$product', '$unidades', '$hijo', '$sucursal');");
        }else
        {
            // hacer operaciones con producto principal
            mysqli_query($con,"INSERT INTO `product_trasnfer` (`folio_tranfer`, `product`, `unidades`, `almacen_destino`) VALUES ('$folio', '$product', '$unidades', '$sucursal');");
        }
        

        if (!mysqli_error($con))
        {
            $addpregunta = false;

            for($i=0;$i<strlen($url);$i++)
            {
                if ($url[$i] == "?")
                {
                    $addpregunta = true;
                }
            }

            if ($addpregunta)
            {
                echo '<script>location.href = "'.$url.'&add_product_sale=true"</script>';
            }else{
                echo '<script>location.href = "'.$url.'?add_product_sale=true"</script>';
            }
        }else
        {
            $addpregunta = false;

            for($i=0;$i<strlen($url);$i++)
            {
                if ($url[$i] == "?")
                {
                    $addpregunta = true;
                }
            }

            if ($addpregunta)
            {
                echo '<script>location.href = "'.$url.'&noadd_product_sale=true"</script>';
            }else{
                echo '<script>location.href = "'.$url.'?noadd_product_sale=true"</script>';
            }
        }
        // Finaliza   
    }else
    {
        $addpregunta = false;

        for($i=0;$i<strlen($url);$i++)
        {
            if ($url[$i] == "?")
            {
                $addpregunta = true;
            }
        }

        if ($addpregunta)
        {
            echo '<script>location.href = "'.$url.'&noadd_product_sale=true"</script>';
        }else{
            echo '<script>location.href = "'.$url.'?noadd_product_sale=true"</script>';
        }
        
        echo '<script>location.href = "'.$url.'?noadd_product_sale=true"</script>';
    }
?>