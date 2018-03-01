<template>
	<vue-highcharts :options="options"  ref="lineCharts" style="min-width: 20px; height: 400px; max-width: 80%; margin: 0 auto"></vue-highcharts>
</template>

<script>
import VueHighcharts from 'vue2-highcharts'
export default{

    props:['serie1','serie2'],
	components:{
		VueHighcharts,

	},
	data(){
      return{
        showMenu: false,
        options: {
            colors: ['#2b908f', '#90ee7e', '#f45b5b', '#7798BF', '#aaeeee', '#ff0066',
      '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
        chart: {
             zoomType: 'x',
                type: 'spline',
                inverted: true,
                backgroundColor: {
         linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
         stops: [
            [0, '#2a2a2b'],
            [1, '#3e3e40']
         ]
      },
      style: {
         fontFamily: '\'Unica One\', sans-serif'
      },
      plotBorderColor: '#606063'
            },
        title: {
            text: ''
        },
        xAxis: {
            reversed: true,		scrollbar: {
		            enabled: true
		        },
            type: 'datetime',
            dateTimeLabelFormats : {
                    hour: '%I %p',
                    minute: '%I:%M %p'
                },
        },
        yAxis: {
            scrollbar: {
            enabled: true
        },
            title: {
                text: ''
            },
            labels: {
                format: '{value}'
            },
            lineWidth: 2
        },
        legend: {
            enabled: false
        },
        tooltip: {
            headerFormat: '<b>{series.name}</b><br/>',
            pointFormat: '{point.x:%I:%M %p}: {point.y}'
        },
        plotOptions: {
            series: {
                animation: {
                    duration: 20,
                    easing: 'easeOutBounce'
                }
            },

                spline: {
            marker: {
                enabled: true
            }
        }
            },
        series: []
        },
      }
    },
    methods:{
        setPositions(){
            let serie1=[];
            let serie2=[];
            this.serie1.forEach((element)=>{
                 let t=element.fecha_medida.split(/[- :]/);
                serie1.push([Date.UTC(t[0], t[1]-1, t[2], t[3], t[4], t[5]),parseInt(element.valor)])
                // serie2.push([,parseInt(element.valor)])
            })


            let lineCharts = this.$refs.lineCharts;

            lineCharts.addSeries({
                            name: 'profundidad',
                            data: serie1,
                            color:'#F4FF81'
                        })
            this.serie2.forEach((element)=>{
                let t=element.fecha_medida.split(/[- :]/);
                serie2.push([Date.UTC(t[0], t[1]-1, t[2], t[3], t[4], t[5]),parseInt(element.valor)])
                // serie2.push([,parseInt(element.valor)])
            })
            lineCharts.addSeries({
                            name: 'unidad',
                            data: serie2,
                            color: '#9C27B0'
                        })

        }
    },
    mounted(){
        this.setPositions();

    },
    watch: {
    serie1: function(newVal, oldVal) { // watch it
        let lineCharts = this.$refs.lineCharts;
        lineCharts.removeSeries()
      this.setPositions()
    }
  }

}
</script>