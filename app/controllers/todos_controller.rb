class TodosController < ApplicationController
  def index
    todos = Todo.all
    render json: todos
  end

  def show
    todo = Todo.find(params[:id])
    render json: todo
  end

  def create
    todo = Todo.create(todo_params)
    if todo.valid? # If validations in ../models/todo.rb succeeded, render the todo object in JSON format
      render json: todo
    else # otherwise, render the errors that are attatched to the todo variable under the `.errors` method.
      render json: todo.errors.full_messages, status: :unprocessable_entity
      # This will produce the following JSON response:
      # [
      #   "Description can't be blank",
      # ]
    end
  end

  def update
    todo = Todo.find(params[:id])
    todo.update(description: params[:description])

    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    render json: todo
  end

  # def patch
  #   debugger
  # end

  private

  def todo_params
    params.permit(:description, :complete)
  end
end
