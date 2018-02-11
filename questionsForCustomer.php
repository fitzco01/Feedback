<?php

    $shopID = $_POST["shopID"];

    $server = "localhost";
    $user = "Connor";
    $password = "Connor";
    $db = "Feedback";
    $conn = new mysqli($server, $user, $password, $db);

    if ($conn->connect_error) {
        throw new Exception("Database Error [{$conn->errno}] {$conn->error}");
    } else {

        $outp = "";

        $sql3 = "select * from questions WHERE (shop_id = '$shopID')";
        $result3 = $conn->query($sql3);

        if (!$result3) {
            throw new Exception("Database Error [{$conn->errno}] {$conn->error}");
        }

        $arr = array(); // make a new array to hold all your data

        while($row2 = mysqli_fetch_assoc($result)){ // loop to store the data in an associative array.
             $arr[] = $row2;
        }

        foreach($arr as &$rs) {
            if ($outp != "") {$outp .= ",";}
            $outp .= '{"question_id":"' . $rs["question_id"] . '",';
            $outp .= '"shop_id":"' . $rs["shop_id"] . '",';
            $outp .= '"quesion1":"' . $rs["question1"] . '",';
            $outp .= '"question2":"' . $rs["question2"] . '",';
            $outp .= '"question3":"' . $rs["question3"] . '",';
            $outp .= '"question4":"' . $rs["question4"] . '",';
            $outp .= '"question5":"' . $rs["question5"] . '",';
            $outp .= '"star1":"' . $rs["star1"] . '",';
            $outp .= '"star2":"' . $rs["star2"] . '",';
            $outp .= '"star3":"' . $rs["star3"] . '",';
            $outp .= '"star4":"' . $rs["star4"] . '",';
            $outp .= '"star5":"' . $rs["star5"] . '",';
            $outp .= '"timer":"' . $rs["timer"] . '"}';
        }
        $outp = '{"question":['.$outp.']}';
	}
    echo($outp);
?>