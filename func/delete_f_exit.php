<?php
    include 'db.php';
    
    $folio = $_POST['folio'];
    $url = $_POST['url'];
    $con = db_conectar();  

    $addpregunta = false;

    for($i=0;$i<strlen($url);$i++)
    {
        if ($url[$i] == "?")
        {
            $addpregunta = true;
        }
    }

    if (true)
    {
        mysqli_query($con,"DELETE FROM salidas WHERE folio = '$folio';");
        mysqli_query($con,"DELETE FROM `salidas_product` WHERE `salidas_product`.`folio_salida` = '$folio';");

        if (!mysqli_error($con))
        {
            if ($addpregunta)
            {
                echo '<script>location.href = "'.$url.'&sale_delete=true"</script>';
            }else{
                echo '<script>location.href = "'.$url.'?sale_delete=true"</script>';
            }       
        }else
        {
            if ($addpregunta)
            {
                echo '<script>location.href = "'.$url.'&sale_nodelete=true"</script>';
            }else{
                echo '<script>location.href = "'.$url.'?sale_nodelete=true"</script>';
            }
        }
    }else
    {
        if ($addpregunta)
        {
            echo '<script>location.href = "'.$url.'&sale_nodelete=true"</script>';
        }else{
            echo '<script>location.href = "'.$url.'?sale_nodelete=true"</script>';
        }
    }
    
?>