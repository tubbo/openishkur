class TagsInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    options = input_html_options.merge(wrapper_options).merge(
      data: { tagsInput: true }
    )

    @form_builder.text_field attribute_name, options
  end
end
