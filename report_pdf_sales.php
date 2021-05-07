<?php
    require_once 'func/db.php';
    // Dompdf php 7
    //require_once 'dompdf_php7.1/autoload.inc.php';
    //use Dompdf\Dompdf;

    // Dompdf php 5
    require_once("dompdf_php5.6/dompdf_config.inc.php");
    session_start();
    
    $inicio = $_GET["inicio"] . ' 00:00:00';
    $finaliza = $_GET["finaliza"] . ' 23:59:59';
    $vendedor = $_GET["usuario"];
    $sucursal = $_GET["sucursal"];
    $folio = $_GET["folio"];
    $efectivo = 0;
    $transferencia = 0;
    $cheque = 0;
    $total = 0;
    $tarjeta = 0;
    $deposito = 0;

    $con = db_conectar();  
    if ($folio != "" && $vendedor == 0 && $sucursal == 0)
    {
        $data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.fecha_venta, f.t_pago, f.cobrado, c.correo FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.folio like '%$folio%'  order by f.fecha_venta desc ");
    }
    elseif ($folio == "" && $vendedor > 0 && $sucursal == 0)
    {
        $data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza' and f.vendedor = '$vendedor'  order by f.fecha_venta desc ");
    }
    elseif ($folio == "" && $vendedor == 0 && $sucursal > 0)
    {
        $data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza' and f.sucursal = '$sucursal'  order by f.fecha_venta desc ");
    }
    elseif ($folio == "" && $vendedor > 0 && $sucursal > 0)
    {
        $data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza' and f.sucursal = '$sucursal' and f.vendedor = '$vendedor'  order by f.fecha_venta desc  ");
    }
    else
    {
        $data = mysqli_query(db_conectar(),"SELECT f.folio, v.nombre, c.nombre, f.descuento, f.fecha, f.cobrado, f.fecha_venta, s.nombre, f.t_pago FROM folio_venta f, clients c, users v, sucursales s  WHERE f.vendedor = v.id and f.client = c.id and f.open = 0 and f.sucursal = s.id and f.fecha_venta >= '$inicio' and f.fecha_venta <= '$finaliza'  order by f.fecha_venta desc ");
    }

    
    $body = '';
    while($row = mysqli_fetch_array($data))
    {
        if (!empty($row[8]))
        {
            if ($row[8] == "efectivo")
            {
                $efectivo = $efectivo + $row[5];
            }
            elseif ($row[8] == "transferencia")
            {
                $transferencia = $transferencia + $row[5];
            }
            elseif ($row[8] == "deposito")
            {
                $deposito = $deposito + $row[5];
            }
            elseif ($row[8] == "tarjeta")
            {
                $tarjeta = $tarjeta + $row[5];
            }
            elseif ($row[8] == "cheque")
            {
                $cheque = $cheque + $row[5];
            }
                
            $body = $body.'
            <tr>
            <td class="item-des">'.$row[0].'</td>
            <td class="item-des"><p>'.$row[1].'</p></td>
            <td class="item-des"><p>'.$row[2].'</p></td>
            <td class="item-des"><p>'.$row[7].'</p></td>
            <td class="item-des"><p>'.GetFechaText($row[4]).'</p></td>
            <td class="item-des"><center><p>'.$row[3].' %</p></center></td>
            <td class="item-des"><center><p>$ '.$row[5].' MXN</p></center></td>
            <td class="item-des uppercase"><center><p>'.strtoupper($row[8]).'</p></center></td>
            </tr>
            ';
            $total = $total + $row[5];
        }
    }
    
    $codigoHTML='
    <h1><center>'.$_SESSION['empresa_nombre'].'</center></h1>
    <h3><center>'.$_SESSION['empresa_direccion'].'</center></h3>
    <h3><center>MAIL: '.$_SESSION['empresa_correo'].' | TEL: '.$_SESSION['empresa_telefono'].'</center></h3>
    <h4><center>LISTADO DE VENTAS : DESDE:'.$inicio.' | HASTA:'.$finaliza.'</center></h4>
    <hr>
    <br><br>
    <table style="width:100%">
        <tr>
        <th class="table-head th-name uppercase">FOLIO</th>
        <th class="table-head th-name uppercase">VENDEDOR</th>
        <th class="table-head th-name uppercase">CLIENTE</th>
        <th class="table-head th-name uppercase">SUCURSAL</th>
        <th class="table-head th-name uppercase">FECHA</th>
        <th class="table-head th-name uppercase">DESCUENTO</th>
        <th class="table-head th-name uppercase">COBRADO</th>
        <th class="table-head th-name uppercase">M. PAGO</th>
        </tr>
        '.$body.'
    </table>
    
    <br><br>
    <br>
    <div align="right">';
    
    if ($efectivo > 0)
		{
			$codigoHTML .= '
			<h5>Efectivo: $ '.number_format($efectivo,GetNumberDecimales(),".",",").' MXN</h5>
			';
		}

		if ($transferencia > 0)
		{
			$codigoHTML .= '
			<h5>Tranferencia: $ '.number_format($transferencia,GetNumberDecimales(),".",",").' MXN</h5>
			';
		}

        if ($tarjeta > 0)
		{
			$codigoHTML .=  '
			<h5>Tarjeta: $ '.number_format($tarjeta,GetNumberDecimales(),".",",").' MXN</h5>
			';
        }
        
		if ($deposito > 0)
		{
			$codigoHTML .= '
			<h5>Depositos: $ '.number_format($deposito,GetNumberDecimales(),".",",").' MXN</h5>
			';
        }

        if ($cheque > 0)
		{
			$codigoHTML .= '
			<h5>Cheques: $ '.number_format($cheque,GetNumberDecimales(),".",",").' MXN</h5>
			';
		}
    
    $codigoHTML .= '<h3>TOTAL RECAUDADO: $ '.number_format($total,GetNumberDecimales(),".",",").' MXN</h3>
    </div>
    <br>
    <footer>
      <center><p>CLTA DESARROLLO & DISTRIBUCION DE SOFTWARE<br><a href="https://www.cyberchoapas.com"> www.cyberchoapas.com</a></p></center>
    </footer>
    ';
    
    $codigoHTML = mb_convert_encoding($codigoHTML, 'HTML-ENTITIES', 'UTF-8');
    $dompdf=new DOMPDF();
    $dompdf->set_paper('letter', 'landscape');
    $dompdf->load_html($codigoHTML);
    ini_set("memory_limit","128M");
    $dompdf->render();
    $dompdf->stream("venta_ini".$_GET["inicio"]."_fin".$_GET["finaliza"].".pdf");
?>