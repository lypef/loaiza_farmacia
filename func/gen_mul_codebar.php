<?php
    include 'db.php';
    include '../barcode/barcode.php';

    db_sessionValidarNO();
    
    // Dompdf php 7
    //require_once 'dompdf_php7.1/autoload.inc.php';
    //use Dompdf\Dompdf;

    // Dompdf php 5
    require_once("../dompdf_php5.6/dompdf_config.inc.php");

    $items = $_POST["items"];
    $con = db_conectar();

    $body_codes = "";

    for ($i = 0; $i < $items; $i++)
    {
        $exist = false;
        $codigo = $_POST["code".$i];
        
        $product_nombre = "";
        $product_precio = "";
        $product_descripcion = "";

        $data = mysqli_query($con,"SELECT nombre, descripcion, oferta, precio_normal, precio_oferta FROM productos  where `no. De parte` = '$codigo' ");
        while($row = mysqli_fetch_array($data))
        {
            $exist = true;
            $product_nombre = $row[0];
            $product_descripcion = $row[1];

            if ($row[2] == "1")
            {
                $product_precio = $row[4];
            }else
            {
                $product_precio = $row[3];
            }
        }

        if ($exist)
        {
            $ruta = '../barcode/' . $codigo . '.png';
            barcode($ruta, $codigo, 100, 'horizontal', 'code128', false);            

            $body_codes .= '
            <table style="border-collapse: collapse; width: 100%;" border="1">
                <tr>
                    <td>
                        <center>
                            <img src="'.$ruta.'" width="120" height="42" /><br>
                            '.$codigo.'
                        </center>
                    </td>
                </tr>
                
                <tr>
                    <td style="width: 100%; text-align: center; background-color:'.ColorBarrReport().'">
                    '.substr($product_nombre,0,22).' <b>$ '.number_format($product_precio,GetNumberDecimales(),".",",").'</b>
                    <br>'.substr($product_descripcion,0,40).'
                    </td>
                </tr>
            </table>
            ';
        }

    }
    
        //size: 5.08cm 2.54cm;
    $codigoHTML='
    <style>
    @page {
        size: 5.08cm 2.70cm;
        font-size: 9px;
        margin-top: 0.6em;
        margin-left: 0.4em;
        margin-right: 0.4em;
        margin-bottom: -0.4em;
    }
        </style>
        '.$body_codes.'
        ';
        
        $codigoHTML = mb_convert_encoding($codigoHTML, 'HTML-ENTITIES', 'UTF-8');
        $dompdf= new DOMPDF();
        $dompdf->set_paper('letter');
        $dompdf->load_html($codigoHTML);
        ini_set("memory_limit","128M");
        $dompdf->render();
        $dompdf->stream("codebar.pdf");
?>