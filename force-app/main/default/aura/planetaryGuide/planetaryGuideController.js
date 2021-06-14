({    
  
  doInit: function(component, event, helper) {
    var action = component.get("c.fetchLocationTotal");
    action.setCallback(this, function(data) {
      component.set("v.totalProjectsCount", data.getReturnValue());

    });

    $A.enqueueAction(action);
    
    //Get List Of All Individual Locations Mining Projects
    var action2 = component.get("c.fetchMiningProjects");

    action2.setCallback(this, function(data2) {
      component.set("v.totalCountsList", data2.getReturnValue());

    });

    $A.enqueueAction(action2);
      
      
      
      
  },
    
    
    
  handleSetActiveSectionZ: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "Z");
  },

  handleSetActiveSectionK: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "K");
  },

  handleSetActiveSectionJ: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "J");
  },

  handleSetActiveSectionI: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "I");
  },

  handleSetActiveSectionH: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "H");
  },

  handleSetActiveSectionG: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "G");
  },

  handleSetActiveSectionF: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "F");
  },

  handleSetActiveSectionE: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "E");
  },

  handleSetActiveSectionD: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "D");
  },

  handleSetActiveSectionC: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "C");
  },

  handleSetActiveSectionB: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "B");
  },

  handleSetActiveSectionA: function(cmp) {
    cmp.find("accordion").set("v.activeSectionName", "A");
  }

});