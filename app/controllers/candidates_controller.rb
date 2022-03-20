class CandidatesController < ApplicationController
    before_action :find_candidate, only: [:edit, :update, :destroy, :vote]

    def index
        # Candidate為Modal，故為單數
        @candidates = Candidate.all
    end
   
    # GET /candidates/new
    def new
        @candidate = Candidate.new
    end

    # def show
    # end
    # def show
    #     @candidate =  Candidate.find(params[:id])
    # end

    # 使用get方法
    def edit
        @candidate = Candidate.find_by(id: params[:id])
    end
    # edit後，使用post方法執行update
    def update
        @candidate = Candidate.find_by(id: params[:id])

        if @candidate.update(candidate_params)
        # 成功
        redirect_to candidates_path, notice: "資料更新成功!"
        else
        # 失敗
        render :edit
        end
        
    end
    # post /candidates
    def create
        @candidate = Candidate.new(candidate_params)
        if @candidate.save
            # 成功
            redirect_to candidates_path, notice: "新增候選人"
        else
            # 失敗
            render :new
        end
    end


    def destroy
        # @candidate = Candidate.find_by(id: params[:id])
        # @candidate.destroy if @candidate
        # redirect_to candidates_path, notice: "候選人資料已刪除!"
        @candidate.destroy if @candidate
        redirect_to candidates_path, notice: "候選人資料已刪除!"
      end

    def candidate_params
        params.require(:candidate).permit(:name, :age, :party, :politics)
    end
    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
      end


      def vote
        @candidate = Candidate.find_by(id: params[:id])
        @candidate.increment(:votes)
        @candidate.save
        redirect_to candidates_path, notice: "完成投票!"
      end
end
