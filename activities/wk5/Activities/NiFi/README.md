# Apache NiFi

### Download

https://nifi.apache.org/download/

Download the Binary NiFi Standard 1.27.0

![image-20240715124201146](images/image-20240715124201146.png)

Download the `nigi-1.27.0-bin.zip` file

![image-20240715125208382](images/image-20240715125208382.png)

Then extract the files inside

![image-20240715130232458](images/image-20240715130232458.png)

In the terminal run the following command to install Java

```shell
 sudo apt-get install openjdk-21-jdk
```

Once installed. Navigate to your `nifi` folder for example `cd Download/nifi-1.27.0/nifi-1.27.0` and run the `bin/nifi.sh start`

![image-20240715130608554](images/image-20240715130608554.png)

Go to the following URL

```
https://localhost:8443/nifi
```

If you see a warning you can click Advanced and then click Accept the Risk and Continue. 

![image-20240715130705786](images/image-20240715130705786.png)

For the User and Password got to he nifi folder, and find the log folder

![image-20240715130802850](images/image-20240715130802850.png)

Open the `nifi-app.log` file

![image-20240715130827957](images/image-20240715130827957.png)

Search in the file for `Generated Username`

![image-20240715130919434](images/image-20240715130919434.png)

Use the provided Username and Password to login to the NiFi Web Portal.

You will then see the main NiFi canvas

![image-20240715131036879](images/image-20240715131036879.png)

---

## Lab  - Build

Create a folder in Desktop called input-files and place the `sample1.txt` file inside. 

* Create a `GetFile` Processor to read from the input-files folder 

* You will use the `PutS3Object` to write the files to S3. You should write to `techcatalyst-public/nifi/<yourname>/raw/`

  * The bucket name is: `techcatalyst-public`
  * The file name is: `nifi/tatwan/raw/${filename}`
  * Add AWS Credentials Service - click create
  * ![image-20240715131549212](images/image-20240715131549212.png)
  * Then go to the service and add your credentials 

  ![image-20240715131630052](images/image-20240715131630052.png)

Once done, enable the service

![image-20240715131746031](images/image-20240715131746031.png)

![image-20240715131800571](images/image-20240715131800571.png)

![image-20240715131825402](images/image-20240715131825402.png)

## Lab - Execution

* Run the first Processor (GetFile). 



![image-20240715131936723](images/image-20240715131936723-1038777.png)

Notice there is one item in Queue 

![image-20240715131959137](images/image-20240715131959137.png)

Run the PutS3Object now. Verify the files has been written in S3

![image-20240715132104470](images/image-20240715132104470.png)

And check the `input-files` folder now. 

It is Empty. The file has been migrated. The default `keep source file` option is set to False so it will move the file and not keep a local copy. 

![image-20240715132309190](images/image-20240715132309190-1038989.png)

![image-20240715132354233](images/image-20240715132354233.png)



And validate the file is in S3

![image-20240715132420627](images/image-20240715132420627.png)

Now move both `sample3.txt` and `sample4.txt` files into he `input-files` folder 

![image-20240715133748631](images/image-20240715133748631.png)

