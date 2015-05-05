$("#newWord").click(function(e) {
  e.preventDefault();

  var getWord = $.ajax({
    url: "/words",
    method: "GET",
    dataType: "json"
  });

  getWord.done(function(result) {
    $(".getWord").text(result.word);
    $(".getSpeechType").text(result.speech_type);
    $(".getDefinition").text(result.definition);
    $(".getSentence").text(result.sentence);
  });

});


$('#wordBody').click(function(e) {
  e.preventDefault();

  if ($('#image-upload').is(':hidden')) {
    $('#image-upload').slideDown('slow');
  } else {
    $('#image-upload').slideUp('slow');
  }
});
