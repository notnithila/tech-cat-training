# Lab: Utilize AWS AI Services 

## Case Study Overview

A client is considering using AWS AI services to meet their business needs instead of hiring a data science team to develop custom models. They need to analyze both images and text data and have heard of AWS Comprehend and AWS Rekognition but are unsure if these services are suitable. You have been asked to conduct a small Proof of Concept (POC) using a handful of datasets to evaluate these services. Your assessment will be critical in determining the client's direction. They are considering migrating to AWS, and this use-case is significant enough that they are willing to fully move into the cloud based on your findings.

## Client Data

- **S3 Bucket**: For the purpose of this POC, the client has placed their data in the `techcatalyst-public` bucket under `resources` in the `us-west-2` region.
- **Production System**
  - **Product System**: Product reviews are stored in a local PostgreSQL database.
  - **License Plate Images**: Captured images are stored on a shared network folder on-premise.

## Task Requirements

1. **Sentiment Analysis on Product Reviews**
2. **License Plate State Identification**

You will use the Boto3 library for interacting with AWS services. Ensure that any AWS configuration file (`aws.cfg`) is excluded from version control by adding it to a `.gitignore` file.

## Sentiment Analysis

**Data Sources**:

- `product.csv`
- `review.csv`

**Tasks**:

1. Combine the datasets and add a sentiment column using AWS Comprehend.
2. Generate a bar graph summarizing sentiment counts.
3. Save the updated dataset as `/YOURNAME/product_sentiment.csv` in the S3 bucket.



![image-20240725145431823](images/image-20240725145431823.png)

*Figure of the final DataFrame/Table*

![image-20240725145642642](images/image-20240725145642642.png)

## License Plate State Identification

**Data Sources**:

- License plate images from various states.

**Tasks**:

1. Use AWS Rekognition to identify the state from each license plate image.
2. Create a summary table of license plate counts by state.
3. Save the labeled dataset as `/YOURNAME/image_state.csv` in the S3 bucket.

HINT: When using Rekognition to read from an S3 bucket, it should be on the same region. 



![image-20240725150136999](images/image-20240725150136999.png)

*Figure of the final DataFrame/Table*





![image-20240725150225590](images/image-20240725150225590.png)

## Plot Upload

**Tasks**:

1. Save the bar graph (sentiment analysis) as a `.jpg` file.
2. Save the license plate state summary plot as a `.jpg` file.
3. Upload both plots to the same location in the S3 bucket as the CSV files.

### Hints

**Saving plots as .jpg files in Python**:

```python
# Import Matplotlib
import matplotlib.pyplot as plt

# Generate and save a plot
ax = # Your plot code here
plt.savefig('yourfilename.jpg', format='jpg')
```

### Conclusion

Summarize your findings and create an architecture diagram of the proposed solution. Provide feedback and recommendations on whether the client should move all their assets to AWS based on the POC results.


