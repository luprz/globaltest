class ArrayList < ApplicationRecord
  def input
    data.split(',').map(&:to_i)
  end
end
