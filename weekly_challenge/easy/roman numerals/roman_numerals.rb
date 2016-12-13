class Integer
  def to_roman
    m, remainder = self.divmod(1000)
    d, remainder = remainder.divmod(500)
    c, remainder = remainder.divmod(100)
    l, remainder = remainder.divmod(50)
    x, remainder = remainder.divmod(10)
    v, remainder = remainder.divmod(5)
    i = remainder
    
    output = ''
    m.times { output << 'M' }
    d.times { output << 'D' }
    c.times { output << 'C' }
    l.times { output << 'L' }
    x.times { output << 'X' }
    v.times { output << 'V' }
    i.times { output << 'I' }

    tenth_chars = ['I','X','C','M']
    fifth_chars = ['V','L','D']

    tenth_chars.each_with_index do |tenth, index|
        output.gsub!(tenth*4, "#{tenth}#{fifth_chars[index]}")
    end
    fifth_chars.each_with_index do |fifth, index|
        output.gsub!("#{fifth}#{tenth_chars[index]}#{fifth}", "#{tenth_chars[index]}#{tenth_chars[index+1]}")
    end
    output
  end
end