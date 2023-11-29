<?php
include 'conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $name = $_POST["name"];
    $email = $_POST["email"];
    $message = $_POST["message"];

    // Validate and sanitize data (you may add more validation)
    $name = htmlspecialchars(trim($name));
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);
    $message = htmlspecialchars(trim($message));

   

    // Insert data into the database
    $insertQuery = "INSERT INTO message (name, email, message) VALUES ('$name', '$email', '$message')";
    $result = mysqli_query($con, $insertQuery);

    // Check if the insertion was successful
    if ($result) {
         header("Location: home.php?success=1");
    } else {
        echo "Error: " . mysqli_error($con);
    }

    // Close the database connection
    mysqli_close($con);
} else {
    // Handle the case when the form is not submitted
    echo "Invalid request";
}


if (isset($_GET['success']) && $_GET['success'] == 1) {
    echo '<div style="color: green;">Data inserted successfully!</div>';
}
?>
