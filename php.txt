<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/public/css//style.css">
    <link rel="stylesheet" href="/public/css//backend.css">
    <title>Algo php</title>
</head>

<body>

<!-- ----
ALGO
---- -->

<!-- <?= "Le loup a faim."?> -->

<section class="condition_tests">

    <?php
        $age = 14;
        $enter_autorize = true;
        // ternary condition
        ($age < 18) ? $enter_autorize = true : $enter_autorize = false;
        // affects true or false to adult var
        $adult = ($age >= 18) ? true : false;

        if ($enter_autorize) 
        {
        ?>

    <h1>This is a children only website. Are you a child ? The answer is yes, cause you're <?php echo $age ?>.</h1>
    <p><span>Welcome home :)</span></p>

    <?php
        }
        else if (! $enter_autorize) {
            echo "<h1>This is a children only website. Are you a child ? The answer is no, cause you're $age.</h1>Leave ! Here is not for you !";
        }
    ?>

</section>

<section class="condition_tests">

    <?php
        $grade = 0;
        
        switch ($grade) {
            case '10':
                echo "this is average";
            break;
            
            case '0':
                echo "this is sad";
            break;

            case '20':
                echo "this is great";
            break;
            
            default:
            echo "this is not average";
            break;
        }
    ?>

</section>

<br>

<section class="while">

    <?php

        // $line_number = 1;
        
        // while ($line_number <= 100) {
        //     echo 'Je ne dois pas regarder les mouches voler quand j\'apprends le PHP. Pfiou, plus que ' . (100-$line_number) . ' lignes !<br>';
        //     $line_number++;
        // }
        
        for ($line_number = 0 ; $line_number < 5 ; $line_number++) {
            echo 'Je ne dois pas regarder les mouches voler quand j\'apprends le PHP. Pfiou, plus que '.        (5-$line_number).' lignes !';
            ?>
            <br>
            <?php
        }

    ?>

</section>

<br>

<section class="array">

    <?php

        $names = array('Mike', 'Leah', 'Dan');
        $names[3] = 'Daniel';
        $names[] = 'Jack';
        $arr_case = 0;
        // while ($names[$arr_case]) {
        //     echo $names[$arr_case] . '<br>';
        //     $arr_case++;
        // }
        echo '<br>';
        foreach ($names as $element) {
            $element = $element . ' Price' . '<br>';
            echo $element;
        }

    ?>

<br><br>

    <?php

        //asociative array
        $contact = array(
            'firstname' => 'Sarah',
            'lastname' => 'Stewart',
            'age' => '25',
            'town' => 'Springfield');
        $contact['gender'] = 'female';
        // echo $contact['firstname'];
        
        // foreach($contact as $key => $value) {
        //     echo $key . ' = ' . $value . '<br>';
        // }

        // echo "<pre>";
        // // displays html array, pre displays indentation
        // print_r($contact);
        // echo "</pre>";
        
        // ask if key exists in table
        echo array_key_exists('age', $contact);
        echo '<br>';
        // ask if value exists in table
        echo in_array('Stewart', $contact);
        echo '<br>';
        // returns key of a value
        echo array_search('Sarah', $contact);
        echo '<br>';
        // strlen returns string length
        $town_key_length = strlen($contact['town']);
        echo $town_key_length . '<br>';
        // str_replace replaces a string piece
        $string_replacement = str_replace('need', 'love', 'I need you');
        echo $string_replacement . '<br>';
        // string shuffle to mix carachters
        $string_to_shuffle = "this strings is meant to be shuffled";
        $shuffled_string = str_shuffle($string_to_shuffle);
        echo $shuffled_string . '<br>';
        // strtolower and strtoupper to transform text
        $lower_text = 'this is lower text...';
        $upper_text = 'THIS IS UPPER TEXT...';
        echo strtolower($upper_text) . strtoupper($lower_text) . '<br>';
        echo date('h') . 'h' . date('i') . '<br>';
        echo date('d') . '/' . date('m') . '/' . date('y');
        echo '<br><br>';
        
    ?>

</section>

<section class="function">

    <?php

        function sayHello($name) {
            echo 'Hello ' . $name . ' ! <br>';
        }
        sayHello('Benoit');

        function volumeCone($radius, $height) {
            $volume = $radius * $radius * 3.14 * $height * (1/3);
            return $volume;
        }
        $volume = volumeCone(3, 5);
        echo $volume . '<br><br>';

    ?>

</section>

<?php 

