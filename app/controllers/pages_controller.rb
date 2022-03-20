class PagesController < ApplicationController
    def hello
        # render plain: "你好，世界!!"
        @name = 'hello world!!!'
        # render json:params
    end
end
