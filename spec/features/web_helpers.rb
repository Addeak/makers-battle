def sign_in_and_play
  visit ('/')
  fill_in :player_1_name, with: 'Adam'
  fill_in :player_2_name, with: 'Kate'
  click_button 'Submit'
end

def each_player_attacks
  click_button 'Attack'
  click_button 'OK'
  click_button 'Attack'
  click_button 'OK'
end