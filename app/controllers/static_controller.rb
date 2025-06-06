class StaticController < ApplicationController
  def index
    @example_names = [
      "Bruce",
      "John",
      "Diana",
      "Barry",
      "Rumplestiltskin",
    ]
  end

  def other_page
    
  end
end
