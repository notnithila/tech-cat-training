## **Case Study: Global Sales Analysis for NorthWind Traders**

#### **Background:**

NorthWind Traders is a global trading company that deals with various products ranging from machinery to furniture. The company operates in several regions worldwide and has a vast customer and supplier network. As the newly hired data analyst for NorthWind Traders, you've been approached by the Chief Sales Officer (CSO), Ms. Amelia Clark.

Ms. Clark has been noticing some fluctuations in sales and wants to gain a deeper understanding of the company's operations to strategize better for the upcoming fiscal year. She hands you access to the company's sales database and outlines her primary concerns.

------

#### **Ms. Clark's Requests:**

1. **Supplier Diversity:** "We value diversity in our supply chain. Can you provide a breakdown of our suppliers by nation? I want to see which nations have the most suppliers working with us."
2. **Top Performing Products:** "I've heard from our sales team that certain products are flying off the shelves, while others aren't doing as well. Could you identify the top 10 most ordered products? It would help to see the product name and the total quantity ordered."
3. **Customer Loyalty:** "We've had a customer loyalty program running for a couple of years now. I'm curious to see which customers have placed the most orders with us. Let's say, the top 20? It might be a good idea to send them a thank-you note or a special discount."
4. **Regional Sales Performance:** "Our company operates in various regions. I'd like an overview of the total sales value for each region. It would help us allocate resources more efficiently."
5. Building **Market Segment Insights:** "We cater to different market segments. Can you breakdown the total sales for each market segment? I've heard the 'BUILDING' and 'AUTOMOBILE' segments have been doing exceptionally well."
6. **Potential Issues:** "Lastly, I want to ensure we're not missing out on any opportunities. Could you list out customers who haven't placed any orders with us? It might be a good idea to have the sales team reach out to them."

------

#### **Guidelines:**

You decide to approach Ms. Clark's requests systematically. Using your knowledge of SQL, especially inner joins, you start crafting your queries using the relevant tables: `CUSTOMER`, `SUPPLIER`, `ORDERS`, `LINEITEM`, `NATION`, `REGION`, and others.

Remember, while crafting your SQL queries:

- Ensure your results are clear and well-organized.
- Add necessary comments to your SQL code for clarity.
- After retrieving the data, take a moment to analyze and see if you can spot any trends or insights that might be valuable for Ms. Clark.

Once you've gathered all the data, you plan to present your findings to Ms. Clark, helping her make informed decisions for NorthWind Traders' future strategies.

> **HINT**
>
> `Total Sales Value = SUM(ExtendedPrice x (1 - Discount))`
>
> This information comes from the LINEITEM table 
