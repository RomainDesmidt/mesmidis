$(document).ready(function() {
  $('select').material_select();
});

$("#card-alert .close").click(function(){$(this).closest("#card-alert").fadeOut("slow")});

$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal').modal();
  });

$(document).ready(function(){
    $('.collapsible').collapsible();
  });
