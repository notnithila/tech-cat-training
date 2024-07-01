###  Analyzing Car Insurance Claims Data

#### Background:

Imagine you are a Business Data Analyst at SafeDrive Insurance, a company that provides car insurance policies to drivers across the country. The company has been experiencing a surge in insurance claims over the past year and is keen on understanding the underlying patterns and factors contributing to this rise. Your task is to analyze the claims data, identify patterns, and provide insights through data visualization to help the management understand the current situation and potentially devise strategies to mitigate costs.

#### Data:

##### Claims Table

- `ClaimID`: Unique identifier for each claim.
- `PolicyHolderID`: Identifier for PolicyHolder table.
- `ClaimDate`: Claims Date.
- `VehicleTypeID`: Foreign key to VehicleType table.
- `VehicleAge`: Age of the vehicle in years. 
- `ClaimAmount`: The amount claimed by the policyholder.
- `AccidentTypeID`: Foreign key to AccidentType table.
- `Fault`: Whether the policyholder was at fault (Yes/No).
- `ZipCode`: PolicyHolder Zip Code

**Date Table**

- `ClaimDate`: The actual date.
- `ClaimMonth`: Month extracted from the date.
- `ClaimYear`: Year extracted from the date.
- `ClaimQuarter`: Quarter extracted from the date.
- `ClaimDayOfWeek`: Day of week number extracted from the date.
- `ClaimDayOfWeekName`: Day of week name extracted from the date.

**Location Table**

- `City`: City where the accident occurred.
- `State`: State where the accident occurred.
- `ZipCode`: Zip code of the accident location.

**Vehicle Table**

- `VehicleID`: Unique identifier for each vehicle.
- `VehicleType`: Type of vehicle involved in the claim (Motorcycle, SUV, Truck, Sedan)

**PolicyHolder Table**

- `PolicyHolderID`: Unique identifier for each policyholder.
- `Age`: Age of the policyholder.
- `Gender`: Gender of the policyholder.

**AccidentType Table**

- `AccidentTypeID`: Unique identifier for each accident type.
- `AccidentType`: Description of the accident type (Collision, Fire, Theft, Vandalism)

#### Tasks:

1. **Data Exploration using SQL:**
   - Investigate the data for any inconsistencies, missing values, or outliers in SQL
2. **Data Analysis  using SQL:**
   - Identify the top cities with the highest number of claims using SQL
   - Provide a summary of basic statistics of the data (3-4 summary analysis). Using to SQL to include:
     - **Count:** Number of claims, number of policyholders, number of claims per location
     - **Sum:** Total claim amount, total claim amount per accident type
     - **Average:** Average claim amount, average age of policyholders
     - **Minimum and Maximum:** Minimum and maximum claim amounts, youngest and oldest policyholder
   - Analyze the distribution of claims across different accident types.
   - Analyze the gender and age distribution across different types of accidents.
   - Identify if certain vehicle types are more prone to specific accident types
   - Which year had the highest number of claims?
   - Which year had the lowest number of claims?
   - What is the most common vehicle type?
   - What is the most common accident type?
