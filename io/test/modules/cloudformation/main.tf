resource "aws_cloudformation_stack" "chris_test_stack" {
  name = "${var.cft_stack_name}"
  
  parameters = {
    TopicName = "${var.chris_test_topic_from_cft}"
    AccountList = "${var.chris_account_list_from_cft}"
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