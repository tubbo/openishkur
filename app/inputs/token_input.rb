class TokenInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    options = input_html_options.merge(wrapper_options.merge(
      data: { tokenInput: true }
    ))
    @form_builder.text_field attribute_name, options
  end
end
