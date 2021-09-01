require "administrate/field/base"

class FakePolymorphicField < Administrate::Field::Base
  include Rails.application.routes.url_helpers

  def to_s
    associated_dashboard.display_resource(data)
  end

  def link_to
    send("admin_#{data.class.to_s.downcase}_path", data.id) if data
  end

  private

  def associated_dashboard
    "#{associated_class_name}Dashboard".constantize.new
  end

  def associated_class_name
    data.class.name
  end
end
