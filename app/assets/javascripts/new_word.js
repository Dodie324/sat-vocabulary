$("#newWord").click(function(e) {
  e.preventDefault();

  var getWord = $.ajax({
    url: "/words",
    method: "GET",
    dataType: "json"
  });

  getWord.done(function(result) {
    debugger;
    $(".getWord").empty();
    $(".getWord").append(result.word)
  });

});
