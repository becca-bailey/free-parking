class Invite < ActiveRecord::Base
  # validates :grouping_id, presence: true
  belongs_to :grouping
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  before_create :generate_token

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.grouping_id, Time.now, rand].join)
  end



end
