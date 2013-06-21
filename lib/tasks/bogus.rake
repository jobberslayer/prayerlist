require 'populator'
require 'faker'

namespace :db do
  namespace :bogus do
    desc "create some bogus users"
    task :users => :environment do
      password = 'password'
      User.populate 5 do |u|
        u.name = Faker::Name.name
        u.email = Faker::Internet.email
        u.encrypted_password = User.new(:password => password).encrypted_password
      end      
    end

    desc "create some bogus prayer requests"
    task :prayer_requests => :environment do
      
      [PrayerRequest].each(&:delete_all)

      PrayerRequest.populate 45 do |r|
        # get random user
        u = User.offset(rand(User.count)).first
        r.title = Populator.sentences(1)
        r.request_text = Populator.paragraphs(1..3)
        r.answered = ['t', 'f'] 
        r.user_id = u.id
        PrayerUpdate.populate 0..10 do |u|
          u.prayer_request_id = r.id
          u.body = Populator.paragraphs(1..3 )
          random_timestamp = Time.at(rand * (Time.now.to_f - 1.year.ago.to_f) + 1.year.ago.to_f) 
          u.created_at = random_timestamp 
          u.updated_at = random_timestamp
        end
      end
    end
  end
end
