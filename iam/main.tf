#===============================================================================#
# IAM Groups
#===============================================================================#
#-------------------------------------------
### IAM Group
#--------------------------------------------

resource "aws_iam_group" "default" {
  count = var.create_group ? 1 : 0
  name = var.group_name
}

#-------------------------------------------
### IAM Group Policy
#--------------------------------------------
resource "aws_iam_policy" "default" {
  count  = var.create_iam_policy ? 1 : 0
  name   = var.policy_name
  policy = var.policy
}

#-------------------------------------------
### IAM Group Policy Attachment
#--------------------------------------------

resource "aws_iam_group_policy_attachment" "default" {
  count      = var.create_group || var.create_policy_attachment ? 1 : 0
  group      = var.group_name
  policy_arn = var.group_policy
}

#===============================================================================#
# IAM Users
#===============================================================================#
resource "aws_iam_user" "default" {
  count         =  var.create_user ? length(var.users) : 0
  name          =  lookup(var.users[count.index], "user_name", "")
  path          =  lookup(var.users[count.index], "path", "")
  force_destroy =  lookup(var.users[count.index], "force_destroy", "")
}

##-- Generate API credentials
resource "aws_iam_access_key" "default" {
  count  = var.create_user ? length(var.users) : 0
  user   = element(aws_iam_user.default.*.name, count.index)
}

##-- Goup Membership
data "aws_iam_group" "get_group" {
  count  = var.create_user ? 1 : 0
  group_name = var.user_group_name
}

resource "aws_iam_group_membership" "default" {
  count  = var.create_user ? 1 : 0
  name   = "${data.aws_iam_group.get_group.0.group_id}_group_membership"
  group  = data.aws_iam_group.get_group.0.id
  users  = [aws_iam_user.default.*.name]
}
