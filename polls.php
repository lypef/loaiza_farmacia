<style>
	@media only screen and (max-width: 1024px) {
	
		#estadisticas td:nth-of-type(1):before {
			content: "ENCUESTAS";
      font-weight: bold;
      text-align: left;
		}

		
		#estadisticas td:nth-of-type(2):before {
			content: "ENCUESTADOS";
      font-weight: bold;
      text-align: left;
		}
		
		
		#estadisticas td:nth-of-type(3):before {
			content: "CUMPLIMOS";
      font-weight: bold;
      text-align: left;
		}
		

		#estadisticas td:nth-of-type(4):before {
			content: "REALIZAMOS";
      font-weight: bold;
      text-align: left;
		}

		
		#estadisticas td:nth-of-type(5):before {
			content: "ATENDIMOS";
      font-weight: bold;
      text-align: left;
		}

    #estadisticas td:nth-of-type(6):before {
			content: "TOTAL";
      font-weight: bold;
      text-align: left;
		}

    #estadisticas td:nth-of-type(7):before {
			content: "PROMEDIO";
      font-weight: bold;
      text-align: left;
		}

	}

</style>

<?php
    include 'func/header.php';
    
    $data = get_chartSurvey($_GET["desde"], $_GET["hasta"]);
?>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  
  // Grafrica
  google.charts.load('current', {packages: ['corechart', 'bar']});
  google.charts.setOnLoadCallback(drawStacked);

  function drawStacked() {
  var data = google.visualization.arrayToDataTable(<?php echo $data; ?>);

      var options = {
        title: 'Calificacion por cliente',
        height: 500,
        chartArea: {width: '55%'},
        isStacked: true,
        hAxis: {
          title: 'Tabulador',
          minValue: 0,
        },
        vAxis: {
          title: 'Clientes'
        }
      };
      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
      chart.draw(data, options);
      }
</script>

<!-- Start page content -->
<section id="page-content" class="page-wrapper">
<!-- Start Product List -->
<div class="product-list-tab">
    <div class="container">
        <div class="row">

          <div class="col-md-6 text-center">
              <label>DESDE</label><br>
              <input type="date" id="inicio" name="inicio" value="<?php echo $_GET["desde"]; ?>" style="text-align: center; height:40px; border: 2px solid #D9D7D7;" onchange="change_date();">
          </div>

          <div class="col-md-6 text-center">
              <label>HASTA</label><br>
              <input type="date" id="finaliza" name="finaliza" value="<?php echo $_GET["hasta"]; ?>" style="text-align: center; height:40px; border: 2px solid #D9D7D7;" onchange="change_date();">
          </div>

        </div>
        
        <div class="row">
        <br>
        <div class="col-md-12">
          <div class="panel-group" id="accordion0" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
              <?php echo survey_charts($_GET["desde"], $_GET["hasta"]); ?>
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
      /*select: function(start, end, allDay) {
        alert("Alerta");
      },*/
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

  function change_date ()
  {
    // inicio, finaliza
    var inicio = document.getElementById("inicio").value;
    var finaliza = document.getElementById("finaliza").value;

    window.location.href = "/polls.php?desde="+inicio+"&hasta="+finaliza;

  }

    if (getUrlVars()["yes_process"])
    {
        var body = "<div class='alert alert-success alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>Ben! </strong> Se respondio la encuesta con exito.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }

    if (getUrlVars()["no_process"])
    {
        var body = "<div class='alert alert-danger alert-dismissible show' role='alert'>";
        body +="<button type='button' class='close' data-dismiss='alert' aria-label='Close'>";
        body +="<span aria-hidden='true'>&times;</span>";
        body +="</button>";
        body +="<strong>Error! </strong>El proceso no se realizo con exito.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
</script>

<?php
    include 'func/footer.php';
    echo table_orders_modal();
?>
        
