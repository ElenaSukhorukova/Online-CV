module AttributeModelHelper
  def attribute_model(model, attr)
    model.class.human_attribute_name(attr)
  end
end