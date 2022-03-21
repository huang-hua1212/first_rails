class CandidatesController < ApplicationController
    before_action :find_candidate, only: [:edit, :update, :destroy, :vote]

    def index
        # Candidate為Modal，故為單數
        @candidates = Candidate.all
    end
   
    # GET /candidates/new
    def new
        # 除非 new 動作裡指定要做別的事。new 動作可透過 Client.new，無參數，為 View 提供實體變數 
        @candidate = Candidate.new
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
    # def show
    # end
    # def show
    #     @candidate =  Candidate.find(params[:id])
    # end

    # 使用get方法
    def edit
        # 先從資料庫中抓到是哪個candidate
        @candidate = Candidate.find_by(id: params[:id])
    end
    # edit後，使用post方法執行update
    def update
        # 先從資料庫中抓到是哪個candidate
        @candidate = Candidate.find_by(id: params[:id])

       
        # 把old candidate 更新(update)為 candidate_params
        if @candidate.update(candidate_params)
        # 成功
        redirect_to candidates_path, notice: "資料更新成功!"
        else
        # 失敗
        render :edit
        end
    end
    


    def destroy
        # @candidate = Candidate.find_by(id: params[:id])
        # @candidate.destroy if @candidate
        # redirect_to candidates_path, notice: "候選人資料已刪除!"
        @candidate.destroy if @candidate
        redirect_to candidates_path, notice: "候選人資料已刪除!"
      end

    #   名稱自定義
    def candidate_params
        params.require(:candidate).permit(:name, :age, :party, :politics)
    end
    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
      end


      def vote
        @candidate = Candidate.find_by(id: params[:id])
        @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
        @candidate.increment(:votes)
        @candidate.save
        # flash[:notice] = "完成投票!"
        redirect_to candidates_path, notice: "完成投票!"
      end
end
