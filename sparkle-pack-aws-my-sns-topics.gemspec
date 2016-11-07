Gem::Specification.new do |s|
  s.name = 'sparkle-pack-aws-my-sns-topics'
  s.version = '0.0.1'
  s.licenses = ['MIT']
  s.summary = 'AWS My SNS Topics SparklePack'
  s.description = 'SparklePack to detect SNS topics'
  s.authors = ['Greg Swallow']
  s.email = 'gswallow@indigobio.com'
  s.homepage = 'https://github.com/gswallow/sparkle-pack-aws-my-sns-topics'
  s.files = Dir[ 'lib/sparkleformation/registry/*' ] + %w(sparkle-pack-aws-my-sns-topics.gemspec lib/sparkle-pack-aws-my-sns-topics.rb)
  s.add_runtime_dependency 'aws-sdk-core', '~> 2'
end
