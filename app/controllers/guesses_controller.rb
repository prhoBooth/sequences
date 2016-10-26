class GuessesController < ApplicationController

  def index

    @list = Guess.all

    @guess1 = params["first_number"].to_i
    @guess2 = params["second_number"].to_i
    @guess3 = params["third_number"].to_i

    g = Guess.new
    g.first_num = @guess1
    g.second_num = @guess2
    g.third_num = @guess3

    if @guess1 < @guess2 && @guess2 < @guess3
        @outcome = "Yes!"
      else
        @outcome = "No."
    end

    g.outcome = @outcome

    g.save

    render("guesses/index.html.erb")
  end

  def answer
    #params = ["rule"=>"user input"]
    @user_answer = params["rule"]
    render("guesses/answer.html.erb")
  end

  def clear

    @list = Guess.all

    @list.each do |i|
    i.destroy
    end

    @list = Guess.all

    render("guesses/index.html.erb")

  end


end
