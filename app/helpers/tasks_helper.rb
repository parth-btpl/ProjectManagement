# frozen_string_literal: true

module TasksHelper
  def set_task_status
    enum_to_options_array(Task, 'status')
  end
end
