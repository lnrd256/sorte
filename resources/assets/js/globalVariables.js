export default function(Vue){
	data: () => ({

        variables:[],
        positions:[]
      })

	Vue.vars={
		getUrl(){
			return 'http://essatconsultores.com'
		},
		setVariables(value){
			this.variables=value
		},
		getVariables(){
			return this.variables;
		},
		setPositions(value){
			this.positions=value;
		},
		getPositions(){
			return this.positions;
		}
	}

	Object.defineProperties(Vue.prototype,{
		$vars:{
			get(){
				return Vue.vars;
			}
		}
	})
}