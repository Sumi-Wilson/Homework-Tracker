<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IR=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student View</title>
<link rel="stylesheet" type="text/css" href="/pub/css/style.css">
<script>
    const currentDate = new Date();
    const currentDateElement = document.getElementById('currentDate');
    currentDateElement.value = currentDate.toISOString();
</script>
<script>
function calculateDaysLeft() {
      const dueDateInput = document.getElementById('dueDate');
      const dueDate = new Date(dueDateInput.value);
      const today = new Date();

      const millisecondsInDay = 1000 * 60 * 60 * 24;
      const daysLeft = Math.round((dueDate.getTime() - today.getTime()) / millisecondsInDay);

      const daysLeftElement = document.getElementById('daysLeft');
      daysLeftElement.textContent = `Days left: ${daysLeft}`;


    window.onload = calculateDaysLeft;
</script>
<script>
let status = "Not Started";
</script>
<style>
</style>
</head>
<body>
<p id="currentDate"></p> <br> <p id="daysLeft"></p> <br> <p id="status"</p>
<form method="get" action="/student/assignmentAdd">
<h1> Add Assignment </h1><br>

<label for="course">Course:</label>
    <select id="course" name="course">
      <option value="Math">Mathematics</option>
      <option value="Physics">Physics</option>
      <option value="Chemistry">Chemistry</option>
    </select>
    <br><br>
    <label for="task">Homework:</label>
    <input placeholder="Enter your homework" type="text" id="task" name="task" required>
<br><br>
<label for="dueDate">Due Date:</label><br>
  <input type="date" id="dueDate" name="dueDate" onchange="calculateDaysLeft()">
  <br<br>

    <input type="hidden" id="currentDate" name="currentDate"><br>
    <input type="hidden" id="daysLeft" name="daysLeft"><br>
    <input type="hidden" id="status" name="status"><br>


<br><br>
<center><button type="submit"><b>Add Task</b></button></center>

</form>

</body>
</html>