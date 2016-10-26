class GuessesController < ApplicationController

  def index
    @guess1 = params["first_number"].to_i
    @guess2 = params["second_number"].to_i
    @guess3 = params["third_number"].to_i

    if @guess1 < @guess2 && @guess2 < @guess3
        @outcome = "Yes"
      else
        @outcome = "No"
    end


    render("guesses/index.html.erb")
  end

  def answer
    #params = ["rule"=>"user input"]
    @user_answer = params["rule"]
    render("guesses/answer.html.erb")
  end

  def clear
  end


end
