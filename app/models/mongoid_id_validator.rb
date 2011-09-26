class MongoidIdValidator
  def initialize(id_class)
    @id_class = id_class
  end

  def invalid_object(clazz, id)
    !(clazz.exists? :conditions => { :_id => id })
  end

  def first_invalid(params)
    id_keys = params.keys.select { |k| k.to_s.end_with? "_id" }
    return :id if params[:id] && invalid_object(@id_class.constantize, params[:id])
    id_keys.detect do |k|
      clazz = k.to_s.gsub("_id", "").classify.constantize
      invalid_object(clazz, params[k])
    end
  end
end
