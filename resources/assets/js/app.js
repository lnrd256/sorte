
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
window.Vue = require('vue');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
import Vuetify from 'vuetify'
import VueRouter from 'vue-router';
//Graphs
// import AmCharts from 'amcharts3'
// import AmSerial from 'amcharts3/amcharts/serial'
import VueCharts from 'vue-charts'
import 'vuetify/dist/vuetify.min.css';

import App from './components/AppComponent';
import Variables from './components/VariablesComponent';
import Graph from './components/GraphComponent';
import DepthGraph from './components/DepthGraphComponent';
import Login from './components/LoginComponent'
import VueResource from 'vue-resource'
import Auth from './auth.js';
import Vars from './globalVariables.js'

Vue.use(VueResource);
Vue.use(Vuetify);
Vue.use(VueRouter);
Vue.use(Auth);
Vue.use(VueCharts);
Vue.use(Vars);

const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path:'/',
            name:'login',
            component:Login,
            meta:{forvisitors:true}
        },
    	{
    		path: '/vars',
            name: 'variables',
            component: Variables,
            meta:{forAuth:true}
    	},
        {
            path:'/depth',
            name:'depth',
            component:DepthGraph,
            meta:{forAuth:true}
        },
    	{
    		path: '/graph',
            name: 'graph',
            component: Graph,
            meta:{forAuth:true}
    	}
    ],
});
router.beforeEach(
    (to,from,next)=>{

        if(to.matched.some(record=>record.meta.forvisitors)){
            if(Vue.auth.isAuthenticated()){
                next({
                    path:'/vars'
                })
            }else{
                next()
            }
        }
        else if(to.matched.some(record=>record.meta.forAuth)){
            if(!Vue.auth.isAuthenticated()){
                next({
                    path:'/'
                })
            }else{
                next()
            }
        }

        else
            next()
    }
)
const app = new Vue({
    el: '#app',
    data:()=>({
        home:'http://localhost:8000'
    }),
    components: { App },
    router,
    props: {
      source: String
    }
});
