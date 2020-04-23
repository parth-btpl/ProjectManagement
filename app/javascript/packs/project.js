$('.datepicker').datetimepicker({
  format: 'Y-m-d',
  timepicker: false,
});

var Project = {
  validateProject: function(){
    $('#project_form').validate({
      errorElement: 'div',
      errorClass: 'is-invalid text-danger',
      rules: {
        "project[name]": {
          required: true,
        },
      },
      messages: {
        "project[name]": {
          required: 'Please enter project name',
        },
      }
    });
  },  
}