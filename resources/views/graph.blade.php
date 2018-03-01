<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet"  href="css/app.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons' rel="stylesheet">
        <title>Laravel</title>

        <!-- Fonts -->
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {

      title:{
      text: "depth"
      },
       data: [
      {
        type: "line",

        dataPoints: [
        { x: 1, y: 00 },
        { x: 2, y: 114 },
        { x: 3, y: 120 },
        { x: 5, y: 260 },
        { x: 2, y: 350 },
        { x: 4, y: 400 },
        { x:6, y: 580 },
        { x: 2, y: 580 },
        { x: 6, y: 610 },
        { x: 2, y: 700 },
        { x: 10, y: 880 }
        ]
      }
      ],
      axisY: {

    suffix: " m",
    reversed: true
  }
    });

    chart.render();
  }
  </script>
    </head>
    <body>

        <div id="app">
     <v-card >
     <v-card-title class="blue white--text">
          <span class="headline">Menu</span>
          <v-spacer></v-spacer>
          <v-menu bottom left>
            <v-btn icon slot="activator" dark>
              <v-icon>more_vert</v-icon>
            </v-btn>
            <v-list>
              <v-list-tile>
               <a href="graph"> <v-list-tile-title href="graph">depth</v-list-tile-title></a>

              </v-list-tile>
              <v-list-tile>
                <a href="/"> <v-list-tile-title href="dd">Varss</v-list-tile-title></a>

              </v-list-tile>
              <v-list-tile>
                <v-list-tile-title>menu</v-list-tile-title>

              </v-list-tile>
            </v-list>
          </v-menu>
        </v-card-title>
    <v-app dark>


        <v-layout row wrap>
          <v-flex xs2>
            <div  class="bordered">
              <v-card-text class="px-0">12</v-card-text>
            </div>
          </v-flex>
          <v-flex xs3>


                <div  class="bordered">
                   <div id="chartContainer" style="height: 100%; width: 100%;"></div>
                </div>

            </v-flex>
            <v-flex xs3>


                <div  class="bordered">

                </div>

            </v-flex>
            <v-flex xs3>


                <div  class="bordered">

                </div>

            </v-flex>

        </v-layout>

    </v-app>
     </v-card>
  </div>
    </body>
    <script type="text/javascript" src="js/app.js"></script>
</html>
