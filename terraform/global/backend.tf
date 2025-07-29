

#IMPORTANT: Configure the S3 backend for Terraform state
# This tells Terraform to store its state file in the S3 bucket created below.
# You will need to run 'terraform init' after adding this block.
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-msatyan" # Must match the bucket name below
    key            = "globsl/s3/terraform.tfstate"       # Path to the state file in the bucket
    region         = "us-east-1"                         # Must match the provider region
    encrypt        = true                                # Enable encryption for the state file
    dynamodb_table = "terraform-state-lock-msatyan"      # Optional: For state locking (recommended)
  }
}

# Create the S3 bucket for Terraform state
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "my-terraform-state-bucket-msatyan" # IMPORTANT: Replace with a globally unique bucket name


  tags = {
    Name        = "TerraformStateBucket"
    Environment = "development" # Adjust as needed (e.g., Prod, Staging)
    ManagedBy   = "Terraform"
  }

  lifecycle {
    prevent_destroy = true # Prevents accidental deletion of the bucket
  }
}



# Enable server-side encryption for the S3 bucket
# This ensures data at rest in the bucket is encrypted.
resource "aws_s3_bucket_server_side_encryption_configuration" "tfstatebucket_encryption" {
  bucket = aws_s3_bucket.terraform_state_bucket.id # Reference the ID of the created bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # Use AES256 for AWS S3 managed keys (SSE-S3)
    }
  }
}

# Enable versioning for the S3 bucket
# This helps in recovering previous states and provides a safety net for your state file.
resource "aws_s3_bucket_versioning" "tfstatebucket_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id # Reference the ID of the created bucket

  versioning_configuration {
    status = "Enabled"
  }
}

# Optional: Create a DynamoDB table for state locking
# This prevents multiple users from concurrently modifying the state file, avoiding corruption.
resource "aws_dynamodb_table" "terraform_state_lock" {
  name                        = "terraform-state-lock-msatyan"
  billing_mode                = "PAY_PER_REQUEST"
  hash_key                    = "LockID"
  deletion_protection_enabled = "true"

  attribute {
    name = "LockID"
    type = "S" # String type
  }

  tags = {
    Name        = "TerraformStateLockTable"
    Environment = "development"
    ManagedBy   = "Terraform"
  }
}