# Cyclistic Bike-Share Analysis

## Overview

This project analyzes user behaviour in a bike-share system to understand the differences between casual riders and annual members, and identify strategies to convert casual users into paying members.

---

## Business Problem

Cyclistic aims to increase revenue by converting casual riders into annual members.

The key question:
How do casual riders and members use bikes differently, and how can this inform conversion strategies?

---

## Data Source

Dataset: Cyclistic Bike-Share Data (Divvy / Motivate International Inc.)

The dataset includes 12 months of ride data, with information on trip duration, start time, and user type. :contentReference[oaicite:1]{index=1}  

---

## Tools Used

- SQL — data cleaning, transformation, aggregation  
- Power BI — dashboard and visualisation  

---

## Data Preparation

- Combined 12 months of trip data  
- Removed null and invalid records  
- Created calculated columns:
  - ride_length  
  - day_of_week  
  - hour_of_day  
- Standardised user types (casual vs member)  

---

## Analysis Approach

- Compared usage patterns between casual and member riders  
- Analyzed:
  - Ride frequency  
  - Ride duration  
  - Hourly usage  
  - Weekly patterns  
- Built a Power BI dashboard to visualise differences  

---

## Key Insights

### 1. Members Ride More Frequently
Members account for ~64% of total rides, indicating consistent usage.

---

### 2. Casual Riders Take Longer Trips
- Casual: ~14 minutes  
- Members: ~11 minutes  

Casual users treat bikes as a leisure activity.

---

### 3. Time-Based Behaviour Differences
- Members peak during commute hours (morning and evening)  
- Casual users peak in the afternoon  

This shows different use cases: commuting vs leisure.

---

### 4. Weekend vs Weekday Usage
- Casual riders increase usage on weekends  
- Members ride consistently throughout the week  

Casual usage is tied to free time, not routine.

---

## Business Implications

- Members use bikes as part of daily routines  
- Casual riders use bikes occasionally for leisure  
- Conversion requires shifting behaviour from occasional to habitual  

---

## Recommendations

### 1. Target Weekend Casual Riders
Focus on users already engaging during leisure time.

Offer:
- Weekend promotions  
- Membership discounts after multiple rides  

---

### 2. Promote Membership as a Cost-Saving Option
Show casual users that frequent riding is cheaper with membership.

Use:
- Cost comparison messaging  
- “Upgrade after X rides” prompts  

---

### 3. Encourage Habit Formation
Convert occasional riders into routine users through:

- Ride streaks  
- Commuter incentives  
- Weekly usage summaries  

---

## Business Impact

If casual riders adopt commuting behaviour:

- Ride frequency increases  
- Revenue becomes predictable  
- Customer retention improves  

---

## Limitations

- No demographic data  
- No pricing data  
- Cannot directly track conversion behaviour  

---

## Project Structure

├── data/ # Raw data
├── analysis/ # SQL scripts
├── powerbi/ # Dashboard file
├── images/ # Dashboard screenshots
├── docs/ # Case study PDF
└── README.md

---

## Dashboard Preview

<img width="1408" height="786" alt="Cyclistic- member vs casual rider insights" src="https://github.com/user-attachments/assets/6f4443c3-cd04-46d6-a72b-678f9b1d9a04" />

---

## Conclusion

Casual riders and members use bikes for fundamentally different purposes.

The key growth opportunity lies in converting leisure-based usage into habitual, routine behaviour through targeted marketing and incentives.
