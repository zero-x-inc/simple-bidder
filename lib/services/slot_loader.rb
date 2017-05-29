class SlotLoader
  class << self
    def call(data:)
      slot_data = data['imp'].first
      type_data = slot_data['banner']

      slot = Slot.new(
        width: type_data['w'],
        height: type_data['h'],
        blocked_attributes: type_data['battr'] || []
      )

      return slot
    end
  end
end
