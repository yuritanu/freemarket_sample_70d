$(function(){
  var form = $("#card_form");
    number = form.find(".form_contents__card_number__input"),
    cvc = form.find(".form_contents__security_code__input"),
    exp_month = form.find(".select_month"),
    exp_year = form.find(".select_year");

  $("#card_form").on("click", "#regist_card", function (e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
      number: number.val(),
      cvc: cvc.val(),
      exp_month: exp_month.val(),
      exp_year: exp_year.val()
    };

    Payjp.createToken(card, function (status, response) {

      if (response.error) {
        alert("入力内容に誤りがあります。ご確認の上、再度入力願います。");
        $('input[type=submit]').removeAttr("disabled");
      }
      else {
        $(".form_contents__card_number__input").removeAttr("name");
        $(".form_contents__security_code__input").removeAttr("name");
        $(".select_month").removeAttr("name");
        $(".select_year").removeAttr("name");

        var token = response.id;
        $("#card_form").append(`<input type="hidden" name="payjp-token" value=${token} />`)
        $("#card_form").get(0).submit();
      }
    });
  });
});