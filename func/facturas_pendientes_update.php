<?php
    
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $folio = $_POST['folio'];
    $url = $_POST['url'];
    
    mysqli_query($con,"UPDATE `folio_venta` SET `facturar` = '0' WHERE `folio_venta`.`folio` = '$folio';    ");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }else
    {
        echo mysqli_error($con);   
    }
?>