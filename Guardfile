guard :rspec, cmd: 'bundle exec rspec --color' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb"}
end