//     // isset() checks if the value of a var is set or not
//     if (isset($_GET['firstname']) AND isset($_GET['lastname']) AND isset($_GET['repeat'])) {
//         // convert parameter to int
//         $_GET['repeat'] = (int) $_GET['repeat'];
//         // check repeat value is between 1 and 100
//         if ($_GET['repeat'] >= 1 AND $_GET['repeat'] <= 100) {
//             for ($i=0; $i < $_GET['repeat']; $i++) { 
//                 echo 'Hello ' . $_GET['firstname'] . ' ' . $_GET['lastname'] . ' !<br>';
//             }
//         }
//         else {
//             echo "Repeat parameter is not valid.";
//         }
//     }
//     else {
//         echo 'You must define fistname, lastname and repeat !';
//     }

?>

<!-- ---------------
FORMS RECEIVING
--------------- -->

<div class="post">
    <!-- htmlspecialchars prevents from any html code insertion via displaying tags -->
    <!-- strip_tags prevents the same hiding the tags -->
    <!-- <div><?php echo htmlspecialchars($_POST['pseudo']);?></div>
    <div><?php echo htmlspecialchars($_POST['message']);?></div>
    <div><?php echo htmlspecialchars($_POST['select']);?></div>
    <div><?php echo htmlspecialchars($_POST['checkbox']);?></div>
    <div><?php echo htmlspecialchars($_POST['radio']);?></div>
    <div><?php echo htmlspecialchars($_POST['hidden']);?></div> -->
    <!-- <div><?php echo $_FILES['file']['name'] . '<br>' . $_FILES['file']['type'] . '<br>' . $_FILES['file']['size'] . '<br>' . $_FILES['file']['tmp_name'] . '<br>' . $_FILES['error']['size'];?></div>
    <pre><?php print_r($_POST)?></pre> -->
    <?php $pathinfo = pathinfo($_FILES['file']['name']);
    $pathinfo_extension = $pathinfo['extension'];
    // echo $pathinfo_extension;?>
    <?php 
    // check if file exists and if no error
        if (isset($_FILES['file']) && $_FILES['file']['error'] == 0) {
            // check if file size is under 1000000 octet that is 1 Mo
            if ($_FILES['file']['size'] <= 1000000) {
                // array function creates an array
                $allowed_extensions = array('jpg', 'jpeg', 'gif', 'png');
                // checks if a value (here $pathinfo_extensionexists in an array (here $allowed_extensions) and then validate
                if (in_array($pathinfo_extension, $allowed_extensions)) {
                    // move uploaded file from uploading path to new one
                    // basename — Returns trailing name component of path
                    move_uploaded_file($_FILES['file']['tmp_name'], 'uploads/' . $_FILES['file']['name']);
                    echo "file sent";
                }
        }
    }
    ?>
    <!-- <pre><?php print_r($_FILES)?></pre> -->
    <!-- <pre><?php print_r($pathinfo);?></pre> -->

<!-- -----
FORMS
----- -->

<!-- <section class="url">

        &amp; replaces & in source code HTML -->
        <!-- <a href="/php/hello.php?firstname=John&amp;lastname=Watson&amp;repeat=3">Click Hello !</a>

</section> -->

    <!-- <div>
            <input type="text" name="pseudo" id="pseudo" placeholder="Pseudo">
            <input type="submit" value="Send">
        </div>
        <div>
            <textarea name="message" id="message" cols="20" rows="5" placeholder="Write your message here"></textarea>
            <input type="submit" value="Send">
        </div>
        <div>
            <label for="select">Favorite pet : </label>
            <select name="select" id="select"> 
                <option value="cat">cat</option>
                <option value="dog" selected="selected">dog</option>
                <option value="rabbit">rabbit</option>
                <option value="girlfriend">girlfriend</option>
            </select>
            <input type="submit" value="Send">
        </div>
        <div>
            Language :
            <input type="checkbox" name="checkbox" id="French" value="french">
            <label for="french">French</label>
            <input type="checkbox" name="checkbox" checked="checked" id="Greek" value="greek">
            <label for="greek">Greek</label>
            <input type="checkbox" name="checkbox" id="Italian" value="italian">
            <label for="italian">Italian</label>
            <input type="submit" value="Send">
        </div>
        <div>
            Answer yes or no :
            <input type="radio" name="radio" id="yes" value="yes">
            <label for="yes">yes</label>
            <input type="radio" name="radio" id="no" value="no" checked="checked">
            <label for="no">no</label>
            <input type="submit" value="Send">
        </div>
        <div>
            <input type="hidden" name="hidden" value="hidden value">
        </div>
        <div>
            <label for="file">Upload file:</label>
            <input type="file" name="file" id="file">
            <input type="submit" value="Send">
        </div> -->

<?php include('/php/includes/menu.php') ?>

</body>

</html>