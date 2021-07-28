<?php
    require_once 'func/db.php';
    // Dompdf php 7
    //require_once 'dompdf_php7.1/autoload.inc.php';
    //use Dompdf\Dompdf;

    // Dompdf php 5
    require_once("dompdf_php5.6/dompdf_config.inc.php");
    
    $folio = $_GET["folio"];

    $ColorBarr = ColorBarrReport();
    $Showiva = DesglosarReportIva();

    session_start();
    $usd = GetUsd();
    $con = db_conectar();  

    $venta = mysqli_query($con,"SELECT u.nombre, v.fecha, v.pagar, ( SELECT e.nombre from empresa e WHERE id = 1 ) as empresa, v.estatus FROM order_buy v, users u WHERE v.user = u.id and v.folio = '$folio'");
    $cont = 0; $first = true;

        while($row = mysqli_fetch_array($venta))
        {
            $vendedor = $row[0];
            $fecha_ini = $row[1];
            $cobrado = $row[2];
            $bodysucursal = $row[3] . '
            <br><span style="font-size: 14px;">RESPONSABLE: ' . $vendedor . '</span>';
            if ($row[4] == 1)
            {
                $orden_de_compra = 'ORDEN DE COMPRA FINALIZADA';
            }else
            {
                $orden_de_compra = 'ORDEN DE COMPRA PENDIENTE DE RECIBIR';
            }
        }
        

        $products = mysqli_query($con,"SELECT p.nombre, p.`no. De parte`, pp.pedir, pp.costo FROM order_buy_products pp, productos p WHERE pp.product = p.id and pp.folio = '$folio'");
        $body_products = '';

        while($row = mysqli_fetch_array($products))
        {
            if (!$row[6])
            {
                $ubicacion = substr($row[4],0,3) . ', ' . $row[5];
            }
            else
            {
                $ubicacion = Almacen_ubicacion_p_sub($row[6]);
            }

            $total_sin = $total_sin + ($row[2] * $row[3]);

            if ($Showiva)
            {
                $p_unitario = number_format($row[3] / 1.160000,GetNumberDecimales(),".",",");
                $p_total = number_format(($row[2] * $row[3]) / 1.160000,GetNumberDecimales(),".",",");
            }else
            {
                $p_unitario = number_format($row[3],GetNumberDecimales(),".",",");
                $p_total = number_format($row[2] * $row[3],GetNumberDecimales(),".",",");
            }

            

            if ($cont == 0)
        {
            $body_products .= '
            <table border="1" style="width:100%; border-collapse: collapse;">
            <tr>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">PEDIR</th> 
                <th bgcolor="'.$ColorBarr .'" style="width:50%; border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">PRODUCTO</th> 
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">P.U MXN</th>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">IMP MXN</th>
            </tr>
                <tr>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[2].'</center></td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">'.ucwords(strtolower(substr($asterisk.'('.$row[1].') '.$row[0], 0, 56))).'</td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.$p_unitario.'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.$p_total.'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            ';
        }

        if ($cont > 0)
        {
            $body_products .= '
            <tr>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[2].'</center></td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">'.ucwords(strtolower(substr($asterisk.'('.$row[1].') '.$row[0], 0, 56))).'</td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.$p_unitario.'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.$p_total.'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            ';
        }

        if ($first)
        {
            if ($cont == 30)
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
        

        $hijos = mysqli_query($con,"SELECT p.nombre, p.`no. De parte`, pp.pedir, pp.costo FROM order_buy_products pp, productos p, productos_sub h WHERE pp.hijo = h.id and p.id = h.padre and pp.folio = '$folio'");
        while($row = mysqli_fetch_array($hijos))
        {
            $total_sin = $total_sin + ($row[2] * $row[3]);

            if ($Showiva)
            {
                $p_unitario = number_format($row[3] / 1.160000,GetNumberDecimales(),".",",");
                $p_total = number_format(($row[3] * $row[2]) / 1.160000,GetNumberDecimales(),".",",");
            }else
            {
                $p_unitario = number_format($row[2],GetNumberDecimales(),".",",");
                $p_total = number_format($row[3] * $row[2],GetNumberDecimales(),".",",");
            }

            if ($cont == 0)
        {
            $body_products .= '
            <table border="1" style="width:100%; border-collapse: collapse;">
            <tr>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">PEDIR</th> 
                <th bgcolor="'.$ColorBarr .'" style="width:50%; border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">PRODUCTO</th> 
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">P.U MXN</th>
                <th bgcolor="'.$ColorBarr .'" style="border-right:1px solid '.$ColorBarr .';border-left:1px solid '.$ColorBarr .';border-bottom:1px solid black;border-top:1px solid '.$ColorBarr .'">IMP MXN</th>
            </tr>
            <tr>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[2].'</center></td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">'.ucwords(strtolower(substr($asterisk.'('.$row[1].') '.$row[0], 0, 56))).'</td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.$p_unitario.'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                <table border="0" width="100%">
                    <tr>
                        <td align="left"> $</td>
                        <td align="right">
                        '.$p_total.'
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
            ';
        }

        if ($cont > 0)
        {
            $body_products .= '
            <tr>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none"><center>'.$row[2].'</center></td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none">'.ucwords(strtolower(substr($asterisk.'('.$row[1].') '.$row[0], 0, 56))).'</td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.$p_unitario.'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="font-family: Arial, serif; font-size: small; border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top:none; text-align: right;">
                    <table border="0" width="100%">
                        <tr>
                            <td align="left"> $</td>
                            <td align="right">
                            '.$p_total.'
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
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


        $body_products .= 
        '
            </table>
        ';

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
                <td bgcolor="'.$ColorBarr.'" align="center"><strong>'.$orden_de_compra.'</strong></td>
            </tr>

            <tr>
                <td>
                    <table width="100%">
                        <tbody>
                            <tr>
                                <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><b>CREADO:</b> '.GetFechaText($fecha_ini).'</td>
                                <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><b>GENERADO:</b> '.GetFechaText(date("Y-m-d H:i:s")).'</td>
                                <td style="border-right: 1px solid black;border-left:1px solid black;border-bottom: 1px solid black;border-top: 1px solid black" align="center"><b>FOLIO:</b> '.$folio.'</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>

            </tbody>
        </table>        
        
        <br>
        '.$body_products.'
        ';
        
        $codigoHTML .= FooterPageReport();

        //echo $codigoHTML;
        
        $codigoHTML = mb_convert_encoding($codigoHTML, 'HTML-ENTITIES', 'UTF-8');
        $dompdf=new DOMPDF();
        $dompdf->set_paper('letter');
        $dompdf->load_html($codigoHTML);
        ini_set("memory_limit","515M");
        set_time_limit(200);
        $dompdf->render();
        $dompdf->stream("orden_compra".$_GET["folio"].".pdf");
        // Finaliza reporte <normal></normal>
?>