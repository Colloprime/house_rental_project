<!DOCTYPE html>
<html lang="en">

<head>
    <title>ONLINE HOUSE RENTAL MANAGEMENT SYSTEM</title>
    <link rel="shortcut icon" href="rents.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messages</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #82B2F0; /* Light blue background color */
            margin: 0;
            padding: 0;
        }

        /* Notification container */
        .notification-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #82B2F0; /* WhatsApp green background color */
            color: #fff; /* White text color */
            padding: 15px;
            border-radius: 0;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        /* Styling for the messages */
        .message-container {
            display: flex;
            flex-direction: column;
            max-height: 300px;
            overflow-y: auto;
            padding: 15px;
        }

        .message {
            background-color: #C6DCF8; /* Light green background for messages */
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            color: #000; /* Black text color */
            max-width: 80%;
        }

        .sender {
            font-weight: bold;
            margin-bottom: 5px;
        }

        /* Close button for the notification */
        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            color: #fff; /* White text color */
            font-weight: bold;
        }

        /* Navigation buttons */
        .nav-buttons {
            position: fixed;
            bottom: 10px;
            width: 100%;
            text-align: center;
        }

        .nav-btn {
            background-color: #4caf50; /* Green background color */
            color: #fff; /* White text color */
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 5px;
        }

        .nav-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <?php
    include 'conn.php';

    // Retrieve data from the database
    $selectQuery = "SELECT * FROM message";
    $result = mysqli_query($con, $selectQuery);

    // Check if there are rows in the result
    if (mysqli_num_rows($result) > 0) {
        // Display the notification container
        echo '<div class="notification-container">';
        echo '<span class="close-btn" onclick="this.parentNode.style.display=\'none\'">&times;</span>';
        echo '<h2>Messages</h2>';
        echo '<div class="message-container">';
        while ($row = mysqli_fetch_assoc($result)) {
            echo '<div class="message">';
            echo '<span class="sender">' . $row['name'] . ':</span>';
            echo '<span class="content">' . $row['message'] . '</span>';
            echo '</div>';
        }
        echo '</div>';
        echo '</div>';
    } else {
        echo 'No messages found.';
    }

    // Close the database connection
    mysqli_close($con);
    ?>

    <!-- Navigation buttons -->
    <div class="nav-buttons">
        <button class="nav-btn" onclick="goBack()">Back</button>
    </div>

    <script>
        // Function to navigate back
        function goBack() {
            window.location.href = "manager_home.php";
        }
    </script>
</body>

</html>
