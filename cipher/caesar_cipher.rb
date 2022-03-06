def caesar_cipher(text, offset)

    arrayText = text.split('')
    codedArray = []
    shiftedArray = []
    encodedArray = []
    encodedString = ''
    letters = ('a'..'z').to_a + ('A'..'Z').to_a
    
    arrayText.each do |letter|
      if (letters.include?(letter))
        codedArray.push(letter.ord())
      else
        codedArray.push(letter)
      end
    end
  
    codedArray.each do |char|
      if (char.to_i.between?(65, 90) or char.to_i.between?(97, 122))
        if(char.to_i.between?(97, 122))
          shiftedLetter = char + offset
          
          if(shiftedLetter > 122)
            shiftedLetter = shiftedLetter - 26
          end
  
          shiftedArray.push(shiftedLetter)
        elsif(char.to_i.between?(65, 90))
          shiftedLetter = char + offset
          
          if(shiftedLetter > 90)
            shiftedLetter = shiftedLetter - 26
          end
  
          shiftedArray.push(shiftedLetter)
        else
          next
        end
      else
        shiftedArray.push(char)
      end
    end
    
    shiftedArray.each do |enc|
      if(enc.to_i.between?(65, 90) or enc.to_i.between?(97, 122))
        encodedArray.push(enc.chr())
      else
        encodedArray.push(enc)
      end
    end
  
    encodedString = encodedArray.join('')
  
    puts 'Ciphered: ' + encodedString

end

three = 'This message is offset by three letters'
punctuation = 'This message has punctuation!'
offset = 'This message is offset by ten letters'

puts 'Original: ' + three
caesar_cipher(three, 3)

puts 'Original: ' + punctuation
caesar_cipher(punctuation, 3)

puts 'Original: ' + offset
caesar_cipher(offset, 10)
