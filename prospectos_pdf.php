<?php
    require_once 'func/db.php';
    
    // Dompdf php 7
    //require_once 'dompdf_php7.1/autoload.inc.php';
    //use Dompdf\Dompdf;

    // Dompdf php 5
    require_once("dompdf_php5.6/dompdf_config.inc.php");
    
    session_start();
    
    $con = db_conectar();  
    
     $sales = mysqli_query($con,"SELECT id, nombre, if (telefono = '', 'DESCONOCIDO', telefono) as telefono, if (correo = '', 'DESCONOCIDO', correo) as correo, interes, c_entero_nosotros FROM `clients` WHERE prospecto = 1 ORDER BY nombre ASC");

    
    $body = '';
    while($row = mysqli_fetch_array($sales))
    {
        $body = $body.'
        <tr>
        
        <td><p>'.$row[1].'</p></td>
        <td><p>'.$row[2].'</p></td>
        <td><p>'.$row[3].'</p></td>
        <td><p>'.$row[4].'</p></td>
        <td><p>'.$row[5].'</p></td>
        
        </tr>
        ';
    }
    
    $codigoHTML='
    
    <h1><center>'.$_SESSION['empresa_nombre'].'</center></h1>
    <h4><center>LISTA DE PROSPECTOS</center></h4>
    <hr width="50%">
    <table border="1" width="100%">
        <tr>
        <th>NOMBRE</th>
        <th>TELEFONO</th>
        <th>CORREO</th>
        <th>INTERES</th>
        <th>C. SE ENTERO</th>
        </tr>
        '.$body.'
    </table>
    <br><br>
    <br>
    ';
    
//    echo $codigoHTML;
    $codigoHTML = mb_convert_encoding($codigoHTML, 'HTML-ENTITIES', 'UTF-8');
    $dompdf=new DOMPDF();
    $dompdf->set_paper('legal', 'landscape');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("reporte_productos.pdf");
?>