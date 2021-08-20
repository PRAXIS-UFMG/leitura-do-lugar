require "administrate/field/base"

class FakePolymorphicField < Administrate::Field::Base
  include Rails.application.routes.url_helpers

  def to_s
    data.try(:name)
  end

  def link_to
    send("admin_#{data.class.to_s.downcase}_path", data.id)
  end
end
