  require 'rubygems'
  require 'rufus/scheduler'

  scheduler = Rufus::Scheduler.start_new

  scheduler.in '20s' do
    puts "order ristretto"
  end