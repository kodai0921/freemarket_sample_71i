class Condition < ActiveHash::Base
  self.data = [
    {id:1, name: "新品未使用"}, {id:2, name: "未使用に近い"}, {id:3, name: "目立った傷なし"},
    {id:4, name: "やや傷あり"}, {id:5, name: "めっちゃ傷だらけ"}
  ]
end