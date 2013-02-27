module StaticPagesHelper

def full_title(page_title)
  base_title = "Ruby on Rails Phonebook App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

end
