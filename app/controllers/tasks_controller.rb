class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
   
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(title: params[:task][:title], description: params[:task][:description])
    if @task.save
      redirect_to tasks_path, notice: 'タスクを登録しました'
    else
      flash.now[:alert] = 'タスクの登録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    
  end

  def update
    
    if @task.update(title: params[:task][:title], description: params[:task][:description])
      redirect_to task_path(@task), notice: 'タスクを更新しました'
    else
      flash.now[:alert] = 'タスクの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
   
    @task.destroy!
    redirect_to tasks_path, notice: 'タスクを削除しました'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end



end
