class BmiController < ApplicationController
  def index
    @title = 'BMI 計算機'
  end

  def result
    height = params[:body_height].to_f/100
    weight = params[:body_weight].to_f/100

    @bmi = (weight/(height*height)).round(2)
  end

 
end
