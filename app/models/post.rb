class Post < ActiveRecord::Base
  #callbacks
  after_create :update_slug
  before_update :assign_slug

  def to_param
    slug
  end

  #private methods
  private

  def assign_slug
    self.slug = "#{title.parameterize}"
  end

  def update_slug
    update_attributes slug: assign_slug
  end
end
