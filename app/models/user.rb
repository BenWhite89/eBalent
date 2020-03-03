class User < ApplicationRecord

	has_secure_password
	has_one :talent_profile
	# TODO: add
	# name
	# has many talents?
	# decide on structure
	# user = User | user.talents / user.skills
	# OR 
	# tp = TalentProfile | tp.user_id
	# truncated 
  #
  #
  # will talent users self-signup or will they need to be vetted? 

  def name
  	"#{self.first_name} #{self.last_name}"
  end

end
