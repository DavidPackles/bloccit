class Post < ActiveRecord::Base
  
  has_many :comments
  belongs_to :user
  belongs_to :topic



  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  mount_uploader :image, PostimageUploader

  def markdown_title
    render_markdown(self.title)
  end

  def markdown_body
    render_markdown(self.body)
  end

  protected

  def render_markdown(element)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    redcarpet.render(element).html_safe
  end

end
