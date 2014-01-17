module ApplicationHelper
  #helper for form errors
  def control_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'control-group form-group error'
    else
      content_tag :div, capture(&block), class: 'control-group form-group'
    end
  end

  #helper for markdown conversion
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end
end
