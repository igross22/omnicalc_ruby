class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ","").length

    @word_count = @text.split.count

    @occurrences = @text.downcase.split.count(@special_word)


  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    #P = L[c(1 + c)^n]/[(1 + c)^n - 1]
    # P = payment
    # L = loan (principal)
    # C = interest (apr)
    # N = years (years)


    @monthly_payment = (@apr / 1200 * @principal)/(1 - (1 + @apr / 1200)**-(@years * 12))

  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds =  @ending - @starting

    #use the approach from Your age in seconds

    @minutes = (@seconds)/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @weeks/52
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max.to_i - @numbers.min.to_i

        def median(array)
          sorted = array.sort
          len = sorted.length
          return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
        end

    @median = median(@numbers)

    @sum = @numbers.inject(:+)

        def mean(array)
            @numbers.inject(:+).to_f/@numbers.count.to_f
        end

    @mean = mean(@numbers)

    #def variance(array)
     #@numbers.each do |number|
       #mean = @numbers.inject(:+).to_i/@numbers.count.to_i)
       #difference = number.to_i-mean.to_i
       #difference.to_i * difference.to_i
       #not finished
     #end




    @variance = "enter"

    # VARIANCE
# ========
# To find the variance of a set,
#  - we find the mean of the set
#  - for each number in the set,
#   - we find the difference between the number and the mean
#   - we square the difference
#  - the variance is the mean of the squared differences

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

  end
end
