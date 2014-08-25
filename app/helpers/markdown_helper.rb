module MarkdownHelper

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new({})
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text)
  end

end