feature "game over" do
  scenario "player 2 hit points reach 0" do
    sign_in_and_play
    srand(1234)
    5.times { each_player_attacks }
    expect(page).to have_content 'Kate is victorious!!!'
  end
end