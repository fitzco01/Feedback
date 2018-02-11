<?php
//Store entered data in variables for ease
    $shopID = $_POST["shopID"];
    $question1 = $_POST["question1"];
    $question2 = $_POST["question2"];
    $question3 = $_POST["question3"];
    $question4 = $_POST["question4"];
    $question5 = $_POST["question5"];
    $star1 = $_POST["star1"];
    $star2 = $_POST["star2"];
    $star3 = $_POST["star3"];
    $star4 = $_POST["star4"];
    $star5 = $_POST["star5"];
    $timer = $_POST["timer"];

//Write to the database 
    $servername = "localhost";
    $username = "Connor";
    $pass = "Connor";
    $dbname = "Feedback";

    // Create connection
    $conn = new mysqli($servername, $username, $pass, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // if not exists... just like sql at work

    //Write to the database 
    $sql = "INSERT INTO questions (school, teamName, competitionDivision, city, state, conference, region, genderDivision, twitterHandle, password)
        VALUES ('$school', '$teamName', '$competitionDivision', '$city', '$state', '$conference', '$region', '$genderDivision', '$twitterHandle', '$password')";
    //Error handling
    if ($conn->query($sql) === TRUE) {
        echo "<p>$school has been added to the database.</p>";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    //Close connection
    $conn->close();
    ?>     