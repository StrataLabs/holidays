class MongoidIdValidator
  def first_invalid(params)
    id_keys = params.keys.select { |k| k.to_s.end_with? "_id" }
    id_keys.detect do |k|
      clazz = k.to_s.gsub("_id", "").classify.constantize
      !(clazz.exists? :conditions => { :_id => params[k] })
    end
  end
end
