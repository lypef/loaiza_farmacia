<?php
    include 'db.php';
    db_sessionValidarNO();
    session_start();
    
    //if ($_SESSION['traspasos'] == 1)
    //{
        $folio = $vendedor . date("YmdHis");
        $fecha = date("Y-m-d H:i:s");
        $user = $_SESSION['users_id'];
        $concepto = $_POST['concepto'];
        
        $con = db_conectar();  
        mysqli_query($con,"INSERT INTO `salidas` (`folio`, `fecha`, `user`, `open`, `concepto`) VALUES ('$folio', '$fecha', '$user', '1', '$concepto');");

        if (!mysqli_error($con))
        {
            echo '<script>location.href = "/exit_sale.php?folio='.$folio.'"</script>';
        }else
        {
            echo '<script>location.href = "/exit_sale.php?pagina=1"</script>';
        }
    //}
?>