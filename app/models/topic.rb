class Topic < ActiveRecord::Base
  has_many :posts
  belongs_to :user


  def markdown_title
    # DRY update - use 'render_as_markdown title' 
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render self.title).html_safe
  end

  def markdown_description
    # DRY update - use 'render_as_markdown description' 
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render self.description).html_safe
  end

end
