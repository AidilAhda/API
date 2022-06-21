<?php
header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Headers:*');
$conn = new mysqli("localhost", "root", "", "uas");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$out = array('error' => false);

$crud = 'read';

if (isset($_GET['crud'])) {
    $crud = $_GET['crud'];
}


if ($crud == 'read') {
    $sql = "select * from EMPLOYEES";
    $query = $conn->query($sql);
    $members = array();

    while ($row = $query->fetch_array()) {
        array_push($members, $row);
    }

    $out['members'] = $members;
}

if ($crud == 'create') {

    $EMPLOYEE_ID = $_POST['EMPLOYEE_ID'];
    $FIRST_NAME = $_POST['FIRST_NAME'];
    $LAST_NAME = $_POST['LAST_NAME'];
    $EMAIL = $_POST['EMAIL'];
    $PHONE_NUMBER = $_POST['PHONE_NUMBER'];
    $HIRE_DATE = $_POST['HIRE_DATE'];
    $JOB_ID = $_POST['JOB_ID'];
    $SALARY = $_POST['SALARY'];
    $COMMISION = $_POST['COMMISION'];
    $MANAGER_ID = $_POST['MANAGER_ID'];
    $DEPARTMENT_ID = $_POST['DEPARTMENT_ID'];
    $BONUS = $_POST['BONUS'];

    $sql = "INSERT INTO `employees`(`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION`, `MANAGER_ID`, `DEPARTMENT_ID`, `BONUS`) VALUES ('$EMPLOYEE_ID','$FIRST_NAME', '$LAST_NAME','$EMAIL','$PHONE_NUMBER','$HIRE_DATE','$JOB_ID','$SALARY','$COMMISION','$MANAGER_ID','$DEPARTMENT_ID','$BONUS')";
    $query = $conn->query($sql);

    if ($query) {
        $out['message'] = "Member Added Successfully";
    } else {
        $out['error'] = true;
        $out['message'] = "Could not add Member";
    }
}

if ($crud == 'update') {

    $EMPLOYEE_ID = $_POST['EMPLOYEE_ID'];
    $FIRST_NAME = $_POST['FIRST_NAME'];
    $LAST_NAME = $_POST['LAST_NAME'];
    $EMAIL = $_POST['EMAIL'];
    $PHONE_NUMBER = $_POST['PHONE_NUMBER'];
    $HIRE_DATE = $_POST['HIRE_DATE'];
    $JOB_ID = $_POST['JOB_ID'];
    $SALARY = $_POST['SALARY'];
    $COMMISION = $_POST['COMMISION'];
    $MANAGER_ID = $_POST['MANAGER_ID'];
    $DEPARTMENT_ID = $_POST['DEPARTMENT_ID'];
    $BONUS = $_POST['BONUS'];
    $sql = "UPDATE `employees` SET `FIRST_NAME`='$FIRST_NAME',`LAST_NAME`='$LAST_NAME',`EMAIL`='$LAST_NAME',`PHONE_NUMBER`='$PHONE_NUMBER',`HIRE_DATE`='$HIRE_DATE',`JOB_ID`='$JOB_ID',`SALARY`='$SALARY',`COMMISSION`='$COMMISION',`MANAGER_ID`='$MANAGER_ID',`DEPARTMENT_ID`='$DEPARTMENT_ID',`BONUS`='$BONUS' WHERE `EMPLOYEE_ID`='$EMPLOYEE_ID'";
    $query = $conn->query($sql);

    if ($query) {
        $out['message'] = "Member Updated Successfully";
    } else {
        $out['error'] = true;
        $out['message'] = "Could not update Member";
    }
}

if ($crud == 'delete') {

    $EMPLOYEE_ID = $_POST['EMPLOYEE_ID'];

    $sql = "DELETE FROM `employees` WHERE EMPLOYEE_ID = '$EMPLOYEE_ID'";
    $query = $conn->query($sql);

    if ($query) {
        $out['message'] = "Member Deleted Successfully";
    } else {
        $out['error'] = true;
        $out['message'] = "Could not delete Member";
    }
}


$conn->close();

header("Content-type: application/json");
echo json_encode($out);
die();
