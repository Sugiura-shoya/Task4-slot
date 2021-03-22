@coin = 100

@point = 0

@sentaku = ["10コイン", "30コイン", "50コイン", "やらない"]

def slot
  
  if @coin <= 0
    return 5
  end

  print "-----------------\n"
  print "残りコイン数", @coin,"\n"
  print "ポイント", @point, "\n"
  print "何コイン入れますか？\n"
  for i in 0..3
      print i+1, "(", @sentaku[i], ") "
    end
  print "\n"
  print "-----------------\n"
  
  kakecoin = gets.chomp.to_i
  
  if kakecoin == 4
    return 4
  elsif kakecoin == 1
    kakecoin = 10
  elsif kakecoin == 2
    kakecoin = 30
  else
    kakecoin = 50
  end
  
  if kakecoin > @coin
    return 6
  end
  
  print "Enterを3回押して下さい。\n"
  
  none = gets.chomp.to_i
  
  num0 = Array.new(3) { rand 1..9 }
  num1 = Array.new(3) { rand 1..9 }
  num2 = Array.new(3) { rand 1..9 }
  
  
  puts "-----------------"
  for i in 0..2
    print "|",num0[i], "|","|","|","\n"
  end
  
  none = gets.chomp.to_i
  
  puts "-----------------"
  for i in 0..2
    print "|",num0[i], "|",num1[i],"|","|","\n"
  end
  
  none = gets.chomp.to_i
  
  puts "-----------------"
  for i in 0..2
    print "|",num0[i], "|",num1[i],"|",num2[i],"|","\n"
  end
  
  print "\n"
  
  #point倍率
  a = 0
  
  puts "-----------------\n"
  
  
  for i in 0..2
    if(num0[i] == num1[i] && num0[i] == num2[i])
      case i
      when 0
        print "上に", num0[0], "が揃いました！\n"
        a+=1
      
      when 1
        print "真ん中に", num0[1], "が揃いました！\n"
        a+=1
        
      when 2
        print "下に", num0[2], "が揃いました！\n"
        a+=1
      
    else
      print "揃いませんでした。\n"
    end
    end
  end
  
  if a > 0
    @coin = @coin - kakecoin
    
    c = (kakecoin)*(a*2)
    
    po = (kakecoin)*(a*10)
    
    print c, "コインを獲得!\n"
    print po, "ポイント獲得!\n"
    
    @coin = @coin + c
    @point = @point + po
  
  else
    print "コイン・ポイント獲得ならず...\n"
    @coin = @coin - kakecoin
  end
  
end

def loop_slot
loop do
  num = slot
  
  if num == 6
    print "コインが足りません。\n"
    print "入力し直して下さい。\n"
    loop_slot
  end
  
  if num == 5
    print "コインが無くなったため終了します。"
    break
  end
  
  if num == 4
    print "獲得コイン:", @coin, "コイン\n"
    print "獲得ポイント:", @point, "ポイント"
    break
  else
    slot
  end
end
end

loop_slot