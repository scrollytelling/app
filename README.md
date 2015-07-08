[ ![Codeship Status for scrollytelling/app](https://codeship.com/projects/7f550840-f8e9-0132-4345-3a92bb520805/status?branch=master)](https://codeship.com/projects/86736)

## Getting started

```
bin/rake db:setup
```

## Zencoder policies

### main bucket

```json
{
  "Version": "2008-10-17",
  "Id": "ZencoderBucketPolicy",
  "Statement": [
    {
      "Sid": "Stmt1295042087538",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::395540211253:root"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::storyboard-pageflow-production/*"
    },
    {
      "Sid": "Stmt1295042087538",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::395540211253:root"
      },
      "Action": [
        "s3:ListBucketMultipartUploads",
        "s3:GetBucketLocation"
      ],
      "Resource": "arn:aws:s3:::storyboard-pageflow-production"
    }
  ]
}
```

### output bucket

```json
{
  "Version": "2008-10-17",
  "Id": "ZencoderBucketPolicy",
  "Statement": [
    {
      "Sid": "Stmt1295042087538",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::395540211253:root"
      },
      "Action": [
        "s3:GetObject",
        "s3:PutObjectAcl",
        "s3:ListMultipartUploadParts",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::storyboard-pageflow-production-out/*"
    },
    {
      "Sid": "Stmt1295042087538",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::395540211253:root"
      },
      "Action": [
        "s3:ListBucketMultipartUploads",
        "s3:GetBucketLocation"
      ],
      "Resource": "arn:aws:s3:::storyboard-pageflow-production-out"
    }
  ]
}
```
