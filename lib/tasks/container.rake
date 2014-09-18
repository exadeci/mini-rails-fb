PORT         = ENV['RAILS_PORT']   || 3000
TOKEN        = ""

task :run => :environment do
  if production?
    assets_precompile
  end
  sh run
end

task :test => :environment do
  sh 'bundle exec rspec'
end

def assets_precompile
  sh 'bundle exec rake assets:precompile'
end

def production?
  ENV['RAILS_ENV'] == 'production'
end

def run
  cmd = ''
  cmd << "export FBGRAPH_ACCESS_TOKEN=#{TOKEN}"
  cmd << "bundle exec rails server -p #{PORT}"
end
