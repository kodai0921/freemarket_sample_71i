FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"あああ"}
    last_name             {"ああああ"}
    first_name_kana       {"カタカナ"}
    last_name_kana        {"カタカナ"}
    birth_date            {"2020-01-01"}
    tel                   {"0000000000"} 
  end

end