remote_state {
  backend = "s3"
  config = {
    bucket         = "${yamldecode(file("common_values.yaml"))["prefix"]}-tf-state-store-${yamldecode(file("common_tags.yaml"))["env"]}-${yamldecode(file("common_values.yaml"))["aws_region"]}"
    key            = "${path_relative_to_include()}"
    region         = "${yamldecode(file("common_values.yaml"))["aws_region"]}"
    encrypt        = true
    dynamodb_table = "${yamldecode(file("common_values.yaml"))["prefix"]}-tf-state-store-lock-${yamldecode(file("common_tags.yaml"))["env"]}-${yamldecode(file("common_values.yaml"))["aws_region"]}"
  }
}

iam_role = "arn:aws:iam::${yamldecode(file("common_values.yaml"))["aws_account_id"]}:role/admin"