class Post < ActiveRecord::Base
  
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  include DavePaginator

  default_scope { order('rank DESC') }

  validates :title, length: { minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  # validates :topic, presence: true
  # validates :user, presence: true

  mount_uploader :image, ImageUploader

  after_create :create_vote


  def markdown_title
    render_markdown(self.title)
  end

  def markdown_body
    render_markdown(self.body)
  end

  def up_votes
    votes.where(value:1).count
  end

  def down_votes
    votes.where(value:-1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age

    update_attribute(:rank, new_rank)
  end

  private

  def create_vote
    user.votes.create( value:1, post: self)
  end

  protected

  def render_markdown(element)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    redcarpet.render(element).html_safe
  end

end
