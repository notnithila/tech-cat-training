# ThoughtSpot Tutorial

## Create a new Liveboard 

Click the Liveboards tab, and then select the `+ Liveboard` button to create a new Liveboard

![image-20240731132057859](images/image-20240731132057859.png)

Click on the Home tab

![image-20240731131740536](images/image-20240731131740536.png)

Then in the search, select the `(Sample) Retail - Apparel `data

![image-20240731132126676](images/image-20240731132126676.png)

From the drop down select the dataset 

![image-20240731132150016](images/image-20240731132150016.png)

**NOTE: DO NOT WORRY ABOUT MATCHING THE VIZ COLORS IN THE SCREEN SHOTS**

In the search type `sales by item type` which will produce your visualization 

![image-20240731132234353](images/image-20240731132234353.png)

Click on the table view to inspect the data

![image-20240731132258170](images/image-20240731132258170.png)

Click on the **Edit** button 

![image-20240731132402208](images/image-20240731132402208.png)

Then click on settings ![image-20240731132416510](images/image-20240731132416510.png)

![image-20240731132440404](images/image-20240731132440404.png)

Sort the chart by Descending order by Sales

![image-20240731132521791](images/image-20240731132521791.png)

The Regression line has no meaning, go edit the chart and remove the regression line

Notice the search query has changed based on the sort

![image-20240731132638638](images/image-20240731132638638.png)

![image-20240731132644362](images/image-20240731132644362.png)

To save your visualization click the **Pin** button to pin it to your liveboard 

![image-20240731132820715](images/image-20240731132820715.png)

You can click the **View Liveboard** which will take you to your page

![image-20240731132853827](images/image-20240731132853827.png)

Let’s add another visualization. You can click home to the main search menu and type

`quantity purchased by product 2021 top 10`

![image-20240731133122819](images/image-20240731133122819.png)

Clcik **Edit**

Change the Chart type

![image-20240731133156574](images/image-20240731133156574.png)

Then Pin the final visualization to your Liveboard 

You can click the **View Liveboard**

![image-20240731133251162](images/image-20240731133251162.png)



We will add few more visualizations. I will show you the queries and you will modify the visualization 

**Query** `sales item type 2021`

View 

![image-20240731133438539](images/image-20240731133438539.png)

**Query** `sales store 2021 top 10`

![image-20240731133515935](images/image-20240731133515935.png)



**Query** : `sales by state 2021`

![image-20240731133608669](images/image-20240731133608669.png)

Edit the **Total quantity purchased by product** to include labels as shown

This is my final Liveboard view

![image-20240731140051842](images/image-20240731140051842.png)

Click the Edit icon ![image-20240731140136287](images/image-20240731140136287.png)

You will add a new tab and move some of the visuals there 

Click +Add tab and call it `Performance` and then add another tab and call it `Overview`

![image-20240731140248020](images/image-20240731140248020.png)



In the Map visual click ![image-20240731140351291](images/image-20240731140351291.png)

Then select Move to tab, and select Overview. 

![image-20240731140323207](images/image-20240731140323207.png)

Do the same for the Pie Chart visual.

When done click **Save** on the top right corner.

Create two more visuals using the following Queries: `total sales in 2021` and `total quantity purchased in 2021` these will create KPI visual. Add each one to your Liveboard 

Move the two visuals you just created to the Overview tab

Notice when you click the ![image-20240731140802699](images/image-20240731140802699.png) in the visual box you get to select the size/shape of the visual as shown ![image-20240731140830674](images/image-20240731140830674.png)

You can also move the visuals around and adjust their size. 

Make the necessary changes to make both tabs look like the following 

![image-20240731141023874](images/image-20240731141023874.png)

Add a note to the Overview tab

![image-20240731141209473](images/image-20240731141209473.png)

Click Add filter while you are still in Edit mode 

![image-20240731141244224](images/image-20240731141244224.png)

![image-20240731141257351](images/image-20240731141257351.png)

Select Region, then select East, Midwest, and Southwest 

![image-20240731141340195](images/image-20240731141340195.png)

Then click Apply

Noice the the screen now has a global filter 

![image-20240731141411425](images/image-20240731141411425.png)

Update the filter to include only **east** then hit apply. Check the Overview tab and see how the numbers changed as well as the map

![image-20240731141522115](images/image-20240731141522115.png)

Add another filter, this time **date**

Click Fixed tab, and select Between and hit apply. Finally click SAVE to apply all the changes. 

Click the date filter, and select ![image-20240731141816930](images/image-20240731141816930.png)and hit apply. Try different dates. 

![image-20240731141852362](images/image-20240731141852362.png)

Right click on the Pants column from the Total sales by item type, then click Filter

![image-20240731141921356](images/image-20240731141921356.png)



Undo the filter.

Right click Pants again, this time select Drill down option

![image-20240731142009578](images/image-20240731142009578.png)

Select store

![image-20240731142023909](images/image-20240731142023909.png)

Right click New Jersey and click Filter

Once done. Click Clear all from the top left 

![image-20240731142120948](images/image-20240731142120948.png)

---

## Functions

Click **Search data** and select the (Sample) Retail - Apparel dataset

![image-20240731142237808](images/image-20240731142237808.png)

Search `sales by item type`

![image-20240731142308054](images/image-20240731142308054.png)

Switch to table view

![image-20240731142320915](images/image-20240731142320915.png)

In the data panel , click the + Add button, and select **Formula** 

![image-20240731142408661](images/image-20240731142408661.png)

This will show the Formula Editor 

![image-20240731142418510](images/image-20240731142418510.png)

Make the following updates then click Save

![image-20240731142504179](images/image-20240731142504179.png)

The Table will be updated. You can also see the Formulas section with all the formulas listed nuder the data panel 

![image-20240731142544106](images/image-20240731142544106.png)

Update the query `by item type Sales Increase by 20% by month`

![image-20240731143322036](images/image-20240731143322036.png)

Add it to your Liveboard

Run a new query `sales and quantity purchased by store`

![image-20240731143550557](images/image-20240731143550557.png)



Change Total Sales to Average and Total Quantity Purchased to Average 

![image-20240731143628154](images/image-20240731143628154.png)

Create a new formula 

![image-20240731143802823](images/image-20240731143802823.png)

Click number formatting

And make the following changes

![image-20240731143852830](images/image-20240731143852830.png)

Click on Store an add a filter for the specific stores

![image-20240731144012420](images/image-20240731144012420.png)

Click on Chart view

![image-20240731144034923](images/image-20240731144034923.png)

Create a new query `sales by product` and change to table view

Add a formula 

![image-20240731144345319](images/image-20240731144345319.png)

Update the Query 

![image-20240731144523567](images/image-20240731144523567.png)

Create a new formula 

![image-20240731144647254](images/image-20240731144647254.png)

![image-20240731144744374](images/image-20240731144744374.png)

![image-20240731144751553](images/image-20240731144751553.png)

---

## SpotIQ

Try this Query

![image-20240731145424526](images/image-20240731145424526.png)

Click Edit

Then select SpotIQ Analyze

![image-20240731145452804](images/image-20240731145452804.png)

![image-20240731145515259](images/image-20240731145515259.png)

Finally go to the SpotIQ space

![image-20240731145545587](images/image-20240731145545587.png)

Review the output 



















