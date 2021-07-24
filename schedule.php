<?php
    include 'func/header.php';
    $eventos = get_InstalacionesJSon($_GET['folio_edit']);
?>


<!-- Start page content -->
<section id="page-content" class="page-wrapper">
<!-- Start Product List -->
<div class="product-list-tab">
    <div class="container">
    
      <div class="row">
        <div class="col-md-12">
          <div class="panel-group" id="accordion1" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
                  <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne">
                    CALENDARIO DE INSTALACIONES
                    </a>
                  </h4>
                </div>
                <div id="collapseOne1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                  
                <center><div id="calendar"></div></center>

                </div>

              </div>
            </div>
          </div>
        </div>
        

    </div>
</div>
</section>
<!-- End page content -->



    <!-- page specific plugin scripts -->
    <link rel='stylesheet' href='/static/fullcalendar/fullcalendar.css' />
    <script src="/static/js/fullcalendar.min.js"></script>
    <script src="/static/js/moment.min.js"></script>
    <script src='/static/fullcalendar/fullcalendar.js'></script>
    <script src='/static/fullcalendar/locale/es.js'></script>



		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {

    /* initialize the external events
    -----------------------------------------------------------------*/

    $('#external-events div.external-event').each(function() {

      // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
      // it doesn't need to have a start or end
      var eventObject = {
        title: $.trim($(this).text()) // use the element's text as the event title
      };

      // store the Event Object in the DOM element so we can get to it later
      $(this).data('eventObject', eventObject);

      // make the event draggable using jQuery UI
      $(this).draggable({
        zIndex: 999,
        revert: true,      // will cause the event to go back to its
        revertDuration: 0  //  original position after the drag
      });
      
    });
    
    /* initialize the calendar
    -----------------------------------------------------------------*/
    var calendar = $('#calendar').fullCalendar({
      
      buttonHtml: {
        prev: '<i class="ace-icon fa fa-chevron-left"></i>',
        next: '<i class="ace-icon fa fa-chevron-right"></i>'
      },
    
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month timeGridWeek'
      },
      events: <?php echo $eventos; ?>,
      editable: false,
      droppable: false,
      selectable: true,
   
      selectHelper: true,
      
      select: function(start, end, allDay) {
        
        //display a modal
        var timestamp = start;
        var date = new Date(timestamp);
        date.setDate(date.getDate() + 1);
        var select = date.getFullYear();

        if ((date.getMonth()+1) < 10) { select = select + "-0"+(date.getMonth()+1); }
        else { select = select + "-" +(date.getMonth()+1); }

        if (date.getDate() < 10) { select = select + "-0"+ date.getDate(); }
        else { select = select + "-"+ date.getDate(); }

        select = select + "T";

        if (date.getHours() < 10) { select = select + "0"+ date.getHours(); }
        else { select = select + ""+ date.getHours(); }

        if (date.getMinutes() < 10) { select = select + ":0"+ date.getMinutes(); }
        else { select = select + ":"+ date.getMinutes(); }

        if (date.getSeconds() < 10) { select = select + ":0"+ date.getSeconds(); }
        else { select = select + ":"+ date.getSeconds(); }

        
        var folio = <?php echo $_GET["folio"]; ?>;
        
        var folio_edit = <?php echo $_GET["folio_edit"]; ?>;

        if (folio != "0")
        {
          document.getElementById('asignar_fecha').value = select;
          $("#asignar").modal()
        }

        if (folio_edit != "0")
        {
          document.getElementById('asignar_fecha_edit').value = select;
          $("#folio_edit").modal()
        }

        
        
      },

      eventClick: function(calEvent, jsEvent, view) {
        openModal(calEvent);
      }
      
    });


  })

</script>

<script type="text/javascript">

  function openModal(evento){
    $('#edit'+evento.folio).modal('show');
  }
</script>

<?php
    include 'func/footer.php';
    echo table_schedule_modal();
?>
        
<div class="modal fade" id="asignar" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
<div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Asignar Instalacion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="func/sale_update_schedule.php" method="post" autocomplete="off">	
        
        <input type="hidden" id="folio" name="folio" value="<?php echo $_GET["folio"]; ?>">
        <input type="hidden" id="url" name="url" value="<?php echo $_SERVER['REQUEST_URI']; ?>">
        <input type="datetime-local" id="asignar_fecha" name="asignar_fecha" value="">
            
      </div>
      <div class="modal-footer">
         <br>
         <button type="submit" class="btn btn-warning">CONFIRMAR</button>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="folio_edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
<div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Asignar Instalacion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="func/sale_update_schedule.php" method="post" autocomplete="off">	
        
        <input type="hidden" id="folio" name="folio" value="<?php echo $_GET["folio_edit"]; ?>">
        <input type="hidden" id="url" name="url" value="<?php echo $_SERVER['REQUEST_URI']; ?>">
        <input type="datetime-local" id="asignar_fecha_edit" name="asignar_fecha" value="">
            
      </div>
      <div class="modal-footer">
         <br>
         <button type="submit" class="btn btn-warning">CONFIRMAR</button>
        </form>
      </div>
    </div>
  </div>
</div>

<?php 
if ($_GET["folio"])
{
  echo "<script>alert('Seleccione Una fecha de instalacion')</script>";
}

if ($_GET["folio_edit"])
{
  echo "<script>alert('Seleccione Una NUEVA fecha de instalacion')</script>";
}
?>;