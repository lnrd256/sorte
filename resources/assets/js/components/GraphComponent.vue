<template>
    <div>
        <loading v-if="historial.length==0 || mediciones.length==0 || pos.length==0" ></loading>
        <v-container grid-list-md text-xs-center v-else >
         <v-layout row >
            <v-flex xs5  v-for="i in 5" :key="`${i}`">
                <line-chart :serie1='historial[(i-1)*2]' :serie2='historial[(i*2)-1]'></line-chart>
                <div class="container" v-for="j in 2" :key="`${j}`">
                     <v-layout d-flex justify-center >
                        <v-menu offset-y absolute full-width v-for="variable in vars" v-if="variable.id==graphPositions[i*2-2+j-1].variable_id" :key="`${variable}`">
                            <v-card dark class="portrait " color="grey darken-3" slot="activator" v-if="j==2" >
                                <p class="texto-morado"> {{variable.nombre}}</p>
                                <h1 class=".display-3 mb-0 texto-morado" v-for="medicion in mediciones" v-if="medicion.variable_id==variable.id">
                                    {{medicion.valor}}
                                </h1>


                                <p class="align-left-c"></p>
                                <p class="align-center-c texto-morado" >{{variable.unidad_medida}}</p>
                                <p class="align-right-c"></p>
                            </v-card>

                            <v-card dark class="portrait" color="grey darken-3" slot="activator" v-else>
                                <p class="texto-amarillo">{{variable.nombre}}</p>
                                <h1 class=".display-3 mb-0 texto-amarillo"  v-for="medicion in mediciones" v-if="medicion.variable_id==variable.id">
                                    {{medicion.valor}}
                                </h1>


                                <p class="align-left-c"></p>
                                <p class="align-center-c texto-amarillo" >{{variable.unidad_medida}}</p>
                                <p class="align-right-c"></p>
                            </v-card>

                              <v-list>
                                <v-list-tile  @click="showMenu1(graphPositions[i*2-2+j-1].id)">
                                  <v-list-tile-title>Cambiar Variable</v-list-tile-title>
                                </v-list-tile>
                              </v-list>
                        </v-menu>
                      </v-layout>
                </div>
              </v-flex>
               <v-dialog v-model="dialog" max-width="290">
                  <v-card>
                    <v-list two-line>
                      <template v-for="(variable, index) in vars">
                        <v-list-tile avatar  @click="cambiarVar(variable.id)">

                          <v-list-tile-content>
                            <v-list-tile-title v-html="variable.nombre"></v-list-tile-title>

                          </v-list-tile-content>
                        </v-list-tile>
                      </template>
                    </v-list>
                  </v-card>
                </v-dialog>
            </v-layout>
        </v-container>
    </div>
</template>

<script>
import LoadingComponent from './LoadingComponent.vue'
import LineChart from './graphComponents/TimeChart.vue';
export default{
    components: {
        'loading':LoadingComponent,
        'line-chart':LineChart
    },
    props:['vars','pos'],
     data: () => ({
      historial:[],
      graphPositions:[],
      positions:[],
      dialog:false,
      showMenu:false,
      mediciones:[]
    }),
     methods:{
      getPositions:function(){
                  this.$http.get(this.$vars.getUrl()+'/api/positions').then(response=>{
                    this.positions=response.body;
                    this.onloaded();
                  })
              },
        onloaded:function(){
            let ids=[];


            this.positions.forEach((element,index)=>{
                if(element.tipo=='graph'){
                    ids.push(element.variable_id);
                }
            })
            this.graphPositions=this.positions.filter((element)=>{
                 if(element.tipo=='graph'){
                    return element
                }
            })
            ids=(this.unique(ids));
             this.$http.get(this.$vars.getUrl()+'/api/historial/',{params:{ids:ids}}).then(response=>{
                    this.historial=this.graphPositions.map((element,index)=>{
                        return response.body.filter((e)=>{
                            if(e.variable_id==element.variable_id){
                                return e.variable_id
                            }

                        })
                    })

            });
             this.$http.get(this.$vars.getUrl()+'/api/medicion/',{params:{ids:ids}}).then(response=>{
                    this.mediciones=(response.body)
            });


        },
        unique:function(array){
            return array.filter(function(el, index, arr) {
                return index == arr.indexOf(el);
            });
        },
        showMenu1:function(index){
            this.indice=index;
            this.dialog=true;
            console.log(index)
          },
          cambiarVar:function(id){
            this.dialog=false;
            this.$http.put(this.$vars.getUrl()+'/api/positions/'+this.indice,[],{params:{id:id}}).then(response=>{
                  this.getPositions();
                  this.loading=true

                });
          }
     },
     created(){

        this.positions=this.pos;
        this.onloaded();
        let interval=setInterval(()=> {
            if(this.$route.name!='graph'){
                clearInterval(interval)
            }
            this.onloaded()
        }, 15000);

     }

}
</script>