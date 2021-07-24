<?php
    require_once 'func/db.php';
    // Dompdf php 7
    //require_once 'dompdf_php7.1/autoload.inc.php';
    //use Dompdf\Dompdf;

    // Dompdf php 5
    require_once("dompdf_php5.6/dompdf_config.inc.php");
    
    $folio = $_GET["folio"];
    $_open = 0;
    $ColorBarr = ColorBarrReport();
    $Showiva = DesglosarReportIva();

    session_start();
    $usd = GetUsd();
    $con = db_conectar();  

    $venta = mysqli_query($con,"SELECT t.folio, t.fecha, u.nombre, if (t.open = 1, 'NO COMPLETADA','COMPLETADA') as open FROM traspasos t, users u WHERE t.user = u.id and t.folio = '$folio';");

    $cont = 0; $first = true;

    if (Ticket())
    {
        /////////////////////////////////
        /////////////////////////////////
        // Se imprimer reporte ticket ///
        /////////////////////////////////
        /////////////////////////////////

        $body_products = '
            <table style="border-collapse: collapse; width: 97.4865%; height: 100%;" border="0">
        ';

        while($row = mysqli_fetch_array($venta))
        {
            $vendedor = $row[2];
            $fecha_ini = $row[1];
            $_open = $row[3];
        }

        
        $products = mysqli_query($con,"SELECT t.id, t.folio_tranfer, p.nombre, t.unidades, s.nombre, p.id, 

        if (t.product_sub is null,
            (SELECT nombre FROM almacen WHERE id = p.almacen), 
            (SELECT aa.nombre FROM productos_sub ps, almacen aa WHERE ps.almacen = aa.id and ps.id = t.product_sub
        )) as origen 
        
        , p.precio_normal FROM product_trasnfer t, productos p, almacen s WHERE t.product = p.id and t.almacen_destino = s.id and t.folio_tranfer = '$folio';");
        
        $total_products = 0;

        while($row = mysqli_fetch_array($products))
        {
            $total_products = $total_products + $row[3];

            $body_products .= '
                <tr>
                <td style="width: 100%;">
                <table style="border-collapse: collapse; width: 100%; height: 100%;" border="1">
                <tbody>
                <tr>
                <td style="width: 100%; text-align: center;"><strong>PRODUCTO</strong></td>
                </tr>
                <tr>
                <td style="width: 100%;"><center>'.$row[2].'</center></td>
                </tr>
                </tbody>
                </table>
                </td>
                </tr>
                <tr>
                <td style="width: 100%;">
                <table style="border-collapse: collapse; width: 100%; height: 100%;" border="1">
                <tbody>
                <tr style="height: auto;">
                <td style="width: 25%; text-align: center; height: auto;"><strong>UNIDADES</strong></td>
                <td style="width: 25%; text-align: center; height: auto;"><strong>ORIGEN</strong></td>
                <td style="width: 25%; text-align: center; height: auto;"><strong>DESTINO</strong></td>
                <td style="width: 25%; text-align: center; height: auto;"><strong>PRECIO</strong></td>
                </tr>
                <tr style="height: auto;">
                <td style="width: 25%; height: auto;"><center>'.$row[3].'</center></td>
                <td style="width: 25%; height: auto;"><center>'.$row[6].'</center></td>
                <td style="width: 25%; height: auto;"><center>'.$row[4].'</center></td>
                <td style="width: 25%; height: auto;"><center> $ '.number_format($row[7],GetNumberDecimales(),".",",").'</center></td>
                </tr>
                </tbody>
                </table>
                </td>
            </tr>
            <tr></tr>
            ';
        }
        
        $body_products .= ' </table>';
        
        $codigoHTML='
        <style>
        
        
        @page {
            size: 8cm 40cm;
            font-size: 12px;
            margin-top: 0.1em;
            margin-left: 0.1em;
            margin-right: 0.1em;
            margin-bottom: 0.1em;
        }
        </style>
        <body>
        <center>
        <img src="'.ReturnImgLogo().'" alt="Membrete" height="auto" width="210">
        <br>
        <h2 style="display:inline;">'.$sucursal.'</h2>
        <br>'.$bodysucursal.'
        <br><br>
        <b>REZPONSABLE:</b> <br>'.$vendedor.'
        <br><br><b>ESTATUS:</b> <br>'.$_open.'
        <br><br><b>FECHA:</b> <br>'.GetFechaText($fecha_ini).'
        <br><b><br>FOLIO TRANFERENCIA:</b><br> '.$folio.'
        <br><br></center>
        '.$body_products.'
        <br><br><center>TOTAL TRANFERENCIAS: <strong>('.$total_products.')</strong><br></center>
        <br><br><center>____________________________________<br></center>
        <br><center>NOMBRE Y FIRMA DE RECIBIDO<br></center>
        ';
        
        $codigoHTML .= FooterPageReport();
        
        $codigoHTML = mb_convert_encoding($codigoHTML, 'HTML-ENTITIES', 'UTF-8');
        $dompdf=new DOMPDF();
        $dompdf->set_paper('letter');
        $dompdf->load_html($codigoHTML);
        ini_set("memory_limit","128M");
        $dompdf->render();
        $dompdf->stream("tranferencia".$_GET["folio_sale"].".pdf");
    }else
    {
        /////////////////////////////////
        /////////////////////////////////
        // Se imprimer reporte normal ///
        /////////////////////////////////
        /////////////////////////////////
        
        
        while($row = mysqli_fetch_array($venta))
        {
            $vendedor = $row[2];
            $fecha_ini = $row[1];
            $_open = $row[3];
        }


        $products = mysqli_query($con,"SELECT t.id, t.folio_tranfer, p.nombre, t.unidades, s.nombre, p.id, 

        if (t.product_sub is null,
            (SELECT nombre FROM almacen WHERE id = p.almacen), 
            (SELECT aa.nombre FROM productos_sub ps, almacen aa WHERE ps.almacen = aa.id and ps.id = t.product_sub
        )) as origen 
        
        , p.precio_normal FROM product_trasnfer t, productos p, almacen s WHERE t.product = p.id and t.almacen_destino = s.id and t.folio_tranfer = '$folio';");
        
        $total_products = 0; 
        
        

        while($row = mysqli_fetch_array($products))
        {
            $total_products = $total_products + $row[3];

            if ($cont == 0)
            {
                $body_products .= '
                <table border="1" style="width:100%; border-collapse: collapse;">
                <tr>
                    <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">PRODUCTO</th> 
                    <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">UNIDADES</th> 
                    <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">ORIGEN</th>
                    <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">DESTINO</th>
                    <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">PRECIO</th>
                </tr>
                <tr>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[2].'</center></td>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: center;">'.$row[3].'</td>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: center; ">'.$row[6].'</td>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: center;">'.$row[4].'</td>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: center;">$ '.number_format($row[7],GetNumberDecimales(),".",",").'</td>
                </tr>
                ';
            }

            if ($cont > 0)
            {
                $body_products .= '
                <tr>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[2].'</center></td>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: center;">'.$row[3].'</td>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: center; ">'.$row[6].'</td>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: center;">'.$row[4].'</td>
                    <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: center;">$ '.number_format($row[7],GetNumberDecimales(),".",",").'</td>
                </tr>
                ';
            }

        if ($first)
        {
            if ($cont == 26)
            {
                $cont = -1;
                $first = false;
                $body_products .= 
                '
                    </table>
                    <div style="page-break-after:always;"></div>
                ';
            }
        }else
        {
            if ($cont == 38)
            {
                $cont = -1;
                $body_products .= 
                '
                    </table>
                    <div style="page-break-after:always;"></div>
                ';
            }
        }

        $cont ++;
        }
        
        $body_products .= '</table>';
        
        $codigoHTML='
        <style>
        @page {
            margin-top: 0.7em;
            margin-left: 0.6em;
            margin-right: 0.6em;
            margin-bottom: 0.1em;
        }
        </style>
        <body>
        
        <table width="100%" border="0">
            <tr>
                <td width="35%">
                    <img src="'.ReturnImgLogo().'" alt="Membrete" height="auto" width="350">
                </td>

                <td>
                    <center>
                    <h2 style="display:inline;">'.$sucursal.'</h2>
                    <br>'.$bodysucursal.'
                    </center>
                </td>
            </tr>
        </table>
        
        <table style="height: 5px;" width="100%">
            <tbody>
            
            <tr>
                <td bgcolor="'.$ColorBarr.'" align="center"><strong>RESPONZABLE: </strong>'.strtoupper($vendedor).'</td>
            </tr>

            <tr>
                <td>
                    <table width="100%">
                        <tr>
                                <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><b>FECHA:</b> '.GetFechaText($fecha_ini).'</td>
                                <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><b>FOLIO TRANSFERENCIA:</b> '.$folio.'</td>
                            </tr>
                    </table>
                </td>
            </tr>

            </tbody>
        </table>        
        

        
        <table style="height: 5px;" width="100%">
                <tr>
                    <td>
                        <table width="100%">
                            <tbody>
                                <tr>
                                    <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><strong> TOTAL DE PRODUCTOS:</strong>'.$total_products.'</td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
        </table>
        '.$body_products.'
        ';
        
        $codigoHTML .= FooterPageReport();
        
        $codigoHTML = mb_convert_encoding($codigoHTML, 'HTML-ENTITIES', 'UTF-8');
        $dompdf=new DOMPDF();
        $dompdf->set_paper('letter');
        $dompdf->load_html($codigoHTML);
        ini_set("memory_limit","128M");
        $dompdf->render();
        $dompdf->stream("remision".$_GET["folio_sale"].".pdf");
        // Finaliza reporte normal
    }
?>