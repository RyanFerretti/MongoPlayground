$(document).ready(function() {
    $(".text_input").keydown(function() {
      $(this).siblings(":checked").each(function(){
          $(this).attr('checked', false);
      });
    });

    $(".radio_input").click(function() {
      var v = $(this).val();
      $(this).siblings(":input[type=text]").each(function(){
          $(this).val(v);
      });
    });

    $(".type_select").change(function() {
      var v = $(this).val();
      $(this).siblings(".dd_value").each(function(){
        if(v == "DropDown"){
          $(this).show();
        }
        else {
          $(this).hide();
        }
      });
      $(this).siblings(".calc_select").each(function(){
        if(v == "Calculation"){
          $(this).show();
        }
        else {
          $(this).hide();
        }
      });
    });



    $(".type_select").change();
});