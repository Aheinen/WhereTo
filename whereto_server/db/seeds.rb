categories = [
  {:name => 'music', :description => 'Concerts & Tour Dates' },
  {:name => 'conference', :description => 'Conferences & Tradeshows' },
  {:name => 'comedy', :description => 'Comedy' },
  {:name => 'learning_education', :description => 'Education' },
  {:name => 'family_fun_kids', :description => 'Kids & Family' },
  {:name => 'festivals_parades', :description => 'Festivals' },
  {:name => 'movies_film', :description => 'Film' },
  {:name => 'food', :description => 'Food & Wine' },
  {:name => 'fundraisers', :description => 'Fundraising & Charity' },
  {:name => 'art', :description => 'Art Galleries & Exhibits' },
  {:name => 'support', :description => 'Health & Wellness' },
  {:name => 'holiday', :description => 'Holiday' },
  {:name => 'books', :description => 'Literary & Books' },
  {:name => 'attractions', :description => 'Museums & Attractions' },
  {:name => 'community', :description => 'Neighborhood' },
  {:name => 'business', :description => 'Business & Networking' },
  {:name => 'singles_social', :description => 'Nightlife & Singles' },
  {:name => 'schools_alumni', :description => 'University & Alumni' },
  {:name => 'clubs_associations', :description => 'Organizations & Meetups' },
  {:name => 'outdoors_recreation', :description => 'Outdoors & Recreation' },
  {:name => 'performing_arts', :description => 'Performing Arts' },
  {:name => 'animals', :description => 'Pets' },
  {:name => 'politics_activism', :description => 'Politics & Activism' },
  {:name => 'sales', :description => 'Sales & Retail' },
  {:name => 'science', :description => 'Science' },
  {:name => 'religion_spirituality', :description => 'Religion & Spirituality' },
  {:name => 'sports', :description => 'Sports' },
  {:name => 'technology', :description => 'Technology' },
  {:name => 'other', :description => 'Other & Miscellaneous' }
]

Category.create(categories)

  names = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ne.", "Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh.", "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."]
  city = "San Francisco"
  venues = ["Curabitur tortor", "Nam nec ante", "Integer nec odio"]
  prices = [5, 75, 215]
  images = ["https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTO-px1Rj5d_l95RQ6lRFUd4y3rd2AAtODsT6Z-xcTcbmeyI88k", "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRsCLGgB5i2drqKYBN2b8evTOEeg2iqMPoOC4Jgv0yhKLeSIUza8g", "/img/rsz_event-management.png"]
  description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus suscipit. Sed lectus. Integer euismod lacus luctus magna. Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi lacinia molestie dui. Praesent blandit dolor. Sed non quam. In vel mi sit amet augue congue elementum. Morbi in ipsum sit amet pede facilisis laoreet. Donec lacus nunc, viverra nec."

  start_times = ["2015-06-20", "2015-10-03", "2015-10-26"]
  end_times = ["2015-07-20", "2015-10-06", "2015-10-17"]

  10.times do
    event = Event.new(name: names.sample, city: city, description: description, venue: venues.sample, price: prices.sample, start_time: start_times.sample, end_time: end_times.sample, image: images.sample)

    if event.save
      CategoryEvent.create(category_id: Category.all.sample.id, event_id: event.id)
    end
  end

# sample_cats = ["art", "music", "food", "festivals_parades", "business", "technology", "sports", "fundraisers", "outdoors_recreation", "clubs_associations"]

# sample_cats.each do |c|

#   cat = Category.where(name:c)[0]

#   url = "http://api.eventful.com/json/events/search?location=San%20Francisco&category=#{c}&date=this_week&app_key=#{ENV['EVENTFUL_KEY']}"

#   response = HTTParty.get(url)

#   body = JSON.parse(response)

#   body["events"]["event"].each_with_index do |event, index|

#     name = event["title"]
#     city = event["city_name"]
#     description = event["description"]
#     venue = event["venue_name"]
#     price = event["price"]
#     starttime = event["start_time"]
#     endtime = event["stop_time"]
#     perf = []

#     if event["performers"] && !event["performers"].nil?
#       puts "this is event-performers:"
#       p event["performers"]
#       event["performers"]["performer"].each {|k,v | perf << v["name"] }
#     else
#       performer = nil
#     end

#     performer = perf.join(", ")

#     event["free"] == 1 ? free = true : free = false

#     if description == ""
#       if event["performers"]
#         event["performers"].each {|k,v| description = description + " " + v["short_bio"] }
#       end
#     end

#     if event['image']
#       image = event['image']['medium']['url']
#       image.gsub!(/medium/, "block250")
#     end


#     event = Event.new(name: name, city: city, description: description, venue: venue, price: price, free: free, start_time: starttime, end_time: endtime, performer: performer, image: image)

#     if event.save
#       CategoryEvent.create(category_id: cat.id, event_id: e.id)
#     end

#   end
# end
