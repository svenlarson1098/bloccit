class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
    #@questions.title = params[:question][:title]
    #@questions.body = params[:question][:body]
    #@questions.resolved = params[:question][:resolved]
    
    if @question.save
      
      flash[:notice] = "Question was saved."
      redirect_to @question
      
    else
      flash.now[:error] = "An error occurred saving this question. Please try again."
      render :new
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      
      flash[:notice] = "Question was updated."
      redirect_to @question
      
    else
      flash.now[:error] = "An error occurred saving the question. Please try again."
      render :edit
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    
    if @question.destroy
        flash[:notice] = "\"#{@question.title}\" was deleted successfully."
        redirect_to questions_path
      else
        flash.now[:error] = "There was an error deleting the question."
        render :show
    end
    end
end