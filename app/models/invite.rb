class Invite < ActiveRecord::Base
  # validates :grouping_id, presence: true
  belongs_to :grouping
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  before_create :generate_token
  before_save :check_user_existence

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.grouping_id, Time.now, rand].join)
  end

  def check_user_existence
    recipient = User.find_by_email(self.email)
    if recipient
      self.recipient_id = recipient.id
    end
  end
end
