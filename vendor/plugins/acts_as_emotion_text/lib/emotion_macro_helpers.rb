module EmotionMacroHelpers

	def emotion_link text_area_id, opts = {}
    link_to_function '', "Iyxzone.Emotion.Manager.toggleFaces(this, $('#{text_area_id}'))", opts
	end

end
