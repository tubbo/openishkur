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

  def page_class
    controller.action_name
  end

  def page_id
    controller.controller_name
  end
end
