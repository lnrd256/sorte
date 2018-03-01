
    <template>

      <v-app id="inspire" dark>

        <div v-if="$route.name == 'login'">
           <router-view></router-view>
       </div>
        <div v-else-if="$route.name != 'login'">
          <v-navigation-drawer
          clipped
          fixed
          v-model="drawer"
          app
        >
          <v-list dense>
            <v-list-tile @click="">
              <v-list-tile-action>
              <router-link :to="{ name: 'variables' }"><v-icon>dashboard</v-icon></router-link>

              </v-list-tile-action>
              <v-list-tile-content>
                <router-link :to="{ name: 'variables' }"><v-list-tile-title>Variables</v-list-tile-title></router-link>

              </v-list-tile-content>
            </v-list-tile>
            <v-list-tile @click="">
              <v-list-tile-action>
                <router-link :to="{ name: 'graph' }"><v-icon>timer</v-icon></router-link>
              </v-list-tile-action>
              <v-list-tile-content>
                <router-link :to="{ name: 'graph' }"><v-list-tile-title>Time Graph</v-list-tile-title></router-link>
              </v-list-tile-content>
            </v-list-tile>
            <v-list-tile @click="">
              <v-list-tile-action>
                <router-link :to="{ name: 'depth' }"><v-icon>timeline</v-icon></router-link>
              </v-list-tile-action>
              <v-list-tile-content>
                <router-link :to="{ name: 'depth' }"><v-list-tile-title>Depth Graph</v-list-tile-title></router-link>
              </v-list-tile-content>
            </v-list-tile>
          </v-list>
        </v-navigation-drawer>
        <v-toolbar app fixed clipped-left>
          <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
          <v-toolbar-title>Application</v-toolbar-title>
        </v-toolbar>
        <v-content v-if="variables.length>0 && positions.length>0">
          <router-view :vars="variables" :pos="positions" ></router-view>
        </v-content>
        <v-content v-else>
          <loading ></loading>
        </v-content>
        <v-footer app fixed>
          <span>&copy; 2017</span>
        </v-footer>
       </div>

      </v-app>
    </template>

    <script>
    import LoadingComponent from './LoadingComponent.vue';
    export default {

      data: () => ({
        drawer: true,
        variables:[],
        positions:[]
      }),
      components:{
      'loading':LoadingComponent
    },
      methods:{

        getVariables(){
          this.$http.get(this.$vars.getUrl()+'/api/vars').then(response=>{
            this.variables=response.body;

          })
        },
        getPositions(){
            this.$http.get(this.$vars.getUrl()+'/api/positions').then(response=>{
              this.positions=response.body;
            })
        },


      },
       created(){
          this.getVariables();
          this.getPositions();
          this.$router.beforeEach((to, from, next) => {
            this.getVariables();
            this.getPositions();
           next()
          })
        }

    }
</script>