# Create an IAM user named "sandeep"
resource "aws_iam_user" "sample_user" {
  name = "sandeep"
  tags = {
    Environment = "Development"
    Project     = "TerraformUserManagement"
  }
}