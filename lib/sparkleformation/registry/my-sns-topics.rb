require 'aws-sdk-core'

sns = ::Aws::SNS::Client.new

SfnRegistry.register(:my_sns_topics) do |filter = nil|
  if filter.nil?
    sns.list_topics.topics.map(&:topic_arn)
  else
    sns.list_topics.topics.map do |topic|
      topic.topic_arn if topic.topic_arn =~ /arn:aws:sns:#{ENV['AWS_REGION']}:#{ENV['AWS_CUSTOMER_ID']}:#{filter}/
    end.compact.first
  end
end
