#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Blueprint::Application.load_tasks


namespace :db do
  namespace :seed do
    task :development => :environment do
      puts "Seeding the development database."
      load(Rails.root.join( 'db', 'seeds', 'development.rb'))
    end
  end
end

namespace :get do
  task hacks: :environment do
    puts "Getting hack submission data."
    HackathonSubmission.all.each do |hack|
      line = [hack.title, hack.description, hack.demo]
      hack.students.each do |student|
        line += [student.name, student.email]
      end
      puts line.join(", ")
    end
  end
end
