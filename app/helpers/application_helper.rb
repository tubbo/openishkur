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
    link_to text, href, options.merge(
      data: data.merge(
        'reveal-id' => '#editor'
      )
    )
  end
end
