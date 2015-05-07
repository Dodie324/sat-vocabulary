require "rails_helper"

feature "user adds a new word", %(
  As a user
  I want to add a new word
  So that the list can be updated
) do

  scenario "user successfully adds a new word" do
    vocab = Word.create(
      word: "sophomoric",
      speech_type: "adj",
      definition: "pretentious or juvenile",
      sentence: "sophomoric double entendres"
    )

    visit root_path

    click_on "ADD NEW WORD"

    fill_in "Word", with: "test"
    fill_in "Part of speech (n, adj, v)", with: "n"
    fill_in "Definition", with: "test"
    fill_in "Sentence", with: "test"
    click_on "Submit"

    expect(page).to have_content("Word added successfully!")
    expect(page).to have_content(vocab.word)
  end

  scenario "user unsuccessfully adds a new word" do
    vocab = Word.create(
      word: "sophomoric",
      speech_type: "adj",
      definition: "pretentious or juvenile",
      sentence: "sophomoric double entendres"
    )

    visit root_path

    click_on "ADD NEW WORD"

    fill_in "Word", with: ""
    fill_in "Part of speech (n, adj, v)", with: ""
    fill_in "Definition", with: ""
    fill_in "Sentence", with: ""
    click_on "Submit"

    expect(page).to have_content("Word can't be blank")
    expect(page).to have_content("Speech type can't be blank")
    expect(page).to have_content("Definition can't be blank")
    expect(page).to have_content("Sentence can't be blank")
  end

  scenario "user tries to add word that already exists" do
    vocab2 = Word.create(
      word: "tenacious",
      speech_type: "adj",
      definition: "pretentious or juvenile",
      sentence: "sophomoric double entendres"
    )

    visit root_path

    click_on "ADD NEW WORD"

    fill_in "Word", with: "tenacious"
    click_on "Submit"

    expect(page).to have_content("Word has already been taken")
  end
end
