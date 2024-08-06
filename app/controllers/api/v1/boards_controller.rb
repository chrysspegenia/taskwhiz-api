module Api
  module V1  
    class BoardsController < ApplicationController
      before_action :set_board, only: [ :show, :update, :destroy ]

      def index
        #decide order basis either id or priority
        boards = current_user.boards
        render json: BoardSerializer.new(boards)
      end

      def show
        render json: BoardSerializer.new(@board, options)
      end

      def create
        board = Board.new(board_params)

        if board.save
          render json: {
            message: "Successfully created new board.",
            data: BoardSerializer.new(board).serializable_hash[:data][:attributes]
          }
        else
          render json: { 
            error: "Failed to create board.", 
            details: @board.errors.messages 
          }
        end
      end

      def update
        if @board.update(board_params)
          render json:{
            message: "Board data has been successfully updated",
            data: BoardSerializer.new(@board).serializable_hash[:data][:attributes]
          }
        else
          render json: {
            error: "Failed to update board.",
            details: @board.errors.full_messages
          }
        end
      end

      def destroy
        if @board.destroy
          render json: { message: "Board has been deleted."},
          status: :ok
        else
          render json: {
            error: "Failed to delete board.",
            details: @board.errors.full_messages
          }, 
          status: :unprocessable_entity
        end
      end

      private

      def set_board
        @board = current_user.boards.find(params[:id])
      end

      def board_params
        params.require(:board).permit(:title).merge(user_id: current_user.id)
      end

      def options
        @options ||= { include: [:tasks]}
      end
    end
  end
end