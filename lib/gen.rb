class Gen
  def initialize
    @numbers = Array.new(4)
  end

  def gen_numbers
    @numbers.each_with_index do |number, index|
      number = rand(1..9)
      if @numbers[index-1] == number
        @numbers[index] = rand(1...number)
      else
        @numbers[index] = number
      end
        
    end
  end
  
end