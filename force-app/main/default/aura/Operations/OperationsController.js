({
    init: function (cmp, event, helper) {
        helper.init(cmp);
    },
    
    itemSelected : function (cmp, event, helper) {
        helper.itemSelected(cmp, event);
    },
    
    goalSelected : function (cmp, event, helper) {
        helper.goalSelected(cmp, event);
    },
    
    updateClick : function (cmp, event, helper) {
        helper.updateClick(cmp, event);
    },
    
    cancelUpdateClick : function (cmp, event, helper) {
        helper.cancelUpdateClick(cmp, event);
    },
    
    deleteClick : function (cmp, event, helper) {
        helper.deleteClick(cmp, event);
    },
    
    createGoalClick : function (cmp, event, helper) {
        helper.createGoalClick(cmp, event);
    },
    
    cancelCreateClick : function (cmp, event, helper) {
        helper.cancelCreateClick(cmp, event);
    },
    
    submitCreateClick : function (cmp, event, helper) {
        helper.submitCreateClick(cmp, event);
    }
})