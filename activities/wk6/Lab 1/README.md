### Tutorial 1: Configuring AWS Boto3 Client

**Objective**: Understand how to configure and initialize the Boto3 client to interact with AWS S3.

#### Step 1: Create Configuration File

Create a configuration file named `aws.cfg` with the following structure:

```
[AWS]
aws_access_key_id = YOUR_ACCESS_KEY_ID
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
```

#### Step 2: Initialize Boto3 Client

Create a Python script named `s3_client.py` and add the following code:

```python
import configparser
import boto3

# Load AWS credentials from the configuration file
config = configparser.ConfigParser()
config.read('aws.cfg')

aws_access_key = config['AWS']['aws_access_key_id']
aws_secret_key = config['AWS']['aws_secret_access_key']

# Initialize the S3 client
s3 = boto3.client(
    's3',
    aws_access_key_id=aws_access_key,
    aws_secret_access_key=aws_secret_key
)

# Verify the client is set up correctly by listing buckets
response = s3.list_buckets()
print('Existing buckets:')
for bucket in response['Buckets']:
    print(f'  {bucket["Name"]}')
```

#### Explanation

1. **Reading the Configuration File**:

   ```
   config = configparser.ConfigParser()
   config.read('aws.cfg')
   aws_access_key = config['AWS']['aws_access_key_id']
   aws_secret_key = config['AWS']['aws_secret_access_key']
   ```

   This code reads the AWS credentials from the `aws.cfg` file.

2. **Initializing the S3 Client**:

   ```python
   python
   Copy code
   s3 = boto3.client(
       's3',
       aws_access_key_id=aws_access_key,
       aws_secret_access_key=aws_secret_key
   )
   ```

   This code initializes the Boto3 S3 client using the credentials read from the configuration file.

3. **Listing Buckets**:

   ```python
   response = s3.list_buckets()
   print('Existing buckets:')
   for bucket in response['Buckets']:
       print(f'  {bucket["Name"]}')
   ```

   This code lists all the S3 buckets in your AWS account to verify that the client is set up correctly.

---

### Activity 2: Uploading and Downloading Files Using Boto3

#### Task 1: Upload a File to S3 Using `upload_file`

1. **Instruction**: Complete the code to upload a file using `upload_file`. Choose a file from your local filesystem, specify your S3 bucket name, and the key for the file.
2. **Code Snippet**:

```python
import configparser
import boto3

# Load AWS credentials
config = configparser.ConfigParser()
config.read('aws.cfg')

aws_access_key = config['AWS']['aws_access_key_id']
aws_secret_key = config['AWS']['aws_secret_access_key']

# Initialize the S3 client


# Define the file to upload and the target bucket and key
filename = 'your-file-path'  # Replace with your file path
bucket_name = 'your-bucket-name'  # Replace with your bucket name
key = 'your-file-key'  # Replace with your file key in S3

# Upload the file to S3


# Print a confirmation message
print(f'File {filename} uploaded to bucket {bucket_name} with key {key}.')
```

#### Task 2: Upload a File to S3 Using `upload_fileobj`

1. **Instruction**: Complete the code to upload a file-like object using `upload_fileobj`. Choose a file from your local filesystem, specify your S3 bucket name, and the key for the file.
2. **Code Snippet**:

```python
import configparser
import boto3

# Load AWS credentials


# Initialize the S3 client
s3 = # YOUR CODE

# Define the file to upload and the target bucket and key
bucket_name = 'your-bucket-name'  # Replace with your bucket name
key = 'your-file-key'  # Replace with your file key in S3

# Upload the file to S3 using file-like object


# Print a confirmation message
print(f'File uploaded to bucket {bucket_name} with key {key}.')
```

#### Task 3: Upload a File to S3 Using `put_object`

1. **Instruction**: Complete the code to upload a file using `put_object`. Choose a file from your local filesystem, specify your S3 bucket name, and the key for the file.

1. **Code Snippet**:

```python
import configparser
import boto3

# Load AWS credentials


# Initialize the S3 client

# Define the file to upload and the target bucket and key
bucket_name = 'your-bucket-name'  # Replace with your bucket name
key = 'your-file-key'  # Replace with your file key in S3

# Upload the file to S3 using put_object


# Print a confirmation message
print(f'File uploaded to bucket {bucket_name} with key {key}.')
```

#### Task 4: Download a File from S3 Using `download_file`

1. **Instruction**: Complete the code to download a file using `download_file`. Specify your S3 bucket name, the key for the file, and the local path to save the file.
2. **Code Snippet**:

```python
import configparser
import boto3

# Load AWS credentials
config = configparser.ConfigParser()
config.read('aws.cfg')

aws_access_key = config['AWS']['aws_access_key_id']
aws_secret_key = config['AWS']['aws_secret_access_key']

# Initialize the S3 client


# Define the file to download and the target local path
bucket_name = 
key = 
filename = 

# Download the file from S3


# Print a confirmation message
print(f'File {key} downloaded from bucket {bucket_name} to {filename}.')
```

#### Task 5: Download a File from S3 Using `download_fileobj`

1. **Instruction**: Complete the code to download a file-like object using `download_fileobj`. Specify your S3 bucket name, the key for the file, and the local path to save the file.
2. **Code Snippet**:

```python
import configparser
import boto3

# Load AWS credentials
config = configparser.ConfigParser()
config.read('aws.cfg')

# Initialize the S3 client


# Define the file to download and the target local path
bucket_name =  # Replace with your bucket name
key =  # Replace with your file key in S3

# Download the file from S3 using file-like object


# Print a confirmation message
print(f'File {key} downloaded from bucket {bucket_name} to local file.')
```

#### Task 6: Download a File from S3 Using `get_object`

1. **Instruction**: Complete the code to download a file using `get_object`. Specify your S3 bucket name and the key for the file.
2. **Code Snippet**:

```python
import configparser
import boto3

# Load AWS credentials


# Initialize the S3 client


# Define the file to download


# Download the file from S3 using get_object
response = 

#hint response['Body'].read().decode('utf-8')
content = 

# Write the content to a local file


# Print a confirmation message
print(f'File {key} downloaded from bucket {bucket_name} and saved to local file.')
```