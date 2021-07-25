<?php
    include 'func/header.php';
?>
<div class="col-md-12">
    <div class="row">
        <form action="g_compra.php">
            <div class="col-md-3 text-left">
                <label>Seleccione almacen</label><br>
                <select id="almacen" name="almacen">
                        <?php echo Select_Almacen_ALL() ?>
                </select>                                       
            </div>

            <div class="col-md-3 text-left">
                <label>Selecione marca</label><br>
                <select id="marca" name="marca">
                        <?php echo Select_Marca() ?>
                </select>                                       
            </div>

            <div class="col-md-3 text-left">
                <label>Selecione proveedor</label><br>
                <select id="proveedor" name="proveedor">
                        <?php echo Select_Proveedor() ?>
                </select>                                       
            </div>

            <div class="col-md-3 text-left">
                <button type="submit" style="
                width: 100%;
                background-color: #58ACFA;
                border: none;
                color: white;
                padding: 18px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 20px;
                margin: 4px 2px;
                cursor: pointer;
                ">Consultar</button>
            </div>
        </form>
    </div>
    <br>
    <?php  

        if (!$_GET["almacen"] && !$_GET["marca"] && !$_GET["proveedor"])
        {
            echo g_orden_compra_todos($_GET["almacen"], $_GET["marca"], $_GET["proveedor"]);
        }
        if ($_GET["almacen"] > 0 && !$_GET["marca"] && !$_GET["proveedor"])
        {
            echo g_orden_compra_almacen($_GET["almacen"], $_GET["marca"], $_GET["proveedor"]);
        }
        if (!$_GET["almacen"] && $_GET["marca"] && !$_GET["proveedor"])
        {
            echo g_orden_compra_marca($_GET["almacen"], $_GET["marca"], $_GET["proveedor"]);
        }
        if (!$_GET["almacen"] && !$_GET["marca"] && $_GET["proveedor"])
        {
            echo g_orden_compra_proveedor($_GET["almacen"], $_GET["marca"], $_GET["proveedor"]);
        }
        if ($_GET["almacen"] && $_GET["marca"] && !$_GET["proveedor"])
        {
            echo g_orden_compra_AlmacenMarca($_GET["almacen"], $_GET["marca"], $_GET["proveedor"]);
        }
        if ($_GET["almacen"] && !$_GET["marca"] && $_GET["proveedor"])
        {
            echo g_orden_compra_AlmacenProveedor($_GET["almacen"], $_GET["marca"], $_GET["proveedor"]);
        }
        if (!$_GET["almacen"] && $_GET["marca"] && $_GET["proveedor"])
        {
            echo g_orden_compra_MarcaProveedor($_GET["almacen"], $_GET["marca"], $_GET["proveedor"]);
        }
        if ($_GET["almacen"] && $_GET["marca"] && $_GET["proveedor"])
        {
            echo g_orden_compra_AlmacenMarcaProveedor($_GET["almacen"], $_GET["marca"], $_GET["proveedor"]);
        }        
        ?>
</div>  


<div class="col-md-12">

        <button style="width: 100%; height: 45px; " type="submit" data-toggle="modal" data-target="#create" class="btn btn-warning">Crear orden</button>	
</div>

<?php
    include 'func/footer.php';
?>
        
<div class="modal fade" id="create" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">CREAR ORDEN DE COMPRA ?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Se realizara la orden de compra de acuerdo a las unidades indicadas.</p>
        
        <form action="func/g_compra_create.php" autocomplete="off" method="post">

            <input type="hidden" id="arreglo_products" name="arreglo_products">
            <input type="hidden" id="_productos_total" name="_productos_total" value="0">
            <input type="hidden" id="_productos_pagar" name="_productos_pagar" value="0">
        
      </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
            <button type="submit" class="btn btn-warning" onclick="javascript:this.form.submit(); this.disabled= true;">CONFIRMAR</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script>

function generateArr()
{
    var cont = 1;
    var pedido = "";

    var pedido_total = 0;
    var pedido_pagar = 0;

    while (true) {
        if (document.getElementById("pedir_"+cont) != null)   
        {
            pedido_total +=  parseFloat(document.getElementById("pedir_"+cont).value.toString());

            pedido_pagar +=  (parseFloat(document.getElementById("costo_"+cont).value.toString()) * parseFloat(document.getElementById("pedir_"+cont).value.toString()));

            pedido += "|||";
            pedido += document.getElementById("product_"+cont).value + ",";
            pedido += document.getElementById("hijo_"+cont).value.toString() + ",";
            pedido += document.getElementById("pedir_"+cont).value.toString() + ",";
            pedido += document.getElementById("almacen_"+cont).value.toString() + ",";
            pedido += document.getElementById("costo_"+cont).value.toString();

            cont ++;
        }else { break; }
    }
    document.getElementById("arreglo_products").value = pedido 
    

    document.getElementById("productos_total").innerHTML = pedido_total + " UNIDADES";
    document.getElementById("productos_pagar").innerHTML = "<b>"+ number_format(pedido_pagar,2) +" Mxn</b>";

    document.getElementById("_productos_total").value = pedido_total;
    document.getElementById("_productos_pagar").value = pedido_pagar;

    
}

function number_format(amount, decimals) {

amount += ''; // por si pasan un numero en vez de un string
amount = parseFloat(amount.replace(/[^0-9\.]/g, '')); // elimino cualquier cosa que no sea numero o punto

decimals = decimals || 0; // por si la variable no fue fue pasada

// si no es un numero o es igual a cero retorno el mismo cero
if (isNaN(amount) || amount === 0) 
    return parseFloat(0).toFixed(decimals);

// si es mayor o menor que cero retorno el valor formateado como numero
amount = '' + amount.toFixed(decimals);

var amount_parts = amount.split('.'),
    regexp = /(\d+)(\d{3})/;

while (regexp.test(amount_parts[0]))
    amount_parts[0] = amount_parts[0].replace(regexp, '$1' + ',' + '$2');

return amount_parts.join('.');
}

generateArr();

</script>