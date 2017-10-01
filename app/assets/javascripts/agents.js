/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      agents: [],
      newAgent: {
        field_name: '',
        deployment_date: '',
        base: ''
      },
      errors: [],
      searchName: '',
      searchBase: '',
      sortAttribute: 'field_name'
    },
    mounted: function() {
      $.get('/api/v1/agents').success(function(response) {
        console.log(response);
        this.agents = response;
      }.bind(this));
    },
    methods: {
      addAgent: function() {
        $.post('/api/v1/agents', this.newAgent).success(function(response) {
          this.agents.push(response);
          this.newAgent = {
            field_name: '',
            deployment_date: '',
            base: ''
          };
          this.errors = []
        }.bind(this)).fail(function(error) {
          console.log(error)
          this.errors = error.responseJSON.errors;
        }.bind(this));
      },
      conformsToSearch: function(agent) {
        return agent.field_name.toLowerCase().indexOf(this.searchName.toLowerCase()) > -1 && agent.base.toLowerCase().indexOf(this.searchBase.toLowerCase()) > -1;
      },
      toggleId: function(agent) {
        agent.id_visible = !agent.id_visible;
      },
      changeSortAttribute: function(sortAttribute) {
        this.sortAttribute = sortAttribute;
      }
    },
    computed: {
      modifiedAgents: function() {
        return this.agents.sort(function(agent1, agent2) {
          
            return agent1[this.sortAttribute].localeCompare(agent2[this.sortAttribute]); 
          
            
        }.bind(this));
      }
    }
  });
});