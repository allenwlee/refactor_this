class Todo < ActiveRecord::Base
  attr_accessible :title, :body, :list_name, :todo_count, :status
  before_save :convert_list_name
  STATUSES = {
    1 => 'incomplete', 
    2 => 'complete', 
    3 => 'in_progress', 
    4 => 'moved', 
    5 => 'deleted',
    6 => 'postponed',
    7 => 'important'
  }

  def change_status(number)
    self.update_attribute 'status', number
  end

  def show_status
    STATUSES[self.status]
  end

  def convert_list_name
    self.list_name = self.list_name.downcase.gsub ' ', '-'
  end
end
