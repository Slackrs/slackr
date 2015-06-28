$(function(){
  $('#date-picker').datepicker({ dateFormat: 'yy-mm-dd' });
  var $modal = $('#modal')
  var $overlay = $('#overlay')
  var $content = $('#content')
  var $close = $('#close')
  var close = function () {
    $modal.hide();
    $overlay.hide();
    $content.empty();
	}
	$close.click(function(e){
    e.preventDefault();
    close();
	})
});


function moveDiv() {
  var $span = $("#egggif");

  $span.fadeOut(100, function() {
      var maxLeft = $(window).width() - $span.width();
      var maxTop = $(window).height() - $span.height();
      var leftPos = Math.floor(Math.random() * (maxLeft + 1))
      var topPos = Math.floor(Math.random() * (maxTop + 1))

      $span.css({ left: leftPos, top: topPos }).fadeIn(100);
    });
  };



