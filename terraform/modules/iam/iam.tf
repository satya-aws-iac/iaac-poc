# Create an IAM user named "sample"
resource "aws_iam_user" "sample_user" {
  name = "sany"
  tags = {
    Environment = "Development"
    Project     = "TerraformUserManagement"
  }
}