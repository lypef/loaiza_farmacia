<?php
    include 'db.php';
    db_sessionValidarNO();
    
    if ($_SESSION['token'] == GetToken())
    {
        session_start();
        $user = $_SESSION['users_id'];
        $creado = date("Y-m-d");
        
        $url = 'http://' .$_POST['url_web'] . $_POST['url'];
        $url = remove_url_query_args($url,array("client_add_noadd","client_add_noadd"));
        
        $nombre = strtoupper($_POST['nombre']);
        $telefono = strtoupper($_POST['telefono']);
        $correo = $_POST['correo'];
        $interes = $_POST['interes'];
        $c_entero_nosotros = $_POST['c_entero_nosotros'];
        $clasificacion = $_POST['clasificacion'];
        
        
        $con = db_conectar();  
        mysqli_query($con,"INSERT INTO `clients` (`c_entero_nosotros`,`interes`,`nombre`, `telefono`,`correo`,`descuento`,`prospecto`, `user`, `creado`, `clasificacion`) VALUES ('$c_entero_nosotros','$interes','$nombre', '$telefono','$correo',0,1,'$user', '$creado', '$clasificacion');");
    
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
            if (!mysqli_error($con))
            {
                echo '<script>location.href = "'.$url.'&client_add_add=true"</script>';
            }else
            {
                echo '<script>location.href = "'.$url.'&client_add_noadd=true"</script>';
            }
        }else
        {
            if (!mysqli_error($con))
            {
                echo '<script>location.href = "'.$url.'?client_add_add=true"</script>';
            }else
            {
                echo '<script>location.href = "'.$url.'?client_add_noadd=true"</script>';
            }
        }
    }
?>