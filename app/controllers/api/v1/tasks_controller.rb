module Api
  module V1
    class TasksController < ApplicationController
      before_action :set_task, only: [ :show, :update, :destroy ]

      def index
        @board = Board.find(params[:board_id])
        tasks = @board.tasks
        render json: TaskSerializer.new(tasks)
      end

      def show
        render json: TaskSerializer.new(@task)
      end

      def create
        @board = current_user.boards.find(params[:board_id])
        task = @board.tasks.build(task_params)
        
        if task.save
          render json: {
            message: "Successfully created a new task.",
            data:  TaskSerializer.new(task).serializable_hash[:data][:attributes]
          }
        else
          render json: {
            error: "Failed to create task.",
            details: task.errors.messages
          }
        end
      end

      def update
        if @task.update(task_params)
          render json: {
            message: "Task has been successfully updated.",
            data: TaskSerializer.new(@task).serializable_hash[:data][:attributes]
          }
        else
          render json: {
            error: "Failed to update task.",
            details: @task.errors.full_messages
          }
        end
      end

      def destroy
        if @task.destroy
          render json: { message: "Task has been deleted."},
          status: :ok
        else
          render json: {
            error: "Failed to delete task.",
            details: @task.errors.full_messages
          },
          status: :unprocessable_entity
        end
      end

      private

      def set_task
        @board = current_user.boards.find(params[:board_id])
        @task = @board.tasks.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:title, :description, :priority, :is_complete, tags: [])
      end
    end
  end
end