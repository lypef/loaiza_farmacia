<?php
    
    include 'db.php';
    db_sessionValidarNO();
    $con = db_conectar();  
    
    $id = $_POST['id'];
    $url = $_POST['url'];
    $estrategia = $_POST['estrategia'];
    
    
    if ($_POST['active'])
    {
        $active = 1;
    }else
    {
        $active = 0;
    }
    
    mysqli_query($con,"UPDATE `e_ventas` SET `estrategia` = '$estrategia', `active` = '$active' WHERE id = $id;");

    if (!mysqli_error($con))
    {
        echo '<script>location.href = "'.$url.'"</script>';
    }else
    {
        echo mysqli_error($con);   
    }
?>