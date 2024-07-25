# Utilize AWS AI Services (Comprehend and Rekognition)

* You will be using Boto3 library 
* If you create an `aws.cfg` **please make sure you do not upload that file into your GitHub**. Instead create a `.gitignore` file and add `aws.cfg` to it.

# Sentiment Analysis 

There are two CSV datasets: `product` and `review`. The client wants to combine the datasets and add a sentiment column. Finally, they want a quick summary on the Sentiment counts displayed as Bar Graph using Python. Finally,  write it back to the S3 bucket as `/YOURNAME/product_sentiment.csv`

What is the overall impression/sentiment for their products?



![image-20240725145431823](images/image-20240725145431823.png)

*Figure of the final DataFrame/Table*

![image-20240725145642642](images/image-20240725145642642.png)



# License Plate States

The client has difference images of licenses plates from different states. They want to get a summary counts of license plates by state. They also want to create a table (DataFrame) that labels each image with the proper state and write it back to the S3 bucket as `/YOURNAME/image_state.csv`

HINT: When using Rekognition to read from an S3 bucket, it should be on the same region. 



![image-20240725150136999](images/image-20240725150136999.png)

*Figure of the final DataFrame/Table*





![image-20240725150225590](images/image-20240725150225590.png)

## Upload the images

The two plots you created you will need to save them as `.jpg` files and then upload them to the same location as the `csv` files you just created.

**HINT**

```python
# You will need to import Matplotlib 
import matplotlib.pyplot as plt

# Create a plot
ax = # Save your pandas plot as a variable 

# Save the plot as a JPG file
plt.savefig('yourfilename.jpg', format='jpg')
```

Then upload the image into S3.