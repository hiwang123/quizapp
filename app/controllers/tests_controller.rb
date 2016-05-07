class TestsController < ApplicationController
	before_action :require_user
	before_filter :owner , only: [:destroy, :edit, :update]
	
	def owner
		@test = Test.find(params[:id])
		redirect_to :action => :index unless @test.user_id == current_user.id
	end
	
	def index
		@tests = current_user.tests
		@mytests = Test.where(user_id: current_user.id)
	end
	
	def add
		@test = Test.where(sharecode: params[:search])
		@mtest = current_user.tests.where(sharecode: params[:search])
		if @test.empty?
			flash[:error] = "Code not found"
		elsif !@mtest.empty?
			flash[:error] = "Already have"
		else
			current_user.tests << @test
		end
		redirect_to :action => :index
	end

	def remove
		@test = Test.where(id: params[:id])
		current_user.tests.delete(@test)
		redirect_to :action => :index
	end
	
	def show
		@test = Test.find(params[:id])
		@questions = @test.questions
		@records = Record.where(uid: current_user.id).where(qid: @questions.ids)
	end

	def record
		@test = Test.find(params[:id])
		@data = JSON.parse(params[:data])
		@data.each do |d|
			Record.create(:uid => current_user.id, :qid => d["qid"], :correct => d["correct"])
		end
		render :text => test_path(@test)
	end	
	
	def new
		@test = Test.new
	end

	def create
		@test = Test.new(test_params)
		@test.user_id = current_user.id
		if @test.save
			current_user.tests << @test
			redirect_to edit_test_path(@test)
		else
			redirect_to :action => :new
			#todo : add err msg sharecode rep
		end
	end

	def destroy
		@test = Test.find(params[:id])
		@test.questions.destroy_all
		@test.destroy
		redirect_to :action => :index
	end
	
	def edit
		@test = Test.find(params[:id])
		@questions = @test.questions
	end
	
	def update
		@test = Test.find(params[:id])
		@test.update(test_params)
		redirect_to :action => :index
	end

	private
		def test_params
			params.require(:test).permit(:title, :sharecode)
		end

end
