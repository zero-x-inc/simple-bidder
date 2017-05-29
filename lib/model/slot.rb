class Slot
  include VirtualModel
  include ActiveModel::Validations

  attr_accessor :width, :height, :blocked_attributes

  def dimension
    return "#{self.width}x#{self.height}"
  end
end
