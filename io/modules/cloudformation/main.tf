resource "aws_cloudformation_stack" "chris_test_stack" {
  name = "chris-test-topic-from-terraform"
  
  parameters = {
    TopicName = "chris_test_topic_from_terraform"
    AccountList = "045627890776"
  }
  
  
  template_body = <<STACK
                    AWSTemplateFormatVersion: 2010-09-09
                    Parameters:
                      TopicName:
                        Description: Enter the Topic Name
                        Type: String
                      AccountList:
                        Description: Enter the Account List You Want to Allow to Subscribe
                        Type: CommaDelimitedList
                    
                    Resources:
                      snstopicforall:
                        Type: 'AWS::SNS::Topic'
                        Properties:
                          DisplayName: !Ref TopicName
                          TopicName: !Ref TopicName
                      snstopicpolicy:
                        Type: 'AWS::SNS::TopicPolicy'
                        Properties:
                          PolicyDocument: 
                            Version: 2012-10-17
                            Id: MYTopicPolicy
                            Statement:
                            - Resource: !Ref snstopicforall
                              Effect: Allow
                              Sid: Allow-SNSSubscribe
                              Action:
                                - 'SNS:Subscribe'
                                - 'SNS:GetTopicAttributes'
                              Principal:
                                AWS: !Ref AccountList
                          Topics:
                          - !Ref snstopicforall
                    STACK
  
  tags = {
		Name = "chris_ijames_test_terraform"
		Owner = "Chris Ijames"
		POC = "Chris Ijames"
		System = "Chris Ijames"
	}
}