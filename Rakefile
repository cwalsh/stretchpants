#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Stretchpants::Application.load_tasks

namespace :db do
  desc "Create mappings and indexes in Elastic Search"
  task :migrate do
    Tire.index 'campers' do
      delete
      create :mappings => Camper.mapping_to_hash
    end
  end
end
