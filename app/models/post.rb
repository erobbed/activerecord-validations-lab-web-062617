class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-fiction)}
  validate :clickbait

  def clickbait
    regex = /((.)*(won\'t\sbelieve|secret|Top\s[0-9]+|guess)(.)*)/i
    if !regex.match(self.title)
      errors.add(:title, "This post is not clickbait!")
    end
  end
end
