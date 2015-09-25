class AttachmentInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    options = merge_wrapper_options(
      input_html_options, wrapper_options
    )
    @form_builder.attachment_field attribute_name, options
  end
end
