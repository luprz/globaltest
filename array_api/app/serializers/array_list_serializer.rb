class ArrayListSerializer < ActiveModel::Serializer
  attributes :id, :data, :output

  def data
    object.data.split(',').map(&:to_i)
  end

  def output
    nil
  end
end
