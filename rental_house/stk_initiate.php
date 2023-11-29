<?php
include 'conn.php';

if (isset($_POST['submit'])) {
    date_default_timezone_set('Africa/Nairobi');

    $consumerKey = 'awa3jHCfOyI43mA9pRA7jD69waYHEqJK'; // Fill with your app Consumer Key
    $consumerSecret = '8lQ2xI7z21E3jlTK'; // Fill with your app Secret

    $BusinessShortCode = '174379';
    $Passkey = 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919';

    $PartyA = $_POST['phone'];
    $AccountReference = '2255';
    $TransactionDesc = 'Test Payment';
    $Amount = $_POST['amount'];

    $Timestamp = date('YmdHis');
    $Password = base64_encode($BusinessShortCode . $Passkey . $Timestamp);

    $headers = ['Content-Type:application/json; charset=utf8'];

    $access_token_url = 'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';
    $initiate_url = 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';

    $CallBackURL = 'https://morning-basin-87523.herokuapp.com/callback_url.php';

    // Get the access token
    $curl = curl_init($access_token_url);
    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($curl, CURLOPT_HEADER, FALSE);
    curl_setopt($curl, CURLOPT_USERPWD, $consumerKey . ':' . $consumerSecret);
    $result = curl_exec($curl);

    // Check for errors in the access token request
    if ($result === false) {
        echo 'Error during access token request: ' . curl_error($curl);
        exit;
    }

    $status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    curl_close($curl);

    $result = json_decode($result);

    // Check if access token is successfully obtained
    if (isset($result->access_token)) {
        $access_token = $result->access_token;

        // Prepare headers for stk push
        $stkheader = ['Content-Type:application/json', 'Authorization:Bearer ' . $access_token];

        // Initiate the transaction
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $initiate_url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $stkheader);
        $curl_post_data = array(
            'BusinessShortCode' => $BusinessShortCode,
            'Password' => $Password,
            'Timestamp' => $Timestamp,
            'TransactionType' => 'CustomerPayBillOnline',
            'Amount' => $Amount,
            'PartyA' => $PartyA,
            'PartyB' => $BusinessShortCode,
            'PhoneNumber' => $PartyA,
            'CallBackURL' => $CallBackURL,
            'AccountReference' => $AccountReference,
            'TransactionDesc' => $TransactionDesc
        );

        $data_string = json_encode($curl_post_data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
        $curl_response = curl_exec($curl);

        // Insert data into the database
        if ($curl_response) {
            try {
                // Use the existing database connection
                $con = $con;

                // Use prepared statements to prevent SQL injection
                $stmt = $con->prepare("INSERT INTO payment (PartyA, Amount, TransactionDesc) VALUES (?, ?, ?)");
$stmt->bind_param('sss', $PartyA, $Amount, $TransactionDesc);

$stmt->execute();


                echo "Payment data inserted successfully.";

                // Redirect to main.php
                header("Location: home.php");
                exit;
            } catch (PDOException $e) {
                echo "Error inserting payment data: " . $e->getMessage();
            }
        }

        // Print the response for debugging
        print_r($curl_response);

        echo $curl_response;
    } else {
        echo 'Failed to obtain access token. Details: ' . print_r($result, true);
    }
}
?>
