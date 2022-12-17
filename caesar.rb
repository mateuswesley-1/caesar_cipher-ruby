def caesar_cipher(string, shift=0)

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
  down_range = 'a'..'y'
  up_range = 'A'..'Y'

  new_string = ''

  string.each_char do |letra|

    if down_range.include?(letra) || up_range.include?(letra)
      nova_letra = (letra.ord + shift).chr

    elsif (letra == 'z') || (letra == 'Z')
      nova_letra = (letra.ord - 25).chr
      
    end

    new_string << nova_letra

  end
  puts "#{string} ===> #{new_string}"
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

p caesar_cipher('zoi', 1)


