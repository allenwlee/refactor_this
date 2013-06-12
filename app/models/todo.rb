class Todo < ActiveRecord::Base
  attr_accessible :title, :body, :list_name, :todo_count, :status
  after_create :change_status
  before_save :convert_list_name
  STATUSES = {
    1 => 'Incomplete',
    2 => 'Complete',
    3 => 'In progress',
    4 => 'Moved',
    5 => 'Deleted',
    6 => 'Postponed',
    7 => 'Important'
  }

  def change_status#(status)
    status = self.status
    p status
    self.update_attribute 'status', STATUSES.key(status)
  end

  def show_status
    STATUSES[self.status]
  end

  def convert_list_name
    self.list_name = self.list_name.downcase.gsub ' ', '-'
  end
end
