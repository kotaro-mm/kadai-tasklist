class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def show
      @task = Task.find(params[:id])
  end

  def new
      @task = Task.new
  end

  def create
      @task = Task.new(task_params)
      
      if @task.save
          flash[:success] = 'Taskは正常に投稿されました'
          redirect_to @task
      else
          flash[:danger] = 'Taskは投稿されませんでした'
          render :new
      end
  end

  def edit
      @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
      
      if @task.update(task_params)
          flash[:success] = 'Taskは正常に更新されました'
          redirect_to @task
      else
          flash[:danger] = 'Taskは更新されませんでした'
          render :new
      end
  end

  def destroy
  end
  
  private
  def task_params
      params.require(:task).permit(:content)
  end
end
