<?php
header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Headers:*');
$conn = new mysqli("localhost", "root", "", "uas");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = array('error' => false);
$action = '';


if (isset($_GET['action'])) {
    $action = $_GET['action'];
}

if ($action == 'read') {
    $sql = $conn->query("SELECT * FROM departments");
    $users = array();
    while ($row = $sql->fetch_assoc()) {
        array_push($users, $row);
    }
    $result['users'] = $users;
}
$conn->close();

header("Content-type: application/json");
echo json_encode($result);
die();
