var DatePicker = {

  initDatePicker: function(){
    $('.datepicker').datetimepicker({
      format: 'Y-m-d',
      timepicker:false,
    });
  },
  setMinDate: function(minDate){
    $('.datepicker').datetimepicker({
      format: 'Y-m-d',
      timepicker: false,
      onShow: function (ct) {
        this.setOptions({
          minDate: minDate
        })
      }
    });
  }
};
