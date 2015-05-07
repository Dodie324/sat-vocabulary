require "rails_helper"

feature "user visits homepage", %(
  As a user
  I visit the homepage
  So that I can study my vocabulary
) do

  scenario "user visits homepage" do
    vocab = Word.create(
      word: "sophomoric",
      speech_type: "adj",
      definition: "pretentious or juvenile",
      sentence: "sophomoric double entendres"
    )

    visit root_path

    expect(page).to have_content(vocab.word)
  end

  scenario "user wants to see definition of the word" do
    vocab = Word.create(
      word: "sophomoric",
      speech_type: "adj",
      definition: "pretentious or juvenile",
      sentence: "sophomoric double entendres"
    )

    visit root_path

    expect(page).to have_content(vocab.word)

    find('a i.mdi-content-add').click

    expect(page).to have_content(vocab.word)
    expect(page).to have_content(vocab.speech_type)
    expect(page).to have_content(vocab.definition)
    expect(page).to have_content(vocab.sentence)
  end
end
