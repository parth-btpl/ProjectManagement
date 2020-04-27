module ApplicationHelper
  def active_class(link_path)
    controller_name == link_path ? 'active' : ''
  end

  def enum_to_options_array(model, enum_name)
    model.send(enum_name.to_s.pluralize).map { |key, _| [key.humanize.capitalize, key] }
  end

  def build_alert_classes(alert_type)
    case alert_type.to_sym
    when :notice, :success
      'alert-success'
    when :danger, :error, :alert
      'alert-danger'
    end
  end
end
