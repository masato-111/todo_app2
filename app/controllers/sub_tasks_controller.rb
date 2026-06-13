class SubTasksController < ApplicationController
  before_action :set_task
  before_action :set_sub_task, only: %i[show edit update destroy]

  def show
  end

  def new
    @sub_task = @task.sub_tasks.build
  end

  def create
    @sub_task = @task.sub_tasks.build(sub_task_params)
    if @sub_task.save
      redirect_to task_path(@task), notice: t('controllers.created')
    else
      flash.now[:alert] = t('controllers.failed')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @sub_task.update(sub_task_params)
      redirect_to task_sub_task_path(@task, @sub_task), notice: t('controllers.updated')
    else
      flash.now[:alert] = t('controllers.failed')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sub_task.destroy!
    redirect_to task_path(@task), notice: t('controllers.destroyed')
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_sub_task
    @sub_task = @task.sub_tasks.find(params[:id])
  end

  def sub_task_params
    params.expect(sub_task: [:title, :description])
  end
end
