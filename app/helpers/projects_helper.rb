# frozen_string_literal: true

module ProjectsHelper
  def set_project_status
    enum_to_options_array(Project, 'status')
  end

  def pro_submit_button
    action_name == 'edit' ? "Update" : "Create"
  end
end
