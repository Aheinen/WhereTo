# categories = [{:name => 'music', :description => 'Concerts & Tour Dates' },
# {:name => 'conference', :description => 'Conferences & Tradeshows' },
# {:name => 'comedy', :description => 'Comedy' },
# {:name => 'learning_education', :description => 'Education' },
# {:name => 'family_fun_kids', :description => 'Kids & Family' },
# {:name => 'festivals_parades', :description => 'Festivals' },
# {:name => 'movies_film', :description => 'Film' },
# {:name => 'food', :description => 'Food & Wine' },
# {:name => 'fundraisers', :description => 'Fundraising & Charity' },
# {:name => 'art', :description => 'Art Galleries & Exhibits' },
# {:name => 'support', :description => 'Health & Wellness' },
# {:name => 'holiday', :description => 'Holiday' },
# {:name => 'books', :description => 'Literary & Books' },
# {:name => 'attractions', :description => 'Museums & Attractions' },
# {:name => 'community', :description => 'Neighborhood' },
# {:name => 'business', :description => 'Business & Networking' },
# {:name => 'singles_social', :description => 'Nightlife & Singles' },
# {:name => 'schools_alumni', :description => 'University & Alumni' },
# {:name => 'clubs_associations', :description => 'Organizations & Meetups' },
# {:name => 'outdoors_recreation', :description => 'Outdoors & Recreation' },
# {:name => 'performing_arts', :description => 'Performing Arts' },
# {:name => 'animals', :description => 'Pets' },
# {:name => 'politics_activism', :description => 'Politics & Activism' },
# {:name => 'sales', :description => 'Sales & Retail' },
# {:name => 'science', :description => 'Science' },
# {:name => 'religion_spirituality', :description => 'Religion & Spirituality' },
# {:name => 'sports', :description => 'Sports' },
# {:name => 'technology', :description => 'Technology' },
# {:name => 'other', :description => 'Other & Miscellaneous' }]

# Category.create(categories)


# cat_keys = categories.map{|c| c[:name]}

# # cat_keys.each do |c|

  cat = Category.where(name: "politics_activism")[0]

  p cat

  p url = "http://api.eventful.com/json/events/search?location=San%20Francisco&category=politics_activism&date=this_week&app_key=XXXXXXXXXXXXXXX"

  response = HTTParty.get(url)

  body = JSON.parse(response)

  # p body
  # p "*"*30
  # p body["events"]
  # p "*"*30
  # p body["events"]["event"][0]["title"]
  # p body["events"]["event"]["title"]

  body["events"]["event"].each_with_index do |event, index|
    p event
    p "*"*20
    p index
    p "*"*20
    p event["title"]
    p "*"*20
    name = event["title"]
    city = event["city_name"]
    description = event["description"]
    venue = event["venue_name"]
    price = event["price"]
    starttime = event["start_time"]
    endtime = event["stop_time"]
    # image = event['image']['medium']['url']
    perf = []
    if event["performers"]
      event["performers"].each {|k,v | perf << v["name"] }
    else
      performer = nil
    end
    performer = perf.join(", ")
    event["free"] == 1 ? free = true : free = false
    if description == ""
      if event["performers"]
        event["performers"].each {|k,v| description = description + " " + v["short_bio"] }
      end
    end

    e = Event.new(name: name, city: city, description: description, venue: venue, price: price, free: free, start_time: starttime, end_time: endtime, performer: performer)

    if e.save
      CategoryEvent.create(category_id: cat.id, event_id: e.id)
    end

  end


# end
