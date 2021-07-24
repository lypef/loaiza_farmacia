<?php
    include 'db.php';
    db_sessionValidarNO();

    $estrategia = $_POST['estrategia'];

    $con = db_conectar();  
    mysqli_query($con,"INSERT INTO `e_ventas` (`id`, `estrategia`, `active`) VALUES (NULL, '$estrategia', '1');");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "../e_ventas.php?add=true"</script>';
    }else
    {
        echo '<script>location.href = "../e_ventas.php?noadd=true"</script>';
    }
    
?>