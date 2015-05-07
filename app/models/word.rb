class Word < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
  validates :speech_type, presence: true
  validates :definition, presence: true
  validates :sentence, presence: true
end
