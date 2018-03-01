<template>
  <div>
    <loading v-if="mediciones.length==0 || historial.length==0 "></loading>
    <v-container grid-list-md text-xs-center v-else>
      <v-layout row wrap>
        <v-flex xs2 v-for="(item, index) in historial" :key='`${index}`' >
            <v-menu offset-y  absolute full-width v-for="variable in vars" v-if="variable.id==item.variable_id" :key='`${item.id}`'>
              <v-card dark class="portrait" color="grey darken-3" slot="activator">

                  <v-card-text class="px-0 texto-verde" >{{variable.nombre}}</v-card-text>
                  <v-card-text >
                        <h1 class=".display-3 mb-0" style="color:#64FFDA">{{mediciones[index].valor}}</h1>
                        <p class="align-left-c"></p>
                        <p class="align-center-c texto-verde">{{variable.unidad_medida}}</p>
                        <p class="align-right-c"></p>
                  </v-card-text>
                </v-card>

                <v-list>
                  <v-list-tile  @click="showMenu1(item.id);">
                    <v-list-tile-title>

                    Cambiar Variable

                  </v-list-tile-title>
                  </v-list-tile>
                </v-list>
            </v-menu>

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
import LoadingComponent from './LoadingComponent.vue';

 export default {
  props:['vars','pos'],
    components:{
      'loading':LoadingComponent
    },
    data: () => ({
      dialog:false,
      showMenu:false,
      loading:false,
      indice:0,
      mediciones:[],
      historial:[],
      positions:[]
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
              this.historial=this.positions.filter((element)=>{
                if(element.tipo=='main')
                  return element;
              })
              this.positions.forEach((element,index)=>{
                  if(element.tipo=='main'){
                      ids.push(element.variable_id);
                  }
              });

               this.$http.get(this.$vars.getUrl()+'/api/medicion/',{params:{ids:ids}}).then(response=>{
                      this.mediciones=(response.body)
                      this.loading=false;
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

      mounted(){
        this.positions=this.pos
        this.onloaded();
      }
  }
</script>