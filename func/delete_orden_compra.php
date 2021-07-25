<?php
    include 'db.php';
    
    $folio = $_POST['folio'];
    
    $con = db_conectar();  

    mysqli_query($con,"DELETE FROM order_buy WHERE folio = '$folio';");
    
    mysqli_query($con,"DELETE FROM order_buy_products WHERE folio = '$folio';");

    echo '<script>location.href = "/ordens_compra.php?pagina=1&process_yes=true"</script>';
    
?>