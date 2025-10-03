# Uber-Ride-Analysis<br><br>Project Overview
This project analyzes Uber ride data to uncover insights about ride patterns, customer behavior, and operational performance. Using SQL for data analysis and dashboarding tools (e.g., Power BI / Tableau / Excel), the project provides both technical querying and visual storytelling.

# Objectives
<ul>
<li>Understand ride demand patterns (time, location, day of week, etc.)</li>
<li>Analyze driver and customer behaviors</li>
<li>Explore cancellations and payment preferences</li>
<li>Build an interactive dashboard for decision-making</li>
</ul>

# Tools & Technologies
<ul>
  <li>SQL (SSMS) – Data cleaning & analysis</li>
  <li>Power BI – Visualization & dashboard building</li>
  <li>GitHub – Documentation & version control</li>
</ul>

# Data Cleaning
<ul>
  <li>Removed duplicates & null values</li>
  <li>Standardized date and time fields</li>
  <li>Categorized ride status (Completed, Cancelled, No Driver Found)</li>
  <li>Ensured consistent formatting for payment methods</li>
</ul>


# Dashboard Highlights
####  The interactive dashboard showcases:
<ul>
  <li>Ride demand trends (hourly, daily, monthly)</li>
  <li>Cancellation reasons & breakdown</li>
  <li>Popular payment methods</li>
  <li>Revenue and fare insights</li>
</ul>

### summary



# SQL Queries Used
### Examples:<br>
-- Total rides per day<br>
SELECT CAST(pickup_time AS DATE) AS RideDate, COUNT(*) AS TotalRides<br>
FROM uber_rides<br>
GROUP BY CAST(pickup_time AS DATE)<br>
ORDER BY RideDate;<br>

-- Payment method distribution<br>
SELECT payment_method, COUNT(*) AS TotalPayments<br>
FROM uber_rides<br>
GROUP BY payment_method;<br>

# Learnings & Takeaways
<ul>
  <li>Gained hands-on experience with SQL for data analysis</li>
  <li>Built an end-to-end data project from raw data to visualization</li>
  <li>Learned how to tell a data story using dashboards</li>
</ul>
