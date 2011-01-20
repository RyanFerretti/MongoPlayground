module LoanFieldsHelper
  def build_input_element(builder,form_field)
    html = {:title => form_field.field_prototype.description}
    html[:readonly] = form_field.field_prototype.readonly
    if form_field.field_prototype.field_type == "Boolean"
      options = ["Yes","No"]
      options << "NAV" if form_field.field_prototype.navable
      options << "NAP" if form_field.field_prototype.napable
      builder.select :value, options, {:prompt => "--Please Select--"}, html
    elsif form_field.field_prototype.field_type == "Decimal"

    elsif form_field.field_prototype.field_type == "DropDown"
      options = form_field.field_prototype[:dd_values]
      options << "NAV" if form_field.field_prototype.navable
      options << "NAP" if form_field.field_prototype.napable
      builder.select :value, options, {:prompt => "--Please Select--"}, html
    elsif form_field.field_prototype.field_type == "Text"
      builder.text_area :value, html
    else
      html[:class] = "text_input"
      input = builder.text_field :value, html
      str = "#{input}"
      if form_field.field_prototype.navable || form_field.field_prototype.napable
        str << " | NAV #{builder.radio_button(:value, "NAV", :class => "radio_input")}" if form_field.field_prototype.navable
        str << " | NAP #{builder.radio_button(:value, "NAP", :class => "radio_input")}" if form_field.field_prototype.napable
      end
      str
    end
  end
end
