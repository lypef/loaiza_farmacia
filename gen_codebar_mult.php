<?php
    include 'func/header.php';
    $items = $_POST["number"];
?>

<div class="col-md-12">
  <div class="message-box box-shadow white-bg">
      <form id="contact-form" action="func/gen_mul_codebar.php" method="post" onsubmit="return validate(<?php echo $items; ?>)" autocomplete="off">
          <div class="row">
              <div class="col-md-12">
                  <div class="section-title text-uppercase mb-40">
                      <h4>Ingrese los codigos a generar</h4>
                  </div>
              </div>
              <input type="hidden" name="items" id="items" value="<?php echo $items; ?>">
              <?php 
                for ($i = 0; $i < $items; $i++)
                {
                    echo '
                    <div class="col-md-4">
                        <label>Codigo # '.($i+1).' </label>
                        <input type="text" name="code'.$i.'" id="code'.$i.'" placeholder="Esperando codigo ..." ">
                    </div>
                    ';
                }
              ?>
              <div class="country-select shop-select col-md-4">
                    <button class="submit-btn mt-20" type="submit" >Generar</button>
                </div>
          </div>
      </form>
  </div>
</div>

<script>

    function validate (items)
    {
        var r = true;

        for (var i = 0; i < items; i++) {
            if (document.getElementById("code"+i).value == "") {
                r = false;
                document.getElementById("code"+i).focus();
                break;
            }
        }
        return r;
    }
</script>

<?php
    include 'func/footer.php';
?>

