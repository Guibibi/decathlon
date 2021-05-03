1. Create a Ruby on Rails application that has a:

-   Place model with lat, lng, name, zip code, address, country
-   Tag model

2. Import and save Places and Tags from the CSV file (attached).
3. As you can see, you only have lat / lng in the CSV, find a way to get the full address and save it thanks to your model (zip code, address, country). You can use this Google API Key ( AIzaSyAmd7W1Q6vrrZ3AYeE4HbTCTVYFhSM1lxg)
4. Add controller that list places with a tag
   -> example localhost:3000/tags/outdoor will find all places tagged outdoor

5. Optional (bonus) : find all places near a lat, lng within 10km
   -> localhost:3000/places/search?lat=45.55&lng=-73.63

Important:
Please write tests for every feature you add.
1 commit / 1 task.
Code hosted on Github.
Data import (CSV) and application must be executable for anyone on their local machine.
No need to host the application.

You have 72h to complete the test (until Friday morning), good luck !
