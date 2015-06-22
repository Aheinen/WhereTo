categories = [
  {:name => 'music', :description => 'Concerts & Tour Dates', :image => 'music.png' },
  {:name => 'conference', :description => 'Conferences & Tradeshows', :image => 'conference.png' },
  {:name => 'comedy', :description => 'Comedy', :image => 'comedy.png' },
  {:name => 'learning_education', :description => 'Education', :image => 'learning_education.png' },
  {:name => 'family_fun_kids', :description => 'Kids & Family', :image => 'family_fun_kids.png' },
  {:name => 'festivals_parades', :description => 'Festivals', :image => 'festivals_parades.png' },
  {:name => 'movies_film', :description => 'Film', :image => 'movies_film.png' },
  {:name => 'food', :description => 'Food & Wine', :image => 'food.png' },
  {:name => 'fundraisers', :description => 'Fundraising & Charity', :image => 'fundraisers.png' },
  {:name => 'art', :description => 'Art Galleries & Exhibits', :image => 'art.png' },
  {:name => 'support', :description => 'Health & Wellness', :image => 'support.png' },
  {:name => 'holiday', :description => 'Holiday', :image => 'holiday.png' },
  {:name => 'books', :description => 'Literary & Books', :image => 'books.png' },
  {:name => 'attractions', :description => 'Museums & Attractions', :image => 'attractions.png' },
  {:name => 'community', :description => 'Neighborhood', :image => 'community.png' },
  {:name => 'business', :description => 'Business & Networking', :image => 'business.png' },
  {:name => 'singles_social', :description => 'Nightlife & Singles', :image => 'singles_social.png' },
  {:name => 'schools_alumni', :description => 'University & Alumni', :image => 'schools_alumni.png' },
  {:name => 'clubs_associations', :description => 'Organizations & Meetups', :image => 'clubs_associations.png' },
  {:name => 'outdoors_recreation', :description => 'Outdoors & Recreation', :image => 'outdoors_recreation.png' },
  {:name => 'performing_arts', :description => 'Performing Arts', :image => 'performing_arts.png' },
  {:name => 'animals', :description => 'Pets', :image => 'animals.png' },
  {:name => 'politics_activism', :description => 'Politics & Activism', :image => 'politics_activism.png' },
  {:name => 'sales', :description => 'Sales & Retail', :image => 'sales.png' },
  {:name => 'science', :description => 'Science', :image => 'science.png' },
  {:name => 'religion_spirituality', :description => 'Religion & Spirituality', :image => 'religion_spirituality.png' },
  {:name => 'sports', :description => 'Sports', :image => 'sports.png' },
  {:name => 'technology', :description => 'Technology', :image => 'technology.png' },
  {:name => 'other', :description => 'Other & Miscellaneous', :image => 'other.png' }
]

Category.create(categories)

sample_cats = ["art", "music", "food", "festivals_parades", "business", "technology", "sports", "fundraisers", "outdoors_recreation", "clubs_associations"]

sample_cats.each do |c|

  cat = Category.where(name:c)[0]

  p url = "http://api.eventful.com/json/events/search?location=San%20Francisco&category=#{c}&date=this_week&app_key=#{ENV['EVENTFUL_KEY']}"

  response = HTTParty.get(url)

  body = JSON.parse(response)

  response = HTTParty.get(url)

  body = JSON.parse(response)

  body["events"]["event"].each_with_index do |event, index|
    name = event["title"]
    city = event["city_name"]
    description = event["description"]
    venue = event["venue_name"]
    price = event["price"]
    starttime = event["start_time"]
    endtime = event["stop_time"]
    perf = []
    if event["performers"] && !event["performers"].nil?
      if event["performers"]["performer"].class == Array
        event["performers"]["performer"].each { |pe| perf << pe["name"]}
        performer = perf.join(", ")
      else
        p event["performers"]["performer"]
        p event["performers"]["performer"]["name"]
        performer = event["performers"]["performer"]["name"]
      end
    else
      performer = nil
    end
    event["free"] == 1 ? free = true : free = false
    if description == ""
      if event["performers"]
        event["performers"].each {|k,v| description = description + " " + v["short_bio"] }
      end
    end
    if event['image']
      image = event['image']['medium']['url']
      image.gsub!(/medium/, "block250")
    end


    event = Event.new(name: name, city: city, description: description, venue: venue, price: price, free: free, start_time: starttime, end_time: endtime, performer: performer, image: image)

    if event.save
      CategoryEvent.create(category_id: cat.id, event_id: event.id)
    end

  end
end
