require 'pry-byebug'




class CaesarCipher
  def translate(string, shift=0)

    # Classes that have just one value, so we can use .to_s
    primitive_classes = [Integer, Float, Symbol, TrueClass, FalseClass]

    # turn the input into a string
    string = any_to_string(string)

    # shift must be a Integer
    unless is_integer?(shift)
      raise "'shift' value must be integer"
      return
    end

    # letters range
    # the letter z is a special case
    down_range = 'a'..'z'
    up_range = 'A'..'Z'

    new_string = ''

    # Quando fazemos num%2, o resto n'ao e o codigo que a letra deveria ter,
    # mas sim quantas letras a partir da base teremos, ou seja, de quanto vai ser o shift

    string.each_char do |letra|

      base_char = down_range.include?(letra)? 'a':'A'

      if down_range.include?(letra) || up_range.include?(letra)
        nova_letra = (base_char.ord+((letra.ord - base_char.ord + shift)%26)).chr
      else
        nova_letra = letra
      end

      new_string << nova_letra
    end
    new_string
  end


  def is_integer?(string)
    begin
      Integer(string)
      return true
    rescue
      false
    end
  end

  # transform any primitive value into a string that we can use into
  # caesar_cipher
  def any_to_string(string)
    string = case string
    when String
      string
    when Array
      string.join
    when *primitive_classes
      string.to_s
    when NilClass
      string.inspect
    end
  end

end
