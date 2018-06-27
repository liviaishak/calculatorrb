class Calc
  @arrnum = []
  @array = []
  @result = []

    #convert string to integers
    def strToInt(string)
      operators = %w[* / + -]
      @arrnum = string.split("")
      @arrnum.each_with_index do |n, i|
        unless operators.include?(n)
          @arrnum[i] = n.to_i
        end
      end
      muldiv
    end

    #multiplication and division
    def muldiv
      @arrnum.each_with_index do |n, i|
        if n == '*'
          @array << n[i+1] * n[i-1]
        elsif n == '+'
          @array << '+'
        elsif n == '-'
          @array << '-'
        elsif n == '/'
          @array << n[i+1] / n[i-1]
        end
    end

    #addition and substraction
    def addsub
      @arrnum.each_with_index do |n, i|
        if n == '+'
          @result.push(0)
        elsif n == '-'
          a = @array.last - @arrnum[i+1]
          @result.pop
          @result.push(a)
        elsif @arrnum[i-1] == '-'
          @result.push(0)
        else
          @result.push(n)
        end
      end
     sumresult
    end

    #add all elements
    def sumresult
      sum = 0
      @result.each do |i|
        sum += i
      end
    sum
    end
end

answer = Calc.new
answer.strToInt("4*4")
