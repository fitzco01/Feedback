<?php

    $shopID = $_POST["shopID"];
    $customerID = $_POST["customerID"];

    $server = "localhost";
    $user = "Connor";
    $password = "Connor";
    $db = "Feedback";
    $conn = new mysqli($server, $user, $password, $db);

    if ($conn->connect_error) {
        throw new Exception("Database Error [{$conn->errno}] {$conn->error}");
    } else {

        $outp = "";

        $sql3 = "select * from reviews WHERE (shop_id = '$shopID' and customer_id = '$customerID')";
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
            $outp .= '{"review_id":"' . $rs["review_id"] . '",';
            $outp .= '"customer_id":"' . $rs["customer_id"] . '",';
            $outp .= '"shop_id":"' . $rs["shop_id"] . '",';
            $outp .= '"comment1":"' . $rs["comment1"] . '",';
            $outp .= '"comment2":"' . $rs["comment2"] . '",';
            $outp .= '"comment3":"' . $rs["comment3"] . '",';
            $outp .= '"comment4":"' . $rs["comment4"] . '",';
            $outp .= '"comment5":"' . $rs["comment5"] . '",';
            $outp .= '"star1":"' . $rs["star1"] . '",';
            $outp .= '"star2":"' . $rs["star2"] . '",';
            $outp .= '"star3":"' . $rs["star3"] . '",';
            $outp .= '"star4":"' . $rs["star4"] . '",';
            $outp .= '"star5":"' . $rs["star5"] . '",';
            $outp .= '"duration_seconds":"' . $rs["duration_seconds"] . '",';
                        $outp .= '"date":"' . $rs["date"] . '"}';
        }
        $outp = '{"review":['.$outp.']}';
	}
    echo($outp);
?>