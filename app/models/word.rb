class Word < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
  validates :speech_type, presence: true
  validates :definition, presence: true
  validates :sentence, presence: true

  def self.downcase(hsh)
    hsh.each do |key, value|
      unless key == "sentence"
        value.downcase!
      end
    end
  end
end
