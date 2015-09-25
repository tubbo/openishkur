module ApplicationHelper
  def title_tag
    content_tag :title, page_title
  end

  def page_title
    if content_for? :title
      "#{content_for(:title)} | #{config.title}"
    else
      config.title
    end
  end

  def title(new_title)
    content_for :title, new_title
  end

  def link_to_modal(text, href, options = {})
    data = options[:data] || {}
    link_to text, href, options.merge(
      data: data.merge(
        'reveal-id' => 'editor',
        'reveal-ajax' => true
      )
    )
  end

  def logged_in?
    current_user.present?
  end

  def config
    Rails.application.config
  end
end
