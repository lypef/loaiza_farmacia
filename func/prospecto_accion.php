<?php
    include 'db.php';
    db_sessionValidarNO();
    session_start();

    $cliente = $_POST['cliente'];
    $url = $_POST['url'];
    $propuesta = $_POST['propuesta'];
    $accion = $_POST['accion'];
    $fecha = date("Y-m-d H:i:s");
    $user = $_SESSION['users_id'];

    if ($_POST['realizada'])
    {
        $realizada = 1;
    }else
    {
        $realizada = 0;
    }

    if ($_POST['interesados'])
    {
        $interesados = 1;
    }else
    {
        $interesados = 0;
    }
    
    $con = db_conectar();  

    mysqli_query($con,"INSERT INTO `prospecto_acciones` (`id`, `cliente`, `propuesta`, `accion`, `realizada`, `interesados`, `fecha`, `user`) VALUES (NULL, $cliente, '$propuesta', '$accion', '$realizada', '$interesados', '$fecha', $user);");

    if (!mysqli_error($con))
    {
        for($i=0;$i<strlen($url);$i++)
        {
            if ($url[$i] == "?")
            {
                $addpregunta = true;
            }
        }
        if ($addpregunta)
        {
            echo '<script>location.href = "'.$url.'&update=true"</script>';
        }else{
            echo '<script>location.href = "'.$url.'?update=true"</script>';
        }
    }else
    {
        echo '<script>location.href = "/prospectos.php?pagina=1&noupdate=true"</script>';
    }

?>