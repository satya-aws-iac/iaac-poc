# Create an IAM user named "sample"
resource "aws_iam_user" "QA" {
  name = "Ashish-Garg"
  tags = {
    Environment = "Development"
    Project     = "TerraformUserManagement"
  }
}

#crate vpc subnets

