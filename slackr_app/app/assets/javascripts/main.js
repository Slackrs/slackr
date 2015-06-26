$(function(){
	$('#date-picker').datepicker()
})

// var searchDate = function(cohort_id, date){
// 	debugger
// 	$.ajax({
// 		url: "/cohorts/" + cohort_id + "/attendances/" + date,
// 		type: "GET",
// 		dataType: 'json',
// 		data: {
// 			cohort_id: cohort_id,
// 			date: date
// 		}
// 	}).done(function(response){
// 		console.log(response)
// 	});
// };

// $('li').click(function(){
//   var template = $("#editcard-temp").html();
// 	var id = $(this)[0].id
// 	var text = $(this).text();
//   $(this).text('');
//   // var editcard = Mustache.render(template, text);
//   $(template).appendTo($(this)).val(text).select().blur(".update",function(){
//       var newText = $(this).val();
//       $(this).parent().text(newText).find('textarea').remove();
//   editCard(id,newText);
//    });
// });

// $("#date-picker").keypress(function(e) {
// 		e.preventDefault();
//     if(e.which == 13) {
//     	debugger
//     	var date = $("#date-picker").val()
//     	var cohort_id = $("#cohort_id").val()
//         searchDate(cohort_id, date )
    // }
// });