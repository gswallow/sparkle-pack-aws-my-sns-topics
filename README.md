# sparkle-pack-aws-my-sns-topics
SparklePack to auto-detect SNS topics.

h/t to [techshell](https://github.com/techshell) for this approach.

### Environment variables

The following environment variables must be set in order to use this Sparkle
Pack:

- AWS_REGION
- AWS_DEFAULT_REGION (being deprecated?)
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_CUSTOMER_ID

### Use Cases

This SparklePack adds a registry entry that uses the AWS SDK to detect SNS
topics, and returns either an array or a single topic ARN based on a filter.

It also provides a dynamic to create SNS topics, with optional subscribers.

## Usage

Add the pack to your Gemfile and .sfn:

Gemfile:
```ruby
source 'https://rubygems.org'
gem 'sfn'
gem 'sparkle-pack-aws-my-sns-topics'
```

.sfn:
```ruby
Configuration.new do
  sparkle_pack [ 'sparkle-pack-aws-my-sns-topics' ] ...
end
```

### Registries

In a SparkleFormation Template/Component/Dynamic:
```ruby
allowed_values registry!(:my_sns_topics)
```

Or, specify the name of the topic for which to retrieve an ARN:

```ruby
notification_topic registry!(:my_sns_topics, 'instance_termination')
```

### Dynamics

Create an SNS topic:

```ruby
dynamic!(:sns_topic, 'events', :subscriber => 'EventHandlerLambda', :protocol => 'lambda')
