## Reservation Data Analysis Project Questionnaire

### Project Data Points
1. Across all reservation partners for January & February, how many completed reservations occurred?

130 (I'm interpreting completed as meaning not canceled and checked-in)

2. Which studio has the highest rate of reservation abandonment (did not cancel but did not check-in)?

mindbody

3. Which fitness area (i.e., tag) has the highest number of completed reservations for February?

yoga

4. How many members completed at least 1 reservation and had no more than 1 cancelled reservation in January?

16

5. At what time of day do most users book classes? Attend classes? (Morning = 7-11 AM, Afternoon = 12-4 PM, Evening = 5-10 PM)

Most popular booked: Morning  
Most popular attended: Morning (I'm going to assume they attended if they checked-in, regardless of whether it says they cancelled)

6. How many confirmed completed reservations did the member (ID) with the most reserved classes in February have?

5

7. Write a query that unions the `mindbody_reservations` table and `clubready_reservations` table as cleanly as possible.

I took the approach of only including the fields that exist in both tables as this would yield the most complete dataset.
See peerfit-project/project/solution/sql-query-7.sql

### Project Discussion
1. What opportunities do you see to improve data storage and standardization for these datasets?

2. What forecasting opportunities do you see with a dataset like this and why?

3. What other data would you propose we gather to make reporting/forecasting more robust and why?
