class QuestionsController < ApplicationController

	before_action :set_test
	before_filter :owner , except: [:show]

	def owner
		redirect_to test_path(@test) unless @test.user_id == current_user.id
	end

	def new
		@question = @test.questions.build
	end

	def create
		@question = @test.questions.build(question_params)
		
		@question.save
		redirect_to edit_test_path(@test)
	end

	def show
		@question = @test.questions.find(params[:id])
	end
	
	def destroy
		@question = @test.questions.find(params[:id])
		if current_user.id == @test.user_id
			@question.destroy
		end
		redirect_to edit_test_path(@test)
	end

	def edit
		@question = @test.questions.find(params[:id])
	end
	
	def update
		@question = @test.questions.find(params[:id])
		if current_user.id == @test.user_id
			@question.update(question_params)
		end
		redirect_to edit_test_path(@test)

	end

	private
		def question_params
			params.require(:question).permit(:prob, :ans, :explain, :attachment)
		end
		
		def set_test
			@test = Test.find(params[:test_id])
		end
end
