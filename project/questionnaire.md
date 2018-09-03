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

There are several opportunities for improvement if best practices were to be implemented. First, I would not have a separate table for each fitness studio and I would employ some normalization. A traditional RDB would have a single table that contains the member_class transactions. This table would consist of: member_id, viewed_datetime, reserved_datetime, canceled_datetime, class_datetime, checked_in_datetime, and foreign keys to the lookup tables. There would be a separate lookup table each for studio, class, and instructor information. I'm unclear on what the level field represents. If it represents floors in a building and each class could be on any floor, I may put it with the transactions/fact table. If classes are forever on the same floor, I'd put it in with the class info table.

Another improvement would be making sure all fields from both tables are complete and contain the same fields. They both have fields that the other doesn't and mindbody has some nulls for the studio_key. Also, the canceled field should either be a t/f or datetime for both tables.

2. What forecasting opportunities do you see with a dataset like this and why?

The forecasting opportunities I see would operate off of trends for reservations, cancelations, and check-ins. You could forecast the future state of all of these metrics per studio, city, state, zip, and class_tag by using this historical information.

3. What other data would you propose we gather to make reporting/forecasting more robust and why?

I would propose gathering weather data to better forecast (haha) or predict how the weather impacts cancellations and check-ins. I would add in more instructor, member, and class data to determine which characteristics of all of these influence the reservations of members, so you could focus on adding more studios that have the most of these characteristics. It could also help determine if there's a larger market potential for certain classes or for certain member demographics. Figuring out the popularity of studios and classes per state or zip code would help to focus marketing. Additionally, it would be helpful to know the employers of the members at these studios, so you could see how successful Peerfit's partnership with these employers is.

Oh, and it would be great to add calculated fields that you can use for seeing which classes members completed or abandoned. It would be quicker and easier to query for them rather than having to set criteria on multiple datetime fields.
