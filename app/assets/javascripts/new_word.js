$("#newWord").click(function(e) {
  e.preventDefault();

  $("#wordBody").hide();

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


$(".plus").click(function(e) {
  e.preventDefault();

  if ($("#wordBody").is(":hidden")) {
    $("#wordBody").show();
  } else {
    $("#wordBody").hide();
  }
});
