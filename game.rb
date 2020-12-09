require 'byebug'
# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand

    puts "Please enter a number."
    puts "0:グー, 1:チョキ, 2:パー"
    # Get what the player has entered in the variable "input_hand" and assign it.
      #Hint! Use the "gets method".
    input_hand = gets.to_i
    # 「input_hand」(取得した値)が「0, 1, 2」のいずれかだとwhileから脱出させ、それ以外だと初めから繰り返させます。
      # ヒント! 「while」と「if」を使用します。
      # 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう
        while true
        if input_hand == 0 || input_hand == 1 || input_hand == 2
          # 「input_hand」(取得した値)をそのまま返します。
        return input_hand
            # ヒント！ 「return」を使用します。
         else
          # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
      		puts "Please enter the number again."
        	puts "0: Goo, 1: Choki, 2: Par"
        	input_hand = gets.to_i
      end
    end
  end
end
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
      rand(0..2)
      # puts "#{enemy_hands} = Computer has choosed."
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{敵の生成した値}です。」と出力させます。
     puts "Player #{janken[enemy_hand]}"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。
      # 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう
      if player_hand == enemy_hand
      # if 条件を書く Playerクラスの戻り値(player_hand)とEnemyクラスの戻り値(enemy_hand)の値が同じだった場合
      # 「あいこ」を出力します。
       puts "Draw"
       return true
      #「true」を返してじゃんけんを繰り返し実行させます。
        # ヒント！ 「return」を使用します。
      elsif
    #  elsif もしも下記の組み合わせだった場合
      (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
      puts "You win"
      return false
      # 「あなたの勝ちです」を出力します。
      # whileを終了させる「false」を返してじゃんけんを終了させます。
    else
    #  else ※条件以外の場合
    puts "You lose."
    return false
      # 「あなたの負けです」を出力します。
      # whileを終了させる「false」を返してじゃんけんを終了させます。
    end
  end
end
# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new

# 変数「next_game」に「true」を代入します。※「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行するためです。
# 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう。
next_game = true
while next_game
    next_game = janken.pon(player.hand, enemy.hand)
end