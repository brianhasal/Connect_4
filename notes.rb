array = 
[
  ["1", "2", "3", "4", "5", "6", "7"], 
  ["O", "-", "-", "-", "-", "-", "p"], 
  ["o", "-", "-", "-", "-", "-", "P"], 
  ["O", "-", "-", "-", "-", "-", "p"], 
  ["o", "-", "-", "-", "-", "-", "P"], 
  ["O", "-", "-", "-", "-", "-", "p"], 
  ["o", "-", "-", "-", "-", "-", "P"], 
  ["X", "-", "-", "-", "-", "-", "pp"]
]

c4_array_v = 
[
  ["1", "2", "3", "4", "5", "6", "7"], # 0
  ["X", "-", "-", "-", "-", "-", "-"], # 1
  ["X", "-", "-", "-", "-", "-", "-"], # 2
  ["X", "-", "-", "-", "-", "-", "-"], # 3
  ["X", "-", "-", "-", "-", "-", "-"], # 4
  ["-", "-", "-", "-", "-", "-", "-"], # 5
  ["-", "-", "-", "-", "-", "-", "-"], # 6
  ["-", "-", "-", "-", "-", "-", "-"], # 7
]

c4_array_h = 
[
  ["1", "2", "3", "4", "5", "6", "7"], # 0
  ["-", "-", "-", "-", "-", "-", "-"], # 1
  ["-", "-", "-", "-", "-", "-", "-"], # 2
  ["-", "-", "-", "-", "-", "-", "-"], # 3
  ["-", "-", "-", "-", "-", "-", "-"], # 4
  ["-", "-", "-", "-", "-", "-", "-"], # 5
  ["-", "-", "-", "X", "X", "X", "X"], # 6
  ["-", "-", "-", "-", "-", "-", "-"], # 7
]

c4_array_lr = 
[
  ["1", "2", "3", "4", "5", "6", "7"], # 0
  ["-", "-", "-", "-", "-", "-", "-"], # 1
  ["-", "-", "-", "-", "-", "-", "-"], # 2
  ["-", "-", "-", "-", "-", "-", "X"], # 3
  ["-", "-", "-", "-", "-", "X", "-"], # 4
  ["-", "-", "-", "-", "X", "-", "-"], # 5
  ["-", "-", "-", "X", "-", "-", "-"], # 6
  ["-", "-", "-", "-", "-", "-", "-"], # 7
]

c4_array_rl = 
[
  ["1", "2", "3", "4", "5", "6", "7"], # 0
  ["-", "-", "-", "-", "-", "-", "-"], # 1
  ["-", "-", "-", "-", "-", "-", "-"], # 2
  ["X", "-", "-", "-", "-", "-", "-"], # 3
  ["-", "X", "-", "-", "-", "-", "-"], # 4
  ["-", "-", "X", "-", "-", "-", "-"], # 5
  ["-", "-", "-", "X", "-", "-", "-"], # 6
  ["-", "-", "-", "-", "-", "-", "-"], # 7
]



### this time, instead of creating exceptions for parameters outside of existence, use rescue / next

def win_check(array, bool_in)
  win_check = false
  piece_type = ""

  if bool_in == false
    piece_type = "X"
  elsif bool_in == true
    piece_type = "O"
  end


  # puts array[0].length
  # puts piece = array[0][0][0]

  row = 0
  while row < array.length
    column = 0
    while column < array[0].length
      p column
      piece = array[row][column]
      r_2 = row + 1
      r_3 = row + 2
      r_4 = row + 3
      c_2 = column + 1
      c_3 = column + 2
      c_4 = column + 3
      rc_2 = column - 1
      rc_3 = column - 2
      rc_4 = column - 3
      # puts piece
      # p array[row][column]


      if piece == piece_type
        # puts "Confirm 1"
        begin
          puts array[r_2][column]
          if array[r_2][column] == piece_type
            puts "Confirm 2"
            begin
              # puts array[r_3][column]
              if array[r_3][column] == piece_type
                puts "Confirm 3"
                begin
                  # puts array[r_4][column]
                  if array[r_4][column] == piece_type
                    puts "Confirm 4"
                    return win_check = true
                  end
                rescue
                  next
                end
              end
            rescue
              next
            end
#Diagonal L > R
          elsif array[r_2][c_2] == piece_type
            puts "Confirm 2"
            begin
              if array[r_3][c_3] == piece_type
                puts "Confirm 3"
                begin
                  if array[r_4][c_4] == piece_type
                    puts "Confirm 4"
                    return win_check = true
                  end
                rescue
                  next
                end
              end
            rescue
              next
            end
#Diagonal R > L
          elsif array[r_2][rc_2] == piece_type
            puts "Confirm 2"
            begin
              if array[r_3][rc_3] == piece_type
                puts "Confirm 3"
                begin
                  if array[r_4][rc_4] == piece_type
                    puts "Confirm 4"
                    return win_check = true
                  end
                rescue
                  next
                end
              end
            rescue
              next
            end

#Diagonal L > R
          elsif array[r_2][c_2] == piece_type
            puts "Confirm 2"
            begin
              if array[r_3][c_3] == piece_type
                puts "Confirm 3"
                begin
                  if array[r_4][c_4] == piece_type
                    puts "Confirm 4"
                    return win_check = true
                  end
                rescue
                  next
                end
              end
            rescue
              next
            end

#Horizontal
          elsif array[row][c_2] == piece_type
            puts "Confirm 2"
            begin
              if array[row][c_3] == piece_type
                puts "Confirm 3"
                begin
                  if array[row][c_4] == piece_type
                    puts "Confirm 4"
                    return win_check = true
                  end
                rescue
                  next
                end
              end
            rescue
              next
            end




          end
        rescue
          next
        end
        column += 1
      end
      

    end
    column = 0
    row += 1
    

  end
  return win_check

end

win_check(array, false)