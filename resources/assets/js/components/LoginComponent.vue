<template>
  <div>

    <v-app id="inspire" >

      <v-content>
        <v-container fluid fill-height>
          <v-layout align-center justify-center>
            <v-flex xs12 sm8 md4>
              <v-card class="elevation-12">
                <v-toolbar dark color="primary">
                  <v-toolbar-title>Sorte International Services</v-toolbar-title>
                  <v-spacer></v-spacer>

                </v-toolbar>
                <v-card-text>

                <loading v-if="loading"></loading>
                  <v-form v-else>
                  <p style="color:#FF8A80" v-if="error">Error, combinación usuario y contraseña incorrecto</p>

                    <v-text-field v-model="username" prepend-icon="person" name="login" label="Login" type="text"></v-text-field>
                    <v-text-field v-model="password" prepend-icon="lock" name="password" label="Password" id="password" type="password"></v-text-field>
                  </v-form>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn @click="login" color="primary">Login</v-btn>
                </v-card-actions>
              </v-card>
            </v-flex>
          </v-layout>
        </v-container>
      </v-content>
    </v-app>
  </div>
</template>

<script>
import LoadingComponent from './LoadingComponent.vue';
  export default {
    components:{
      'loading':LoadingComponent
    },
    data: () => ({
      drawer: null,
      username:'',
      password:'',
      loading:false,
      error:false
    }),
    props: {
      source: String
    },
    methods:{
      login(){
        this.loading=true;
        let data={
          client_id:2,
          client_secret:'hrlBBDaRt8RXx7MWTMzuHpiCf143nbxEcsuYelsJ',
           grant_type: 'password',
          username:this.username,
          password:this.password
        }

        this.$http.post(this.$vars.getUrl()+'/oauth/token',data).then(response=>{

          if(response.body.access_token){
                    this.$auth.setToken(response.body.access_token,response.body.expires_in+Date.now())
                    this.$router.push('/vars');}

        }, response => {
            this.loading=false;
            this.error=true
          });
      }
    }
  }
</script>