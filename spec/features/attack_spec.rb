feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Adam attacked Kate'
  end

  scenario 'attack Player 1' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    click_button 'Attack'
    expect(page).to have_content 'Kate attacked Adam'
  end

  scenario 'reduce player 1 HP by a random amount (5-15)' do
    sign_in_and_play
    srand(1234)
    each_player_attacks
    expect(page).not_to have_content 'Adam: 60HP'
    expect(page).to have_content 'Adam: 49HP'
  end
end