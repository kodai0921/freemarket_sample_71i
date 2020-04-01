$(function () {
  // メソッドの定義
  var methods = {
    number: function (value, element) { // クレジットカードの正規表現
      return this.optional(element) || /^(4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|^(?:2131|1800|35\d{3})\d{11}$)$/i.test(value);
    },
    cvc: function (value, element) { //セキュリティコードの正規表現
      return this.optional(element) || /^[0-9]{3,4}\z/i.test(value);
    }
  }
  // メソッドの追加
  $.each(methods, function (key) {
    $.validator.addMethod(key, this);
  });
  // バリデーションの実行
  $("#charge-form").validate({
    // ルール設定
    rules: {
      "number": {
        required: true // 番号の入力有無チェック
      },

      "cvc": {
        required: true 
      }
    },

    // エラーメッセージの定義
    messages: {
      "number": {
        required: "番号を入力してください"
      },

      "cvc": {
        required: "番号を入力してください"
      },
    },
    errorClass: "invalid", // バリデーションNGの場合に追加するクラス名の指定
    errorElement: "p", // エラーメッセージの要素種類の指定
    validClass: "valid", // バリデーションOKの場合に追加するクラス名の指定
  });
  // 入力欄をフォーカスアウトしたときにバリデーションを実行
  $("#card_number, #cvc").blur(function () {
    $(this).valid();
  });
});