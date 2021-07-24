<?php
    include 'db.php';
    session_start();

    if (ExistFolio($_POST['folio']))
    {
        $folio = $_POST['folio'];
        $cumplimos = $_POST['cumplimos'];
        $realizamos = $_POST['realizamos'];
        $atendimos = $_POST['atendimos'];
        $quejas = $_POST['quejas'];
        $fecha = date("Y-m-d H:i:s");
    
        $con = db_conectar();  
        
        if (!empty($folio) && !empty($cumplimos) && !empty($realizamos) && !empty($atendimos))
        {
            mysqli_query($con,"INSERT INTO `survey` (`folio`, `fecha`, `cumplimos`, `realizamos`, `atendimos`, `quejas`) VALUES ('$folio', '$fecha', '$cumplimos', '$realizamos', '$atendimos', '$quejas');");
        }else
        {
            echo '<script>location.href = "/survey_add.php?folio='.$folio.'&data_no=true"</script>';
        }
    
        if (!mysqli_error($con))
        {
            if (isset($_SESSION['users_id']))
            { 
                echo '<script>location.href = "/dashboard.php?desde='.date("Y-m-d").'&hasta='.date("Y-m-d").'&user='.$_SESSION['users_id'].'&yes_process=true"</script>';
            }
            else
            {
                echo '<script>location.href = "/?yes_process=true"</script>';
            }
        }else
        {
            if (isset($_SESSION['users_id']))
            { 
                echo '<script>location.href = "/dashboard.php?desde='.date("Y-m-d").'&hasta='.date("Y-m-d").'&user='.$_SESSION['users_id'].'&no_process=true"</script>';
            }
            else
            {
                echo '<script>location.href = "/?no_process=true"</script>';
            }
        }
    }else
    {
        echo '<script>location.href = "/?no_exist=true"</script>';
    }
?>