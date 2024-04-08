resource "aws_iam_role" "dev_test" {
  name = "eks-cluster-dev_test"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "dev_test-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.dev_test.name
}

resource "aws_eks_cluster" "dev_test" {
  name     = "dev_test"
  version  = "1.28"
  role_arn = aws_iam_role.dev_test.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-ap-south-1a.id,
      aws_subnet.private-ap-south-1b.id,
      aws_subnet.public-ap-south-1a.id,
      aws_subnet.public-ap-south-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.dev_test-AmazonEKSClusterPolicy]
}
