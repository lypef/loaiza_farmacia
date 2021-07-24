<style>
	@media only screen and (max-width: 1024px) {
	
		#estadisticas td:nth-of-type(1):before {
			content: "CLIENTES";
      font-weight: bold;
      text-align: left;
		}

		
		#estadisticas td:nth-of-type(2):before {
			content: "VENTAS";
      font-weight: bold;
      text-align: left;
		}
		
		
		#estadisticas td:nth-of-type(3):before {
			content: "T. VENTAS";
      font-weight: bold;
      text-align: left;
		}
		

		#estadisticas td:nth-of-type(4):before {
			content: "PROMEDIO";
      font-weight: bold;
      text-align: left;
		}

		
	}

</style>

<?php
    include 'func/header.php';

    if ($_SESSION['full_graficas'] == 1) 
    {
      $chart = get_chartSales($_GET["desde"], $_GET["hasta"]);
      $money = get_chartSalesMoney($_GET["desde"], $_GET["hasta"]);
      $estrategia_admin = get_chartEstrategias_admin($_GET["desde"], $_GET["hasta"]);
    }
    $estrategia = get_chartEstrategias($_GET["desde"], $_GET["hasta"], $_GET["user"]);
?>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {

    var data0 = google.visualization.arrayToDataTable(
      <?php echo $chart; ?>
      );

    var options0 = {
      title: 'Numero de Ventas alcanzadas'
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));

    chart.draw(data0, options0);
  }
  
  // Produccion monetaria
  google.charts.setOnLoadCallback(drawBasic);
  function drawBasic() {

        var data1 = google.visualization.arrayToDataTable(<?php echo $money; ?>);

        var options1 = {
          title: 'Produccion monetaria',
          chartArea: {width: '50%'},
          hAxis: {
            title: '',
            minValue: 0
          },
          vAxis: {
            title: 'Vendedores'
          }
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

        chart.draw(data1, options1);
      }

      // Esatrategias admin
    google.charts.setOnLoadCallback(drawMultSeries_admin);
    function drawMultSeries_admin() {
      
      var data2_admin = google.visualization.arrayToDataTable(<?php echo $estrategia_admin; ?>);

          var options2_admin = {
            title: 'Estrategias de ventas implementadas',
            hAxis: {
              title: 'Estrategias',
              viewWindow: {
                min: [7, 30, 0],
                max: [17, 30, 0]
              }
            },
            vAxis: {
              title: 'Numero de ventas por estrategias'
            }
          };

          var chart = new google.visualization.ColumnChart(
            document.getElementById('chart_div_user_admin'));
            chart.draw(data2_admin, options2_admin);
        }

        // Grafica usuario
        google.charts.setOnLoadCallback(drawMultSeries);
        function drawMultSeries() {
          
          var data2 = google.visualization.arrayToDataTable(<?php echo $estrategia; ?>);

              var options2 = {
                title: 'Estrategias de ventas implementadas',
                hAxis: {
                  title: 'Estrategias',
                  viewWindow: {
                    min: [7, 30, 0],
                    max: [17, 30, 0]
                  }
                },
                vAxis: {
                  title: 'Numero de ventas por estrategias'
                }
              };

              var chart = new google.visualization.ColumnChart(
                document.getElementById('chart_div_user'));
                chart.draw(data2, options2);
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
              <?php echo estadisticas_global($_GET["desde"], $_GET["hasta"]); ?>
              </div>
            </div>
          </div>
        </div>
        
        <div class="row">
        <br>
        <div class="col-md-12">
          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
              <div class="panel panel-default">
                <?php echo estadisticas_user($_GET["desde"], $_GET["hasta"], $_GET["user"]); ?>
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
    var user = document.getElementById("user").value;

    window.location.href = "/dashboard.php?desde="+inicio+"&hasta="+finaliza+"&user="+user;


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
        body +="<strong>Error! </strong> Esta encuesta ya fue respondida.";
        body +="</div>";
        document.getElementById("message").innerHTML = body;
    }
</script>

<?php
    include 'func/footer.php';
    echo table_orders_modal();
?>
        
