# This Rakefile is intended to define tasks for running the Kiba ETL script.

namespace :etl do
  desc 'Run the Kiba ETL script'
  task :run do
    sh 'ruby lib/etl/jobs/event_pipeline.rb'
  end
end