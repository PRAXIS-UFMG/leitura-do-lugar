require "administrate/field/base"

class BooleanField < Administrate::Field::Boolean
  def to_s
    data ? "SIM" : "NÃO"
  end
end
