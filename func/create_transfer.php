<?php
    include 'db.php';
    db_sessionValidarNO();
    session_start();
    
    if ($_SESSION['traspasos'] == 1)
    {
        $folio = $vendedor . date("YmdHis");
        $fecha = date("Y-m-d H:i:s");
        $user = $_SESSION['users_id'];
        
        $con = db_conectar();  
        mysqli_query($con,"INSERT INTO `traspasos` (`folio`, `fecha`, `user`, `open`) VALUES ('$folio', '$fecha', '$user', '1');");

        if (!mysqli_error($con))
        {
            echo '<script>location.href = "/sale_transfer.php?folio='.$folio.'"</script>';
        }else
        {
            echo '<script>location.href = "/sale_transfer.php?pagina=1"</script>';
        }
    }
?>