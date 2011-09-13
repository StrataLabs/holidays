class WelcomeController < ApplicationController
  def index
    @question = Question.where(:name => "landing").first
  end
end
