<?php
    include 'func/db.php';
    db_sessionValidarNO();
    session_start();
    
    if ($_SESSION['token'] == GetToken())
    {
        $prospectos = "";
        
        $con = db_conectar(); 
        $clientes = mysqli_query($con,'SELECT nombre, telefono FROM `clients` WHERE prospecto = 1 and telefono != "" and telefono is not null');
    
        while($row = mysqli_fetch_array($clientes))
        {
            $numero = str_replace(" ","",str_replace("+","",$row[1]));
            
            $prospectos .= $row[0].",".$numero."<br>";
        }
    
        echo $prospectos;
    }else
    {
        echo '<script>location.href = "/"</script>';
    }
?>