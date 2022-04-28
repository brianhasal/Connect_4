c4_array = 
[
  ["1", "2", "3", "4", "5", "6", "7"], # 0
  ["-", "-", "-", "-", "-", "-", "-"], # 1
  ["-", "-", "-", "-", "-", "-", "-"], # 2
  ["-", "-", "-", "-", "-", "-", "-"], # 3
  ["-", "-", "-", "-", "-", "-", "-"], # 4
  ["-", "-", "-", "-", "-", "-", "-"], # 5
  ["-", "-", "-", "-", "-", "-", "-"], # 6
  ["-", "-", "-", "-", "-", "-", "-"], # 7
]




def make_board(array)
  array.each do |row|
    puts row.join
  end
end


def intro(array)
  magic_word = "board"
  next_method = false
  while next_method == false
    print "Please type in '#{magic_word}' to start: "
    input = gets.chomp.downcase
    if input_check(input, magic_word) == true
      next_method = true
    end
  end
  puts "Wonderful, let's start."
  make_board(array)
end


def input_check(user_input, magic_word)
  if user_input == magic_word
    bool = true
  else
    bool = false
  end
  return bool
end


def bool_switch(bool_in)
  if bool_in == false 
    return true
  else
    return false 
  end
end



def piece_dropper(array, column, piece)
  is_dropped = false
  updated_array = array
  r_index = (updated_array.length) - 1
  c_index = column - 1

  while r_index > -1 && is_dropped == false
    if updated_array[r_index][c_index] == "-"
      updated_array[r_index][c_index] = piece
      is_dropped = true
    else
      r_index -= 1
    end
  
  end
  if r_index == -1 && is_dropped == false
    return [updated_array, is_dropped]
  end

  return [updated_array, is_dropped]
end


def each_round(array, turn_bool)
  last_no = array[0].length
  x = "X"
  o = "O"
  piece = ""
  input_options = [*1..last_no]
  column = 0
  did_drop = false
  updated_array = array

  if turn_bool == false
    piece = x
    puts "Player One, it's your turn."
  else
    piece = o
    puts "Player Two, it's your turn."
  end


  while did_drop == false
    did_drop = true
    input_test = false
    while input_test == false
      print "Please enter a column to drop your piece (1 - #{last_no.to_s}): "
      user_input = gets.chomp

      if input_options.include?(user_input.to_i) == true
        input_test = true
      end
    end
    column = user_input.to_i
    results = piece_dropper(updated_array, column, piece)
    did_drop = results[1]
    updated_array = results[0]
  end

  make_board(updated_array)
  return updated_array

end



def vert_check(array, piece_type)
  vert_check = false

  while vert_check == false
    c_length = array[0].length
    r_length = array.length
    row = r_length - 1
    array_length = array[0].length
    max_row_length = array.length

    while row > -1
      column = c_length - 1

      while column > -1
        piece = array[row][column]
        r_2 = row - 1
        r_3 = row - 2
        r_4 = row - 3

        if piece == piece_type
          if array[r_2][column] == piece_type
            if array[r_3][column] == piece_type
              if array[r_4][column] == piece_type
                vert_check = true
              end
            end
          end 
        end
        column -= 1
      end
      row -= 1 
    end
    return vert_check
  end 
end




def horiz_check(array, piece_type)
  horiz_check = false

  while horiz_check == false
    c_length = array[0].length
    r_length = array.length
    row = r_length - 1
    array_length = array[0].length
    max_row_length = array.length

    while row > -1
      column = c_length - 1

      while column > -1
        piece = array[row][column]

        c_2 = column - 1
        c_3 = column - 2
        c_4 = column - 3

        if piece == piece_type
          if array[row][c_2] == piece_type
            if array[row][c_3] == piece_type
              if array[row][c_4] == piece_type
                horiz_check = true
              end
            end
          end
        end
        column -= 1
      end
      row -= 1 
    end
    return horiz_check
  end 
end




def lr_check(array, piece_type)
  lr_check = false

  while lr_check == false
    c_length = array[0].length
    r_length = array.length
    row = r_length - 1
    array_length = array[0].length
    max_row_length = array.length

    while row > -1
      column = c_length - 1

      while column > -1
        piece = array[row][column]
        c_2 = column + 1
        c_3 = column + 2
        c_4 = column + 3
        r_2 = row - 1
        r_3 = row - 2
        r_4 = row - 3

        if piece == piece_type
          if array[r_2][c_2] == piece_type
            if array[r_3][c_3] == piece_type
              if array[r_4][c_4] == piece_type
                lr_check = true
              end
            end
          end
        end
        column -= 1
      end
      row -= 1 
    end
    return lr_check
  end 
end




def rl_check(array, piece_type)
  rl_check = false

  while rl_check == false
    c_length = array[0].length
    r_length = array.length
    row = r_length - 1
    array_length = array[0].length
    max_row_length = array.length

    while row > -1
      column = c_length - 1

      while column > -1
        piece = array[row][column]
        c_2 = column - 1
        c_3 = column - 2
        c_4 = column - 3
        r_2 = row - 1
        r_3 = row - 2
        r_4 = row - 3

        if piece == piece_type
          if array[r_2][c_2] == piece_type
            if array[r_3][c_3] == piece_type
              if array[r_4][c_4] == piece_type
                rl_check = true
              end
            end
          end
        end
        column -= 1
      end
      row -= 1 
    end
    return rl_check
  end 
end




def win_check(array, bool_in)
  win_check = false
  piece_type = ""
  
  if bool_in == false
    piece_type = "X"
  elsif bool_in == true
    piece_type = "O"
  end

  if vert_check(array, piece_type) == true
    win_check = true
  elsif horiz_check(array, piece_type) == true
    win_check = true
  elsif lr_check(array, piece_type) == true
    win_check = true
  elsif rl_check(array, piece_type) == true
    win_check = true
  end

  return win_check

end





def c4(array)
  finished = false
  turn_bool = true
  updated_array = array
  puts "Welcome to Connect Four."
  intro(updated_array)
  
  while finished == false
    turn_bool = bool_switch(turn_bool)

    updated_array = each_round(updated_array, turn_bool)

    finished = win_check(updated_array, turn_bool)

  end

  if finished == true && turn_bool == false
    puts "Player One, you win!"
  elsif finished == true && turn_bool == true
    puts "Player Two, you win!"
  end
  p "The aristocrats"

end



c4(c4_array)



