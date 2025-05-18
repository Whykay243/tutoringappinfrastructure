name: Terraform CI/CD

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

env:
  AWS_REGION: us-east-1
  TF_STATE_KEY: infra/terraform.tfstate

jobs:
  bootstrap:
    name: Bootstrap Terraform Backend
    runs-on: ubuntu-latest
    outputs:
      s3_bucket_name: ${{ steps.output_bucket.outputs.bucket_name }}
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2

      - name: Terraform Init (bootstrap)
        working-directory: ./bootstrap
        run: terraform init

      - name: Terraform Apply (bootstrap)
        working-directory: ./bootstrap
        run: terraform apply -auto-approve

      - name: Get S3 bucket name from output
        id: output_bucket
        working-directory: ./bootstrap
        run: |
          bucket_name=$(terraform output -raw bucket_name 2>/dev/null)
          if [ -z "$bucket_name" ]; then
            echo "Terraform output is missing or malformed."
            exit 1
          fi
          echo "bucket_name=$bucket_name" >> $GITHUB_OUTPUT

  main_infra:
    name: Deploy Main Infrastructure
    needs: bootstrap
    runs-on: ubuntu-latest
    env:
      AWS_REGION: us-east-1
      TF_STATE_BUCKET: ${{ needs.bootstrap.outputs.s3_bucket_name }}
      TF_STATE_KEY: infra/terraform.tfstate
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2

      - name: Terraform Init (main infra)
        working-directory: ./infra
        run: |
          terraform init \
            -backend-config="bucket=${{ env.TF_STATE_BUCKET }}" \
            -backend-config="key=${{ env.TF_STATE_KEY }}" \
            -backend-config="region=${{ env.AWS_REGION }}"

      - name: Terraform Apply (main infra)
        working-directory: ./infra
        run: terraform apply -auto-approve
