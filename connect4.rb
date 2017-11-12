def makeGameBoard
  #defining an array that will contain the elements of the board
  game_board_array = [[1,2,3,4,5,6,7]]
  
  #Populating the array with empty slots
  for i in 0..5
  array_temp = ['#','#','#','#','#','#','#']
  game_board_array << array_temp
  i+=1
  end

  return game_board_array
end

#function to print board into console
def print_game_board(game_board)
  puts game_board[0].join(" | ")
  puts "-------------------------"
  puts game_board[1].join(" | ")
  puts "-------------------------"
  puts game_board[2].join(" | ")
  puts "-------------------------"
  puts game_board[3].join(" | ")
  puts "-------------------------"
  puts game_board[4].join(" | ")
  puts "-------------------------"
  puts game_board[5].join(" | ")
  puts "-------------------------"
  puts game_board[6].join(" | ")
end

#function to evaluate game
def evaluate_game(game_board)
  game_finished = false
    for i in 0..5
      
      if game_finished == true
        break
      end
       
        #Vertical and Horizontal evaluation to see if 4 are connected
        for j in 0..3
          if (game_board[i+1][j] == game_board[i+1][j+1]) && (game_board[i+1][j]==game_board[i+1][j+2]) && (game_board[i+1][j]==game_board[i+1][j+3])&&(game_board[i+1][j]=="X"||game_board[i+1][j]=="O") #rows
            puts "User " + game_board[i+1][j].to_s + " wins"
            game_finished = true
            break
          end
        end
        
    end
    
    for i in 0..6
        for j in 0..2 #columns
            if (game_board[j+1][i] == game_board[j+2][i]) && (game_board[j+1][i] == game_board[j+3][i])&&(game_board[j+1][i] == game_board[j+4][i])&&((game_board[j+1][i] == "X")||(game_board[j+1][i] == "O")) #columns
                puts "User " + game_board[j+1][i].to_s + " wins"
                game_finished = true
                break
            end
        end
    end
    
  #Evaluate if Diagonals have 4 connected
    for i in 1..6 #rows
      
      if game_finished == true
        break
      end
      
      for j in 0..6 #columns
     
      
        if (j<=3) #if it has 4 spaces to the right
          if (i>=4)#if it has 4 spaces up
            if(game_board[i][j]==game_board[i-1][j+1])&&(game_board[i][j]==game_board[i-2][j+2])&&(game_board[i][j]==game_board[i-3][j+3])&&((game_board[i][j] == "X")||(game_board[i][j] == "O"))
                puts "User " + game_board[i][j].to_s + " wins"
                game_finished = true
                break
            end
          end
          if (i<=3)#if it has 4 spaces down
            #Evalaution
              if(game_board[i][j]==game_board[i+1][j+1])&&(game_board[i][j]==game_board[i+2][j+2])&&(game_board[i][j]==game_board[i+3][j+3])&&((game_board[i][j] == "X")||(game_board[i][j] == "O"))
                puts "User " + game_board[i][j].to_s + " wins"
                game_finished = true
                break
              end
          end
        
        end
      
      
        if (j>3) #if it has 4 spaces to the left
          if (i>=4)#if it has 4 spaces up
            if(game_board[i][j]==game_board[i-1][j-1])&&(game_board[i][j]==game_board[i-2][j-2])&&(game_board[i][j]==game_board[i-3][j-3])&&((game_board[i][j] == "X")||(game_board[i][j] == "O"))
              puts "User " + game_board[i][j].to_s + " wins"
              game_finished = true
              break
            end
          end
          
          if (i<4) #if it has 4 spaces down
          #puts("Llega a segundo if<4")
            if(game_board[i][j]==game_board[i+1][j-1])&&(game_board[i][j]==game_board[i+2][j-2])&&(game_board[i][j]==game_board[i+3][j-3])&&((game_board[i][j] == "X")||(game_board[i][j] == "O"))
              puts "User " + game_board[i][j].to_s + " wins"
              game_finished = true
              break
            end
          end
          
        end
        
      end
    end
 
  return game_finished
  
end

#Initial variables
user_turn = 'X'
game_board = makeGameBoard
counter = 0
print_game_board(game_board)

#Loop to promt user to play
loop do
  
  #Evaluation if the game is over and no one won
  if (counter >= 36)
    puts "Game Over! No player won"
    break
  end
  
  puts "Your turn player " + user_turn
    
    counter_loop = 6
    possibilities = [0,1,2,3,4,5,6]
    
      puts "Select a column"
      column = gets.chomp!.to_i - 1
      include_bool = possibilities.include?column
      
      if include_bool == false
        puts 'Select a valid column!'
        next
      end
      
      #Take slot according to players choice
      loop do
        if (game_board[counter_loop][column] == "#")
          game_board[counter_loop][column] = user_turn
          break
            else
              counter_loop -= 1
        end
        if counter_loop == 0
          break
        end
      end
      
      if counter_loop == 0
        puts "Column full!"

        next
      end
    
    print_game_board(game_board)
  
  # Evaluate if theres a winner
  is_game_finished = evaluate_game(game_board)
  if is_game_finished == true
    puts 'Game over!'
    break
  end
  
  #If there's no winner yet, change player
  if user_turn == 'X'
    user_turn = 'O'
      else user_turn = 'X'
  end
  
counter += 1

end
