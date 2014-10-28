class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user
  
  scope :publicly_viewable, -> { where(public:true) }
  scope :privately_viewable, -> { where(public:false) }
  scope :visible_to, -> (user) { user ? all : publicly_viewable }

  mount_uploader :image, ImageUploader

  def markdown_title
    render_markdown(self.title)
  end

  def markdown_description
    render_markdown(self.description)
  end

  protected

  def render_markdown(element)
    # DRY update - use 'render_as_markdown title' 
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    redcarpet.render(element).html_safe
  end

end