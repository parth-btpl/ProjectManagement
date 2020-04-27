# frozen_string_literal: true

module ApplicationHelper
  def active_class(link_path)
    controller_name == link_path ? 'active' : ''
  end

  def enum_to_options_array(model, enum_name)
    model.send(enum_name.to_s.pluralize).map { |key, _| [key.humanize.capitalize, key] }
  end

  def index_count_increment(index)
    ((params[:page] || INDEX_COUNT).to_i - INDEX_COUNT) * PER_PAGE + index + INDEX_COUNT
  end

  def formatted_date(date)
    date.strftime(DATE_FORMAT)
  end

  def humanize_data(data)
    data.try(:humanize)
  end
end
