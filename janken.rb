def main
 
 while !IsGameDecided()
 end
end

def IsGameDecided
 jankenResult = JankenResult()
 if jankenResult == 2
   puts "あいこで.."
   return false
 end

 if !IsAhoiDecided()
   puts "またまたじゃんけん..."
   return false
 end

 if jankenResult == 1
   puts "あなたの勝ちです！おめでとう"
 else
   puts "あなたの負けです・・・残念"
 end
 return true
end

def JankenResult
 puts "じゃんけん..."
 puts"0(グー)1(チョキ)2(パー)3(戦わない)"
 player_hand=gets.to_i
 choices = ["グー", "チョキ", "パー",]
 ShowStartMessage(choices)

 program_hand = rand(choices.size)
 ShowChoiceInfo(choices[player_hand], choices[program_hand])
 
if player_hand==3
    puts"じゃんけんが放棄されました。ゲームを終了します。"
    result = 3
  exit
end

 result = 0
 if player_hand == program_hand
   result = 2
 elsif ((player_hand == 0 && program_hand == 1) || (player_hand == 1 && program_hand == 2) || (player_hand == 2 && program_hand == 0))
   result = 1
 end
 return result
end

def IsAhoiDecided
 puts "あっち向いて・・・"
 puts"0(上)1(下)2(左)3(右)"
 player_direction=gets.to_i
 choices = ["上", "下", "左", "右"]
 ShowStartMessage(choices)

 program_direction = rand(choices.size)
 ShowChoiceInfo(choices[player_direction], choices[program_direction])

 return (player_direction == program_direction)
end

def ShowStartMessage(choices)
 numChoices = choices.size
 for i in 0..(numChoices-1) do
   puts i.to_s + "(" + choices[i] + ")"
 end
end

def ShowChoiceInfo(playerChoiceString, programChoiceString)
 puts "ホイ！"
 separator = "------------------------"
 puts separator
 puts "あなた：#{playerChoiceString}"
 puts "相手：#{programChoiceString}"
 puts separator
end

main()