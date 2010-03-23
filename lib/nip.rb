class Nip
  def initialize(number)
    @number = number.to_s.gsub(/-/, '')
    @valid = validate
  end

  def to_s
    @number
  end

  def valid?
    @valid
  end

  private
    def validate
      has_proper_length and \
        contains_only_digits and \
        has_proper_control_digit
    end

    def has_proper_length
      @number.size == 10
    end

    def contains_only_digits
      @number =~ /^\d+$/
    end

    def weights
      [6, 5, 7, 2, 3, 4, 5, 6, 7]
    end

    def has_proper_control_digit
      digits = @number.split('').map { |i| i.to_i }
      i = 0; sum = 0
      digits[0..-2].each do |d| 
        sum += (d * weights[i])
        i += 1
      end
      ctrl = (sum % 11) % 10
      ctrl == digits[-1]
    end
end
