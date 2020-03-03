class TalentProfile < ApplicationRecord
	belongs_to :user

	SKILLS = {
		music: [
			'dj', 
			'singer', 
			'producer', 
			'drummer', 
			'guitarist',
			'bassits',
			'keyboardist',
			'band', 
			'song writer', 
			'hip hop artist', 
			'dancer'
		], 
		photo: [
			'portrait photographer', 
			'family photographer', 
			'event photographer', 
			'wedding photographer',
			'photo booth'
		], 
		video: [
			'wedding videographer', 
			'short film', 
			'events videographer', 
			'music video'
		], 
		other: [
			'graphic designer', 
			'web developer', 
			'artist'
		]
	}

	SKILLS.each do |category, skills|
		scope category.to_sym, -> { where("skills && ?", %Q({"#{skills.join('", "')}"})) }
	end

	scope :has_skill, -> (skill) { where("skills @> ?", %Q({"#{skill}"})) }

end
