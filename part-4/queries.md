# Part 4: SQL
Record your queries and any resulting output below.

## Release 0:  Query the Database
1.  What are all the challenge names?
    
    Query:
  
    ```sql
    SELECT name
    FROM challenges;
    ```
    
    Result:
  
    ```sql
    active-record-validations
    api-only-rails
    flashcards-group
    generators-in-python-and-
    hashes-vs-arrays
    integrating-testing-with-
    intro-to-active-record
    javascript-closures
    javascript-in-rails
    jquery-ajax
    lambda-in-python
    learning-angular
    list-comprehension-in-pyt
    rails-starter-app
    react-native-hello-world
    recursion-with-unicorns
    sinatra-vs-rails
    sql-joins
    sudoku-group
    unit-testing-with-rspec 
    ```
  
2.  Which challenge names include the word "javascript"?
    
    Query:
  
    ```sql
    SELECT name
    FROM challenges
    WHERE name LIKE "%javascript%";
    ```
    
    Result:
  
    ```sql
    generators-in-python-and-javascript
    javascript-closures
    javascript-in-rails
    ```
  
3.  What are the ids of the challenges submitted by Jane Miller?
    
    Query:
  
    ```sql
    SELECT challenges.id
    FROM challenges
    JOIN submissions ON challenges.id = submissions.challenge_id
    JOIN users on submissions.user_id = users.id
    WHERE users.name="Jane Miller";

    ```
    
    Result:
  
    ```sql
    2
    7 
    ```
  
4.  What are the names of the challenges submitted by Jackie McNeil? (Each name should be listed once; no repeats.)
    
    Query:
  
    ```sql
    SELECT DISTINCT challenges.name
    FROM challenges
    JOIN submissions ON challenges.id = submissions.challenge_id
    JOIN users on submissions.user_id = users.id
    WHERE users.name="Jackie McNeil";
    ```
    
    Result:
  
    ```sql
    javascript-in-rails 
    ```
  
5.  What are the names of the users who submitted the challenge named "sinatra-vs-rails"? (Each name should be listed once; no repeats.)
    
    Query:
  
    ```sql
    SELECT DISTINCT users.name
    FROM challenges
    JOIN submissions ON challenges.id = submissions.challenge_id
    JOIN users on submissions.user_id = users.id
    WHERE challenges.name="sinatra-vs-rails";
    ```
    
    Result:
  
    ```sql
    Dustin Wells
    Gerald Wooda
    Jane Miller
    Ray Locke 
    ```
  
6.  What is the name of the challenge with the most submissions, and how many submissions does it have?
    
    Query:
  
    ```sql
    SELECT challenges.name, COUNT(submissions.id)
    FROM challenges
    JOIN submissions ON challenges.id = submissions.challenge_id
    GROUP BY challenges.id
    ORDER BY COUNT(submissions.id) DESC LIMIT 1;
    ```
    
    Result:
  
    ```sql
    sinatra-vs-rails  5
    ```
  

### Release 1: Modify the Database  
1.  The "javascript-closures" challenge, one of the challenges in the database, was submitted by Skylar Lawson. Update the database to reflect this.
  
    Statements run:
  
    ```sql
    INSERT INTO users (name, email, created_at, updated_at)
    VALUES ("Skylar Lawson","sky@lawson.com", DATETIME('now'), DATETIME('now'));
    INSERT INTO submissions (user_id, challenge_id, created_at, updated_at) VALUES (14, 17, DATETIME('now'), DATETIME('now'));
    ```

2.  The "api-only-rails" challenge was renamed to "build-an-api-in-rails". Update the database to reflect this.
  
    Statements run:
  
    ```sql
    UPDATE challenges
    SET name = "build-an-api-in-rails"
    WHERE name = "api-only-rails";
    ```

3.  The "learning-angular" challenge was removed. Remove this challenge and its submissions from the database.
  
    Statements run:
  
    ```sql
    DELETE FROM submissions
    WHERE challenge_id = 6;
    DELETE FROM challenges
    WHERE name = "learning-angular";
    ```