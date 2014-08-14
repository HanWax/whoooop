def leave_review(thoughts, rating)
  visit restaurants_path
  click_link 'Write review'
  fill_in 'Thoughts', with: thoughts
  select rating.to_s, from: 'Rating'
  click_button 'Create Review'
end