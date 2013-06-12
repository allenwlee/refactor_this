class TodosController < ApplicationController
  before_filter :load_todos

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find params[:id]
  end

  def create
    p params[:todo][:status]
    @todo = Todo.new params[:todo]
    # status = params[:todo][:status]
    # @todo.change_status
    p "TTOOOOOODDDDOOOOOO"
    p @todo
    if @todo.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find params[:id]
  end

  def update
    @todo = Todo.find params[:id]
    if @todo.update_attributes params[:todo]
      redirect_to @todo
    else
      render :edit
    end
  end

  def get_status
    @statuses = STATUSES
  end

  private

  def load_todos
    @todos = Todo.all
  end

end
