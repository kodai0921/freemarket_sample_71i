FactoryBot.define do
  factory :addressinfo do
    first_name            {"あああ"}
    last_name             {"ああああ"}
    first_name_kana       {"カタカナ"}
    last_name_kana        {"カタカナ"}
    postcode              {"000-0000"}
    prefecture_code       {"東京都"}
    address_city          {"あああああ"}
    address_street        {"あああああ"}
    tel                   {"00000000000"}
  end
end
