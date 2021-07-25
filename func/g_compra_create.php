<?php
    include 'db.php';
    db_sessionValidarNO();
    session_start();
    
    if ($_SESSION['token'] == GetToken())
    {
        $con = db_conectar();  

        $folio = date("YmdHis");
        $user = $_SESSION['users_id'];
        $fecha = date("Y-m-d H:i:s");

        $products_all = $_POST['arreglo_products'];
        $products_cont = $_POST['_productos_total'];
        $products_pagar = $_POST['_productos_pagar'];
        
        mysqli_query($con,"INSERT INTO `order_buy` (`folio`, `user`, `fecha`, `unidades`, `pagar`, `estatus`) VALUES ('$folio', '$user', '$fecha', '$products_cont', '$products_pagar', 0);");

        $products_arr = explode("|||", $products_all);

        foreach ($products_arr as $valor) {
            $tmp = "";
            $tmp = explode(",", $valor);
            
            if ($tmp[2] > 0)
            {
                mysqli_query($con,"INSERT INTO `order_buy_products` (`folio`, `product`, `hijo`, `pedir`, `almacen`, `costo`) VALUES ('$folio', '$tmp[0]', '$tmp[1]', '$tmp[2]', '$tmp[3]', '$tmp[4]');");
            }
        }
        
        echo '<script>location.href = "/ordens_compra.php?pagina=1&folio='.$folio.'&process_yes=true"</script>';
        
    }
?>