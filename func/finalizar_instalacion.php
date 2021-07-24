<?php
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $folio = $_GET['folio'];
    
    mysqli_query($con,"UPDATE `folio_venta` SET `schedule` = 0, `schedule_end` = 1 WHERE folio = $folio;");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "/schedule.php?process_yes=true&folio=0&folio_edit=0"</script>';
    }else
    {
        echo '<script>location.href = "/schedule.php?sale_noliquid=true&folio=0&folio_edit=0"</script>';
    }
?>