require "administrate/field/base"

class TimestampField < Administrate::Field::DateTime
  private

  def format
    :timestamp
  end
end
