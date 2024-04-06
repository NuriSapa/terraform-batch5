
resource "aws_iam_user" "lb" {
  for_each = toset([
    "user1",
    "user2",
    "user3"
    ])
  name = each.key
}

resource "aws_iam_group" "hello" {
  name = "develops"
}

# resource "aws_iam_group_membership" "team" {
#   name = "tf-testing-group-membership"

#   users = [
#     for i in aws_iam_user.lb : i.name 
#     ]

#   group = aws_iam_group.hello.name
# }

#terraform state list - to see what we created 
# terraform state show aws_iam_group.hello - to see the information 
#terraform state show 'aws_iam_user.lb["user1"]' - to see the information abput user 


# resource "aws_iam_group" "hello" {
#   name = "develops"
# }

#terraform taint aws_iam_group.hello- if we want to recreart 